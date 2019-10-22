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
// Description:    An implementation of chip SN74LS07 (6 1 bit buffers)
//
// Dependencies: 
//
// Revision: 
// Revision 1.0
// Additional Comments: Analog of К555ЛП9
//
//////////////////////////////////////////////////////////////////////////////////

module SN74LS07
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

buf(y1, a1);
buf(y2, a2);
buf(y3, a3);
buf(y4, a4);
buf(y5, a5);
buf(y6, a6);

endmodule
