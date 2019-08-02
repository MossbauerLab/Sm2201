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
// Dependencies: 
//
// Revision: 1.0
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module sm2201_interface_board(
    // ISA interface
    input wire [9:0] isa_data,
    input wire isa_ale,
    input wire isa_aen,
    input wire isa_clk,
    input wire isa_chrdy,
    input wire isa_reset,
    input wire isa_ior,
    input wire isa_iow,
    inout wire [7:0] isa_addr,
    output wire [7:0] isa_irq,
    // controller interface bus (common bus = ОШ)
    inout wire [15:0] cb_data,
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
wire d_cel;
wire z_c2;
wire x0;
wire x1;
wire rdy;
wire f_tim;
wire b_cxi;
wire a;
wire g_rd;
wire p_wr;

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

wire d5_y1;

wire d9_y1;

supply0 gnd;
supply1 vcc;

// ######################### LINES ASSIGNMENT ############################

// DD1
assign d1_d[0] = cb_data[12];
assign d1_db[1] = cb_data[14];
assign d1_db[2] = cb_data[13];
assign d1_db[3] = cb_data[15];

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
assign d2_db[0] = cb_data[9];
assign d2_db[1] = cb_data[10];
assign d2_db[2] = cb_data[8];
assign d2_db[3] = cb_data[11];

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

assign d11_db[0] = isa_data[4];
assign d11_db[1] = isa_data[5];
assign d11_db[2] = isa_data[6];
assign d11_db[3] = isa_data[7];

assign d11_do[0] = cb_data[4];
assign d11_do[1] = cb_data[5];
assign d11_do[2] = cb_data[6];
assign d11_do[3] = cb_data[7];

// DD12
assign d12_di[0] = d7_y[0];
assign d12_di[1] = d7_y[1];
assign d12_di[2] = d7_y[3];
assign d12_di[3] = d7_y[2];

assign d12_db[0] = isa_data[0];
assign d12_db[1] = isa_data[1];
assign d12_db[2] = isa_data[2];
assign d12_db[3] = isa_data[3];

assign d12_do[0] = cb_data[0];
assign d12_do[1] = cb_data[1];
assign d12_do[2] = cb_data[2];
assign d12_do[3] = cb_data[3];

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

assign d10_cs[0] = d9_y1;
assign d10_cs[1] = isa_aen;

// assign f_tim = d17_out[5];
// INTERNAL
assign a = f_tim;

// BOARD I/O
assign cb_addr[1] = d17_out[3];   // do we have A0 or not ? i don't know
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
assign isa_irq[7] = b_cxi; // index issue ???? start from 0 or 1, number, e.t.c.

// #######################################################################

// DD1 (BUS former)
IC82x6 #(.INVERTED_OUTPUT(0)) 
    d1 (.dce(gnd), .cs_n(m_w), .d_in(d1_di), .d_bus(d1_db));
	 
// DD4
SN74LS298 d4(.ws(m_w), .clk(n_c1), .s1(d4_s1), .s2(d4_s2), .q(d4_q));

// DD2 (BUS former)
IC82x6 #(.INVERTED_OUTPUT(0)) 
    d2 (.dce(gnd), .cs_n(m_w), .d_in(d2_di), .d_bus(d2_db));

// DD3
SN74LS298 d3(.ws(m_w), .clk(n_c1), .s1(d3_s1), .s2(d3_s2), .q(d3_q));


// DD6
SN74LS257 #(.INVERTED_OUTPUT(0)) 
    d6(.select(k_sel2), .out_control(gnd), .a(d6_a), .b(d6_b), .y(d6_y));

// DD7
SN74LS257 #(.INVERTED_OUTPUT(0)) 
    d7(.select(k_sel2), .out_control(gnd), .a(d7_a), .b(d7_b), .y(d7_y));

// DD11 - IC8226
IC82x6 #(.INVERTED_OUTPUT(1)) 
    d11 (.dce(q_r), .cs_n(d_cel), .d_in(d11_di), .d_bus(d11_db), .d_out(d11_do));

// DD12 - IC8226
IC82x6 #(.INVERTED_OUTPUT(1)) 
    d12 (.dce(q_r), .cs_n(d_cel), .d_in(d12_di), .d_bus(d12_db), .d_out(d12_do));
	 
// DD8 - SN74LS374
SN74LS374 d8(.clk(z_c2), .out_control(gnd), .data(d8_data), .out(d8_out));

// DD13 - SN74LS365
SN74LS365 #(.INVERTED_OUTPUT(0))
    d13(.e1(gnd), .e2(gnd), .data(d13_data), .out(d13_out));

// DD14 - SN74LS365
SN74LS365 #(.INVERTED_OUTPUT(0))
    d14(.e1(gnd), .e2(gnd), .data(d14_data), .out(d14_out));
	 
// DD17 - SN74LS366
SN74LS365 #(.INVERTED_OUTPUT(1))
    d17(.e1(gnd), .e2(gnd), .data(d17_data), .out(d17_out));

// DD18
SN74LS04 d18(.a6(d17_out[5]), .y6(f_tim),
             .a3(cb_prr), .y3(b_cxi)
             /*.a2(cb_prr), y2(a)*/);

// DD5
SN74LS00 d5(.a1(g_rd), .b1(p_wr), y1(d5_y1));

// DD9
SN74LS27 d9(.a1(d5_y1), .b1(d5_y1), .c1(d5_y1), .y1(d9_y1));
				 
// DD10
dig_machine_ip3601 d10(.address(d10_addr), .cs(d10_cs), .data(d10_out));

// DD15
dig_machine_ip3604 d15(.address(), .cs(), .data());

// DD16
SN74LS374 d16(.out_control(), .clk(), .data(), .out());

endmodule
