`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    23:57:05 08/28/2017 
// Design Name: 
// Module Name:    SN74LS374
// Project Name:   sm2201_interface_board
// Target Devices: 
// Tool versions:  Quartus 12.1 sp1
// Description:    An implementation of chip SN74LS374 (8bit register) with tri state
//
// Dependencies: 
//
// Revision: 
// Revision 1.0
// Additional Comments: Analog of К555ИР23
//
//////////////////////////////////////////////////////////////////////////////////

module SN74LS374
(
    input wire [7:0] data,
    input wire clk,
    input wire out_control,
    output wire [7:0] out 
);

reg [7:0] out_reg;

assign out = out_control == 1'b1 ? /*8'bz*/ 8'b00000000 : out_reg;

always @(posedge clk)
begin
    if (out_control == 1'b1)
	     out_reg = 8'b00000000;
    out_reg = data;
end

endmodule
