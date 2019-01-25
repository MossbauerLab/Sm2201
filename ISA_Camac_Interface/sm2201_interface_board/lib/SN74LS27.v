`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    23:57:05 08/28/2017 
// Design Name: 
// Module Name:    SN74LS00
// Project Name:   sm2201_interface_board
// Target Devices: 
// Tool versions:  Quartus 12.1 sp1
// Description:    An implementation of chip SN74LS27 (triple 3 input NOR gate)
//
// Dependencies: 
//
// Revision: 
// Revision 1.0
// Additional Comments: Analog of К555ЛЕ4
//
//////////////////////////////////////////////////////////////////////////////////

module SN74LS27
(
    input wire a1,
    input wire b1, 
    input wire c1,
    output wire y1,
    
    input wire a2,
    input wire b2, 
    input wire c2,
    output wire y2,
    
    input wire a3,
    input wire b3, 
    input wire c3,
    output wire y3
);

assign y1 = ~a1 & ~b1 & ~c1;
assign y2 = ~a2 & ~b2 & ~c2;
assign y3 = ~a3 & ~b3 & ~c3;

endmodule
