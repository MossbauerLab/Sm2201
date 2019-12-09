`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    11/15/2019 
// Design Name: 
// Module Name:    rw_trigger
// Project Name:   rw_trigger
// Target Devices: 
// Tool versions:  Quartus 19.1 sp1
// Description:    Operation trigger read or wrire
//
// Dependencies:   src/ip_3604_dig_machine (ROM with image)
//                 /lib/SN74LS00           (2-NAND)
//
// Revision: 1.0
// Additional Comments: 
//                WHEN R is 0 - active level of Read operation
//                WHEN W is 0 - active level of Write operation
//
//////////////////////////////////////////////////////////////////////////////////

module rw_trigger
(
    input wire reset,
    input wire ior,
    input wire iow,
    output wire w,
    output wire r
);

wire d5_y1;
wire d5_y2;

assign w = reset == 1'b1 ? 1'b1 : d5_y1;
assign r = reset == 1'b1 ? 1'b1 : d5_y2;

// DD5
SN74LS00 d5(.a1(ior), .b1(d5_y2), .y1(d5_y1),
            .a2(iow), .b2(d5_y1), .y2(d5_y2));

endmodule
