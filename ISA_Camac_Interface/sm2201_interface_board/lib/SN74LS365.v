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
// Description:    An implementation of chip SN74LS365 / 366 (buffers /inverters)
//                 365 if INVERTED_OUTPUT is 0, 366 if INVERTED_OUTPUT is 1
//
// Dependencies: 
//
// Revision: 
// Revision 1.0
// Additional Comments: Analog of К555ЛП10 / ЛН6
//
//////////////////////////////////////////////////////////////////////////////////

module SN74LS365 #
(
    parameter INVERTED_OUTPUT = 0
)
(
    input wire e1,
    input wire e2,
    input wire [5:0] data,
    output wire [5:0] out 
);

wire ena = e1 | e2;
wire [5:0] data_res;
assign data_res = INVERTED_OUTPUT == 0 ? data : ~data;
assign out = ena == 1'b0 ? data_res : /*6'bZ;*/ 6'b000000;

endmodule
