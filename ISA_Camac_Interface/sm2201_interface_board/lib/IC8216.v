`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    23:57:05 08/28/2017 
// Design Name: 
// Module Name:    IC8216
// Project Name:   sm2201_interface_board
// Target Devices: 
// Tool versions:  Quartus 12.1 sp1
// Description:    An implementation of chip IC8216 (4bit bus former)
//
// Dependencies: 
//
// Revision: 1.0
// Additional Comments: Analog of К589АП16
//
//////////////////////////////////////////////////////////////////////////////////

module IC8216
(
    input tri [3:0] d_in,
    output tri [3:0] d_out,
    inout tri [3:0] d_bus,
    input wire cs_n,
    input wire dce
);

assign d_out = cs_n == 0 ? (dce == 1 ? d_bus : 4'bz) : 4'bz;
assign d_bus = cs_n == 0 ? (dce == 0 ? d_in : d_bus) : 4'bz;

endmodule
