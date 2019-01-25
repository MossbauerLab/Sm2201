`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    23:57:05 08/28/2017 
// Design Name: 
// Module Name:    SN74LS365
// Project Name:   sm2201_interface_board
// Target Devices: 
// Tool versions:  Quartus 12.1 sp1
// Description:    An implementation of chip SN74LS365 (3 state HEX buffers)
//
// Dependencies: 
//
// Revision: 
// Revision 1.0
// Additional Comments: Analog of К555ЛП10
//
//////////////////////////////////////////////////////////////////////////////////

module SN74LS365
(
    input wire e1,
    input wire e2,
    input wire [5:0] data,
    output tri [5:0] out 
);

wire ena = e1 | e2;
assign out = ena = 1'b0 ? data : 6'bZ;

endmodule
