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
    inout reg [15:0] cb_data,
    input wire cb_prr,
    input wire cb_cx1,
    input wire cb_zk4,               // X 2.2 B21 ЗК4 ???
    output wire [11:0] cb_addr,
    output wire cb_prepare_bus,      // ОШ ПОДГ.
    output wire cb_b_b1,             // ОШ B/B1
    output wire cb_pc4,              // ОШ ПК4        ???
    output wire cb_cx3               // ОШ СХ3
    
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
wire f_tim;
wire b_cxi;
wire a;
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

wire [7:0] d10_addr;
wire [1:0] d10_cs;
wire [3:0] d10_out;

wire [8:0] d15_addr;
wire [3:0] d15_cs;
wire [7:0] d15_out;

wire d5_y1;
wire d5_y2;
wire d5_y3;

wire d9_y1;
wire d9_y2;
wire d9_y3;

wire [7:0] d16_data;
wire [7:0] d16_out;

supply0 gnd;
supply1 vcc;

reg [7:0] cb_data_out_l;
reg [7:0] cb_data_out_h;

// ######################### LINES ASSIGNMENT ############################

// DD1
/*assign d1_db[0] = cb_data[12];
assign d1_db[1] = cb_data[14];
assign d1_db[2] = cb_data[13];
assign d1_db[3] = cb_data[15];*/

assign d1_di[0] = d3_q[0];
assign d1_di[1] = d3_q[2];
assign d1_di[2] = d3_q[3];
assign d1_di[3] = d3_q[1];

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

assign d2_di[0] = d4_q[0];
assign d2_di[1] = d4_q[2];
assign d2_di[2] = d4_q[3];
assign d2_di[3] = d4_q[1];

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

assign d11_db[0] = isa_data[4];
assign d11_db[1] = isa_data[5];
assign d11_db[2] = isa_data[6];
assign d11_db[3] = isa_data[7];

// DD12
assign d12_di[0] = d7_y[0];
assign d12_di[1] = d7_y[1];
assign d12_di[2] = d7_y[3];
assign d12_di[3] = d7_y[2];

assign d12_db[0] = isa_data[0];
assign d12_db[1] = isa_data[1];
assign d12_db[2] = isa_data[2];
assign d12_db[3] = isa_data[3];

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

// DD10
assign d10_addr[0] = isa_addr[6];
assign d10_addr[1] = isa_addr[5];
assign d10_addr[2] = isa_addr[4];
assign d10_addr[3] = isa_addr[3];
assign d10_addr[4] = isa_addr[2];
assign d10_addr[5] = isa_addr[1];
assign d10_addr[6] = isa_addr[0];
assign d10_addr[7] = isa_ale;

assign d10_cs[0] = vcc;//d9_y1;
assign d10_cs[1] = vcc;//isa_aen;

// DD15
assign d15_addr[0] = d16_out[3];
assign d15_addr[1] = d16_out[4];
assign d15_addr[2] = d10_out[1];
assign d15_addr[3] = d10_out[0];
assign d15_addr[4] = d9_y3;
assign d15_addr[5] = d16_out[1];
assign d15_addr[6] = f_tim;
assign d15_addr[7] = m_w;
assign d15_addr[8] = d_sel;

// ???????????????????????????????????????????????????
assign d15_cs[0] = a;//gnd;//vcc;//a;
assign d15_cs[1] = a;//gnd;//vcc;//a;
assign d15_cs[2] = vcc;//gnd;
assign d15_cs[3] = vcc;//gnd;
// ???????????????????????????????????????????????????

// DD16
assign d16_data[0] = d15_out[6];
assign d16_data[1] = cb_cx1;
assign d16_data[2] = d15_out[0];
assign d16_data[3] = d15_out[1];
assign d16_data[4] = d15_out[7];
assign d16_data[5] = d15_out[5];
assign d16_data[6] = d15_out[4];
assign d16_data[7] = d15_out[3];

// assign f_tim = d17_out[5];
// INTERNAL
assign a = f_tim; // !!!!!!!!!!!!!!!!!!!! A is a strange thing !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
assign l_sel1 = d10_out[2];
assign x0 = d15_out[2];
assign rdy = d16_out[2];
assign m_w = d5_y1;
assign q_r = d5_y2;
assign x1 = d16_out[0];
assign z_c2 = d16_out[5];
assign n_c1 = d16_out[6];
assign k_sel2 = d16_out[7];
assign v_rp = d8_out[5];

// BOARD I/O
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
assign isa_irq[7] = b_cxi;               // index issue ???? start from 0 or 1, number, e.t.c.
assign isa_irq[0] = vcc;
assign isa_irq[1] = vcc;
assign isa_irq[2] = vcc;
assign isa_irq[3] = vcc;
assign isa_irq[4] = vcc;
assign isa_irq[5] = vcc;
assign isa_irq[6] = vcc;

/*assign cb_data[4] = d11_do[0];
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
assign cb_data[11] = d2_db[3];*/

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
SN74LS298 d3(.ws(m_w), .clk(n_c1), .s1(d3_s1), .s2(d3_s2), .q(d3_q));

/* DD4 (Multiplexer)
 * Switches Camac Data Lines to out according to address (ws) signal
 * Data sampling triggers by posedge on clk line
 */
SN74LS298 d4(.ws(m_w), .clk(n_c1), .s1(d4_s1), .s2(d4_s2), .q(d4_q));

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
SN74LS374 d8(.clk(z_c2), .out_control(gnd), .data(d8_data), .out(d8_out));

/* DD11 - IC8226 (Buffer)
 * DI
 * DB
 * DO - connected to CAMAC BUS
 */
IC82x6 #(.INVERTED_OUTPUT(1)) 
    d11 (.dce(q_r), .cs_n(d_sel), .d_in(d11_di), .d_bus(d11_db), .d_out(d11_do));
 
/* DD12 - IC8226 (Buffer)
 * DI
 * DB
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

// DD18
SN74LS04 d18(.a6(d17_out[5]), .y6(f_tim),
             .a3(cb_prr), .y3(b_cxi),
				 .a1(d16_out[2]), .y1(isa_chrdy));

// DD5
SN74LS00 d5(.a1(g_rd|isa_ior), .b1(d5_y2), .y1(d5_y1),
            .a2(p_wr|isa_iow), .b2(d5_y1), .y2(d5_y2),
            .a3(g_rd), .b3(p_wr), .y3(d5_y3),
            .a4(d9_y2), .b4(isa_addr[9]), .y4(d_sel));

// DD9
SN74LS27 d9(.a1(d5_y3), .b1(d5_y3), .c1(d5_y3), .y1(d9_y1),
            .a2(isa_addr[7]), .b2(d10_out[3]), .c2(isa_addr[9]), .y2(d9_y2),
				.a3(v_rp), .b3(cb_zk4), .c3(v_rp), .y3(d9_y3));
				 
// DD10
dig_machine_ip3601 d10(.address(d10_addr), .cs(d10_cs), .data(d10_out));

// DD15
dig_machine_ip3604 d15(.address(d15_addr), .cs(d15_cs), .data(d15_out));

// DD16
SN74LS374 d16(.out_control(gnd), .clk(isa_clk), .data(d16_data), .out(d16_out));

always @(*)
begin
    cb_data_out_l[0] = d12_do[0];
    cb_data_out_l[1] = d12_do[1];
    cb_data_out_l[2] = d12_do[2];
    cb_data_out_l[3] = d12_do[3];
	 
	 cb_data_out_l[4] = d11_do[0];
	 cb_data_out_l[5] = d11_do[1];
    cb_data_out_l[6] = d11_do[2];
    cb_data_out_l[7] = d11_do[3];

    cb_data_out_h[1] = d2_db[0];
    cb_data_out_h[2] = d2_db[1];
    cb_data_out_h[0] = d2_db[2];
    cb_data_out_h[3] = d2_db[3];
	 	 
    cb_data_out_h[4] = d1_db[0];
    cb_data_out_h[6] = d1_db[1];
    cb_data_out_h[5] = d1_db[2];
    cb_data_out_h[7] = d1_db[3];
	 
    if (m_w == 1'b0)
	     cb_data[15:8] = cb_data_out_h[7:0];
	 //cb_data[15:8] = m_w == 1'b0 ? cb_data_out_h[7:0] : cb_data[15:8];
	 if (d_sel == 1'b0 & q_r == 1'b1)
	     cb_data[7:0] = cb_data_out_l[7:0];
	 //cb_data[7:0] = d_sel == 1'b0 & q_r == 1'b1 ? cb_data_out_l[7:0] : cb_data[7:0];
end

endmodule
