`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    23:57:05 08/28/2017 
// Design Name: 
// Module Name:    SN74LS04
// Project Name:   sm2201_interface_board
// Target Devices: 
// Tool versions:  Quartus 12.1 sp1
// Description:    An implementation of chip SN74LS04 (6 1 bit inverters)
//
// Dependencies: 
//
// Revision: 
// Revision 1.0
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module SN74LS04
(
    input wire a1,
    output wire y1,
    
    input wire a2,
    output wire y2,
    
    input wire a3,
    output wire y3,

    input wire a4,
    output wire y4,
    
    input wire a5,
    output wire y5,
    
    input wire a6,
    output wire y6
);

assign y1 = ~a1;
assign y2 = ~a2;
assign y3 = ~a3;
assign y4 = ~a4;
assign y5 = ~a5;
assign y6 = ~a6;

endmodule
