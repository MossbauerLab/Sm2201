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
    output wire [7:0] isa_addr,
    output wire [4:0] isa_irq,
    // Controller interface bus (common bus = ОШ)
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
wire [3:0] d1_di_lines;
wire [3:0] d1_db_lines;
wire [3:0] d2_di_lines;
wire [3:0] d2_db_lines;
wire [3:0] d3_s1_lines;
wire [3:0] d3_s2_lines;
wire [3:0] d3_q_lines;
wire [3:0] d4_s1_lines;
wire [3:0] d4_s2_lines;
wire [3:0] d4_q_lines;
supply0 gnd;

// DD1
assign d1_db_lines[0] = cb_data[12];
assign d1_db_lines[1] = cb_data[14];
assign d1_db_lines[2] = cb_data[13];
assign d1_db_lines[3] = cb_data[15];

assign d1_di_lines[0] = d4_q_lines[0];
assign d1_di_lines[1] = d4_q_lines[2];
assign d1_di_lines[2] = d4_q_lines[3];
assign d1_di_lines[3] = d4_q_lines[1];

// DD4
assign d4_s1_lines[0] = cb_data[4];
assign d4_s1_lines[1] = cb_data[7];
assign d4_s1_lines[2] = cb_data[6];
assign d4_s1_lines[3] = cb_data[5];

assign d4_s2_lines[0] = cb_data[12];
assign d4_s2_lines[1] = cb_data[15];
assign d4_s2_lines[2] = cb_data[14];
assign d4_s2_lines[3] = cb_data[13];

// DD2
assign d2_db_lines[0] = cb_data[9];
assign d2_db_lines[1] = cb_data[10];
assign d2_db_lines[2] = cb_data[8];
assign d2_db_lines[3] = cb_data[11];

assign d2_di_lines[0] = d3_q_lines[0];
assign d2_di_lines[1] = d3_q_lines[2];
assign d2_di_lines[2] = d3_q_lines[3];
assign d2_di_lines[3] = d3_q_lines[1];

// DD3
assign d3_s1_lines[0] = cb_data[1];
assign d3_s1_lines[1] = cb_data[3];
assign d3_s1_lines[2] = cb_data[2];
assign d3_s1_lines[3] = cb_data[0];

assign d3_s2_lines[0] = cb_data[9];
assign d3_s2_lines[1] = cb_data[11];
assign d3_s2_lines[2] = cb_data[10];
assign d3_s2_lines[3] = cb_data[8];

// DD1 (BUS former)
IC82x6 #(.INVERTED_OUTPUT(0)) 
    d1 (.dce(gnd), .cs_n(m_w), .d_in(d1_di_lines), .d_bus(d1_db_lines));
	 
// DD4
SN74LS298 d4(.ws(m_w), .clk(n_c1), .s1(d4_s1_lines), .s2(d4_s2_lines), .q(d4_q_lines));

// DD2 (BUS former)
IC82x6 #(.INVERTED_OUTPUT(0)) 
    d2 (.dce(gnd), .cs_n(m_w), .d_in(d2_di_lines), .d_bus(d2_db_lines));

// DD3
SN74LS298 d3(.ws(m_w), .clk(n_c1), .s1(d3_s1_lines), .s2(d3_s2_lines), .q(d3_q_lines));
endmodule
