`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    23:57:05 08/28/2017 
// Design Name: 
// Module Name:    sm2201_interface_board
// Project Name:   sm2201_interface_board
// Target Devices: 
// Tool versions:  Quartus 19.1 sp1
// Description:    SM-2201 Interface Board top module
//                 Adapter between ISA and SM-2201 interface board,
//                 ISA Ports usage:
//                 Common bus usage:
//                     - D15 - D0       Data Line, ()
//                     - PC4(ПК4)       Don't know (C22)
//                     - CX3            Don't know (B22)
//
// Dependencies: Implemented on QMTech Core Board
//               ISA lines connected to U8:
//                   DATA (A2-A9): 7 (C22), 6 (C21), 5 (B22), 4 (B21), 
//                                 3 (N20), 2 (N19), 1 (M20), 0 (M19)
//                   CH RDY (Channel ready, A10): D22
//                   AEN (Address Enable, A11): D21
//                   ADDRESS (A21-A30): 9 (U21), 8 (U22), 7 (V21), 6 (V22), 5 (W21),
//                                      4 (W22), 3 (Y21), 2 (Y22), 1 (AB20), 0 (AA20)
//                   RESET (B2): AA19
//                   IRQ2 (B4): AB19
//                   IOW (B13): J22
//                   IOR (B14): K21
//                   CLK (B20) : E22
//                   IRQ7 (B21): R22
//                   IRQ6 (B22): R21
//                   IRQ5 (B23): P22
//                   IRQ4 (B24): P21
//                   IRQ3 (B25): N22
//                   ALE (Address Latch Enable, B28): E21
//                   
//               CAMAC lines connected to U7
//
// Revision: 1.0
// Additional Comments: D1 + D2 or D3 + D4 are sources for D6 + D7
//
//////////////////////////////////////////////////////////////////////////////////

module sm2201_interface_board(
    // ISA interface
    inout wire [7:0] isa_data,
    input wire isa_ale,
    input wire isa_aen,
    input wire isa_clk,
    output wire isa_chrdy,
    input wire isa_reset,
    input wire isa_ior,
    input wire isa_iow,
    input wire [9:0] isa_addr,
    output wire [7:0] isa_irq,
    // controller interface bus (common bus = ОШ)
    inout wire [15:0] cb_data,
    input wire cb_prr,
    output wire cb_cx1,
    input wire cb_zk4,               // X 2.2 B21 ЗК4 ???
    output wire [11:0] cb_addr,
    output wire cb_prepare_bus,      // ОШ ПОДГ.
    output wire cb_b_b1,             // ОШ B/B1
    output wire cb_pc4,              // ОШ ПК4        ???
    output wire cb_cx3,              // ОШ СХ3
    // debug pins
    output wire d_sel_debug,
    output wire l_sel1_debug,
    output wire k_sel2_debug,
    output wire m_w_debug,
    output wire q_r_debug,
    output wire n_c1_debug,
    output wire z_c2_debug
    //output wire x0_debug,
    //output wire x1_debug,
    //output wire [3:0] d10_data_debug
    //output wire [8:0] d15_addr_debug
);

wire m_w;
wire n_c1;
wire k_sel2;
wire q_r;
wire d_sel;
wire z_c2;
wire x0;
wire x1;
wire rdy;
// wire f_tim;
// wire f_tim_pulled;
wire b_cxi;
wire b_cxi_pulled;
wire g_rd;
wire p_wr;
wire l_sel1;
wire v_rp;

wire [3:0] d1_di;
wire [3:0] d1_db;

wire [3:0] d2_di;
wire [3:0] d2_db;

wire [3:0] d3_s1;
wire [3:0] d3_s2;
wire [3:0] d3_q;

wire [3:0] d4_s1;
wire [3:0] d4_s2;
wire [3:0] d4_q;

wire [3:0] d6_a;
wire [3:0] d6_b;
wire [3:0] d6_y;

wire [3:0] d7_a;
wire [3:0] d7_b;
wire [3:0] d7_y;

wire [7:0] d8_data;
wire [7:0] d8_out;

wire [3:0] d11_di;
wire [3:0] d11_db;
wire [3:0] d11_do;

wire [3:0] d12_di;
wire [3:0] d12_db;
wire [3:0] d12_do;

wire [5:0] d13_data;
wire [5:0] d13_out;

wire [5:0] d14_data;
wire [5:0] d14_out;

wire [5:0] d17_data;
wire [5:0] d17_out;

//wire [7:0] d10_addr;
//wire [1:0] d10_cs;
//wire [3:0] d10_out;
//wire [3:0] d10_out_pulled;

//wire [8:0] d15_addr;
//wire [3:0] d15_cs;
//wire [7:0] d15_out;
//wire [7:0] d15_out_pulled;

wire d5_y1;
wire d5_y2;
//wire d5_y3;

//wire d9_y1;
//wire d9_y2;
//wire d9_y3;

//wire [7:0] d16_data;
//wire [7:0] d16_out;

wire [1:0] micro_program_automate_addr;
wire interrupt_en;

supply0 gnd;
supply1 vcc;

reg global_reset;
reg [7:0] counter;

localparam reg[7:0] RESET_COUNTER = 10;


// ######################### LINES ASSIGNMENT ############################
// DD1
/*assign d1_db[0] = cb_data[12];
assign d1_db[1] = cb_data[14];
assign d1_db[2] = cb_data[13];
assign d1_db[3] = cb_data[15];*/

assign d1_di[0] = d4_q[0];
assign d1_di[1] = d4_q[2];
assign d1_di[2] = d4_q[3];
assign d1_di[3] = d4_q[1];

// DD4
assign d4_s1[0] = cb_data[4];
assign d4_s1[1] = cb_data[7];
assign d4_s1[2] = cb_data[6];
assign d4_s1[3] = cb_data[5];

assign d4_s2[0] = cb_data[12];
assign d4_s2[1] = cb_data[15];
assign d4_s2[2] = cb_data[14];
assign d4_s2[3] = cb_data[13];

// DD2
/*assign d2_db[0] = cb_data[9];
assign d2_db[1] = cb_data[10];
assign d2_db[2] = cb_data[8];
assign d2_db[3] = cb_data[11];*/

assign d2_di[0] = d3_q[0];
assign d2_di[1] = d3_q[2];
assign d2_di[2] = d3_q[3];
assign d2_di[3] = d3_q[1];

// DD3
assign d3_s1[0] = cb_data[1];
assign d3_s1[1] = cb_data[3];
assign d3_s1[2] = cb_data[2];
assign d3_s1[3] = cb_data[0];

assign d3_s2[0] = cb_data[9];
assign d3_s2[1] = cb_data[11];
assign d3_s2[2] = cb_data[10];
assign d3_s2[3] = cb_data[8];

// DD6
assign d6_a[0] = d4_q[0];
assign d6_a[1] = d4_q[3];
assign d6_a[2] = d4_q[1];
assign d6_a[3] = d4_q[2];

assign d6_b[0] = cb_data[4];
assign d6_b[1] = cb_data[5];
assign d6_b[2] = cb_data[7];
assign d6_b[3] = cb_data[6];

// DD7
assign d7_a[0] = d3_q[0];
assign d7_a[1] = d3_q[3];
assign d7_a[2] = d3_q[1];
assign d7_a[3] = d3_q[2];

assign d7_b[0] = cb_data[1];
assign d7_b[1] = cb_data[0];
assign d7_b[2] = cb_data[3];
assign d7_b[3] = cb_data[2];

// DD11
assign d11_di[0] = d6_y[0];
assign d11_di[1] = d6_y[1];
assign d11_di[2] = d6_y[3];
assign d11_di[3] = d6_y[2];

//assign d11_db[0] = isa_data[4];
//assign d11_db[1] = isa_data[5];
//assign d11_db[2] = isa_data[6];
//assign d11_db[3] = isa_data[7];

// DD12
assign d12_di[0] = d7_y[0];
assign d12_di[1] = d7_y[1];
assign d12_di[2] = d7_y[3];
assign d12_di[3] = d7_y[2];

//assign d12_db[0] = isa_data[0];
//assign d12_db[1] = isa_data[1];
//assign d12_db[2] = isa_data[2];
//assign d12_db[3] = isa_data[3];

// DD8
assign d8_data[0] = cb_data[5];
assign d8_data[1] = cb_data[0];
assign d8_data[2] = cb_data[6];
assign d8_data[3] = cb_data[1];
assign d8_data[4] = cb_data[3];
assign d8_data[5] = cb_data[7];
assign d8_data[6] = cb_data[2];
assign d8_data[7] = cb_data[4];

// DD13
assign d13_data[0] = vcc;
assign d13_data[1] = d8_out[0];
assign d13_data[2] = d8_out[2];
assign d13_data[3] = x0;
assign d13_data[4] = x1;
assign d13_data[5] = m_w;

// DD14
assign d14_data[0] = d8_out[6];
assign d14_data[1] = d8_out[3];
assign d14_data[2] = d8_out[4];
assign d14_data[3] = d8_out[1];
assign d14_data[4] = d8_out[7];
assign d14_data[5] = vcc;

// DD17
assign d17_data[0] = isa_addr[4];
assign d17_data[1] = isa_addr[3];
assign d17_data[2] = isa_addr[2];
assign d17_data[3] = isa_addr[1];
assign d17_data[4] = isa_reset;
assign d17_data[5] = rdy;


// INTERNAL
//assign l_sel1 = d10_out_pulled[2];
//assign x0 = d15_out_pulled[2]; // ===========================> move to micro program automate
//assign rdy = d16_out[2];       // ===========================> move to micro program automate
assign m_w = d5_y1;
assign q_r = d5_y2;
//assign x1 = d16_out[0];        // ===========================> move to micro program automate
//assign z_c2 = d16_out[5];
//assign n_c1 = d16_out[6];
//assign k_sel2 = d16_out[7];
assign v_rp = d8_out[5];
assign g_rd = isa_ior;
assign p_wr = isa_iow;
assign b_cxi_pulled = b_cxi == 1'b0 ? b_cxi : 1'b1;
// assign f_tim_pulled = f_tim == 1'b0 ? f_tim : 1'b1;


// BOARD I/O
assign cb_addr[0] = gnd;                 // i have not seen driver for 0 index
assign cb_addr[1] = d17_out[3];          // do we have A0 or not ? i don't know
assign cb_addr[2] = d17_out[2];
assign cb_addr[3] = d17_out[1];
assign cb_addr[4] = d17_out[0];
assign cb_addr[5] = d14_out[3];
assign cb_addr[6] = d14_out[1];
assign cb_addr[7] = d14_out[0];
assign cb_addr[8] = d14_out[2];
assign cb_addr[9] = d14_out[4];
assign cb_addr[10] = d13_out[1];
assign cb_addr[11] = d13_out[2];
assign cb_pc4 = d13_out[3];
assign cb_cx3 = d13_out[4];
assign cb_b_b1 = d13_out[5];
assign cb_prepare_bus = d17_out[4];
assign cb_cx1 = b_cxi_pulled;
//assign isa_chrdy = vcc;
assign isa_irq[7] = b_cxi_pulled == 1'b0 ? 1'b0: 1'b1;
assign isa_irq[0] = vcc;
assign isa_irq[1] = vcc;
assign isa_irq[2] = vcc;
assign isa_irq[3] = vcc;
assign isa_irq[4] = vcc;
assign isa_irq[5] = vcc;
assign isa_irq[6] = vcc;

assign cb_data[4] = d11_do[0];
assign cb_data[5] = d11_do[1];
assign cb_data[6] = d11_do[2];
assign cb_data[7] = d11_do[3];

assign cb_data[0] = d12_do[0];
assign cb_data[1] = d12_do[1];
assign cb_data[2] = d12_do[2];
assign cb_data[3] = d12_do[3];

assign cb_data[12] = d1_db[0];
assign cb_data[14] = d1_db[1];
assign cb_data[13] = d1_db[2];
assign cb_data[15] = d1_db[3];

assign cb_data[9] = d2_db[0];
assign cb_data[10] = d2_db[1];
assign cb_data[8] = d2_db[2];
assign cb_data[11] = d2_db[3];

assign isa_data[0] = d12_db[0];
assign isa_data[1] = d12_db[1];
assign isa_data[2] = d12_db[2];
assign isa_data[3] = d12_db[3];
assign isa_data[4] = d11_db[0];
assign isa_data[5] = d11_db[1];
assign isa_data[6] = d11_db[2];
assign isa_data[7] = d11_db[3];

// Debug
assign d_sel_debug = d_sel;
assign l_sel1_debug = l_sel1;
assign k_sel2_debug = k_sel2;
assign m_w_debug = m_w;
assign q_r_debug = q_r;
// assign f_tim_debug = f_tim_pulled;
assign n_c1_debug = n_c1;
assign z_c2_debug = z_c2;
//assign x0_debug = x0;
//assign x1_debug = x1;
//assign d10_data_debug = d10_out_pulled;
//assign d15_addr_debug = d15_addr;

// #######################################################################

/* DD1 (BUS former)
 * Passes data to CAMAC BUS from DD3 
 * Mode was permanently set to always write to bus (di -> db) when m_w is 0
 * therefore it captures data from s1 lines d3_s1 -> db
 */
IC82x6 #(.INVERTED_OUTPUT(0)) 
   d1 (.dce(gnd), .cs_n(m_w), .d_in(d1_di), .d_bus(d1_db));

/* DD2 (BUS former)
 * Passes data to CAMAC BUS from DD4
 * Mode was permanently set to always write to bus (di -> db) when m_w is 0
 * therefore it captures data from s1 lines d4_s1 -> db
 */
IC82x6 #(.INVERTED_OUTPUT(0)) 
    d2 (.dce(gnd), .cs_n(m_w), .d_in(d2_di), .d_bus(d2_db));

/* DD3 (Multiplexer)
 * Switches Camac Data Lines to out according to address (ws) signal,
 * Data sampling triggers by posedge on clk line
 */
SN74LS298 d3(.ws(m_w), .clk(n_c1), .reset(global_reset), .s1(d3_s1), .s2(d3_s2), .q(d3_q));

/* DD4 (Multiplexer)
 * Switches Camac Data Lines to out according to address (ws) signal
 * Data sampling triggers by posedge on clk line
 */
SN74LS298 d4(.ws(m_w), .clk(n_c1), .reset(global_reset), .s1(d4_s1), .s2(d4_s2), .q(d4_q));

/* DD6 (Multiplexer)
 * Passing data to multiplexer out from D3 or from CAMAC BUS directly
 */
SN74LS257 #(.INVERTED_OUTPUT(0)) 
    d6(.select(k_sel2), .out_control(gnd), .a(d6_a), .b(d6_b), .y(d6_y));

/* DD7 (Multiplexer)
 * Passing data to multiplexer out from D4 or from CAMAC BUS directly
 */
SN74LS257 #(.INVERTED_OUTPUT(0)) 
    d7(.select(k_sel2), .out_control(gnd), .a(d7_a), .b(d7_b), .y(d7_y));

/* DD8 - SN74LS374 (Register)
 * Passing data from input lines to out by clock, enabled by one on out_control line,
 * Permanently enabled by gnd
 */
SN74LS374 d8(.clk(z_c2), .reset(global_reset), .out_control(gnd), .data(d8_data), .out(d8_out));

/* DD11 - IC8226 (Buffer)
 * DI
 * DB - connected to ISA DATA
 * DO - connected to CAMAC BUS
 */
IC82x6 #(.INVERTED_OUTPUT(1)) 
    d11 (.dce(q_r), .cs_n(d_sel), .d_in(d11_di), .d_bus(d11_db), .d_out(d11_do));
 
/* DD12 - IC8226 (Buffer)
 * DI
 * DB - connected to ISA DATA
 * DO - connected to CAMAC BUS
 */
IC82x6 #(.INVERTED_OUTPUT(1)) 
    d12 (.dce(q_r), .cs_n(d_sel), .d_in(d12_di), .d_bus(d12_db), .d_out(d12_do));

// DD13 - SN74LS365
SN74LS365 #(.INVERTED_OUTPUT(0))
    d13(.e1(gnd), .e2(gnd), .data(d13_data), .out(d13_out));

// DD14 - SN74LS365
SN74LS365 #(.INVERTED_OUTPUT(0))
    d14(.e1(l_sel1), .e2(l_sel1), .data(d14_data), .out(d14_out));

// DD17 - SN74LS366
SN74LS365 #(.INVERTED_OUTPUT(1))
    d17(.e1(gnd), .e2(gnd), .data(d17_data), .out(d17_out));

// DD18 - SN74LS366 (К155ЛП9)
SN74LS07 d18(.a6(d17_out[5]), .y6(f_tim),
             .a3(cb_prr), .y3(b_cxi),
             .a1(rdy), .y1(isa_chrdy)
             );

// DD5
SN74LS00 d5(.a1(isa_ior), .b1(d5_y2), .y1(d5_y1),
            .a2(isa_iow), .b2(d5_y1), .y2(d5_y2)
            );

address_request_decoder addr_decoder(.address(isa_addr), .ale(isa_ale), .aen(isa_aen), .ior(g_rd), .iow(p_wr), 
                                     .interrupt_req(v_rp), .zk4(cb_zk4), .sel(d_sel), .sel1(l_sel1), 
                                     .internal_address(micro_program_automate_addr), .interrupt_en(interrupt_en));

micro_program_automate automate (.reset(global_reset), .clk(isa_clk), 
                                 .a(micro_program_automate_addr), .w(m_w), .sel(d_sel), .tim(f_tim),
                                 .ie(interrupt_en), .cx1(b_cxi_pulled),
                                 .rdy(rdy), .c1(n_c1), .c2(z_c2), .sel2(k_sel2), .x0(x0), .x1(x1));

always @(posedge isa_clk)
begin
    if (global_reset != 1'b1)
    begin
        if (counter != RESET_COUNTER)
        begin
            counter <= 0;
            global_reset <= 1;
        end
    end
    else
    begin
        if (counter < RESET_COUNTER)
            counter <= counter + 1;
        else
            global_reset <= 0;
    end
end

endmodule
