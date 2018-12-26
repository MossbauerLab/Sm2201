`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    23:57:05 08/28/2017 
// Design Name: 
// Module Name:    74LS257
// Project Name:   sm2201_interface_board
// Target Devices: 
// Tool versions:  Quartus 12.1 sp1
// Description:    An implementation of chip 74LS257/258, 257 
//                 if INVERTED_OUTPUT is 0 and 258 if this value is 1
//
// Dependencies: 
//
// Revision: 
// Revision 1.0
// Additional Comments: Analog of К555КП11 (RU)
//
//////////////////////////////////////////////////////////////////////////////////

module SN74LS257 #
(
    INVERTED_OUTPUT = 0
)
(
    input wire [7:0] a,
	 input wire [7:0] b,
	 input wire select,
	 input wire out_control,
	 output tri [7:0] y
);
    wire [7:0] selection;
	 wire [7:0] internal_out;
	 assign selection = select == 0 ? a : b;
	 assign internal_out = INVERTED_OUTPUT == 0 ? selection : 255 - selection;
    
    assign y = out_control == 0 ? internal_out : 'bz;
endmodule
