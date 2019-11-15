`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    23:57:05 08/28/2017 
// Design Name: 
// Module Name:    micro_program_automate
// Project Name:   micro_program_automate
// Target Devices: 
// Tool versions:  Quartus 19.1 sp1
// Description:    Micro programmable automate based on ROM + Synchronous register
//
// Dependencies:   src/ip_3604_dig_machine (ROM with image), /lib/SN74LS374 (register)
//
// Revision: 1.0
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module micro_program_automate #
(
    MICRO_ADDRESS_BUS_WIDTH = 2
)
(
    input wire reset_n,
    input wire clk,
    input wire [MICRO_ADDRESS_BUS_WIDTH - 1 : 0] a,
    input wire w,
    input wire sel,
    input wire tim,
    input wire ie,   // В руководстве ПР полагаю, что это ПРЕРЫВАНИЕ РАЗРЕШЕНО (interrupt enabled)
    output wire rdy,
    output wire c1,
    output wire c2,
    output wire sel2
);

wire [8:0] d15_addr;
wire [3:0] d15_cs;
wire [7:0] d15_out;
wire [7:0] d15_out_pulled;

wire [7:0] d16_data;
wire [7:0] d16_out;

supply0 gnd;
supply1 vcc;

// DD15
assign d15_addr[0] = d16_out[3];
assign d15_addr[1] = d16_out[4];
assign d15_addr[2] = d10_out_pulled[1];
assign d15_addr[3] = d10_out_pulled[0];
assign d15_addr[4] = d9_y3;
assign d15_addr[5] = d16_out[1];
assign d15_addr[6] = tim;
assign d15_addr[7] = w;
assign d15_addr[8] = sel;

assign d15_out_pulled[0] = d15_out[0] == 1'b0 ? 1'b0 : 1'b1;
assign d15_out_pulled[1] = d15_out[1] == 1'b0 ? 1'b0 : 1'b1;
assign d15_out_pulled[2] = d15_out[2] == 1'b0 ? 1'b0 : 1'b1;
assign d15_out_pulled[3] = d15_out[3] == 1'b0 ? 1'b0 : 1'b1;
assign d15_out_pulled[4] = d15_out[4] == 1'b0 ? 1'b0 : 1'b1;
assign d15_out_pulled[5] = d15_out[5] == 1'b0 ? 1'b0 : 1'b1;
assign d15_out_pulled[6] = d15_out[6] == 1'b0 ? 1'b0 : 1'b1;
assign d15_out_pulled[7] = d15_out[7] == 1'b0 ? 1'b0 : 1'b1;

assign d15_cs[0] = vcc;
assign d15_cs[1] = vcc;
assign d15_cs[2] = gnd;
assign d15_cs[3] = gnd;

// DD16
assign d16_data[0] = d15_out_pulled[6];
assign d16_data[1] = cb_cx1;
assign d16_data[2] = d15_out_pulled[0];
assign d16_data[3] = d15_out_pulled[1];
assign d16_data[4] = d15_out_pulled[7];
assign d16_data[5] = d15_out_pulled[5];
assign d16_data[6] = d15_out_pulled[4];
assign d16_data[7] = d15_out_pulled[3];

// DD15
dig_machine_ip3604 d15(.address(d15_addr), .cs(d15_cs), .data(d15_out));

// DD16
SN74LS374 d16(.out_control(gnd), .clk(clk), .data(d16_data), .out(d16_out));

endmodule
