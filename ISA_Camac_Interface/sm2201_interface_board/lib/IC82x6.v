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
// Description:    An implementation of chip IC8216 and 8226 (4bit bus former)
//                 8216 - buffers, 8226 - inverters (INVERTED_OUTPUT must be set to 1)
//
// Dependencies: 
//
// Revision: 1.0
// Additional Comments: Analog of К589АП16 & К589АП26
//
//////////////////////////////////////////////////////////////////////////////////

module IC82x6 #
(
    parameter INVERTED_OUTPUT = 0
)
(
    input wire [3:0] d_in,
    output wire [3:0] d_out,
    inout wire [3:0] d_bus,
    input wire cs_n,
    input wire dce
);

wire [3:0] d_bus_write;
wire [3:0] d_in_value;
wire [3:0] d_bus_value;

assign d_in_value = (INVERTED_OUTPUT == 0) ? d_in : ~d_in;
assign d_bus_value = (INVERTED_OUTPUT == 0) ? d_bus : ~d_bus;

assign d_bus = (cs_n == 1'b0) ? d_bus_write : 4'bz;
assign d_bus_write = (/*cs_n == 1'b0 &&*/ dce == 1'b0) ? d_in_value : 4'b0000;
assign d_out = (/*cs_n == 1'b0 &&*/ dce == 1'b1) ? d_bus_value : 4'bz;

endmodule
