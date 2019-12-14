`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    23:57:05 08/28/2017 
// Design Name: 
// Module Name:    74LS298
// Project Name:   sm2201_interface_board
// Target Devices: 
// Tool versions:  Quartus 12.1 sp1
// Description:    An implementation of chip 74LS298 (2 4bit - 1 multiplexer) with data storage
//
// Dependencies: 
//
// Revision: 
// Revision 1.0
// Additional Comments: Analog of К555КП13
//
//////////////////////////////////////////////////////////////////////////////////

module SN74LS298 
(
    input wire [3:0] s1,         // source 1: MSB -> A1, B1, C1, D1 <- LSB
    input wire [3:0] s2,         // source 2: MSB -> A2, B2, C2, D2 <- LSB
    input wire ws,               // word or source select
    input wire clk,
    input wire reset,
    output reg [3:0] q           // output: MSB -> QA QB QC QD <- LSB
);

always @(negedge clk)
begin
    if (reset == 1'b1)
    begin
        q <= 0;
    end
    else
    begin
        if (ws == 1'b0)
            q <= s1;
        else q <= s2;
    end
end

endmodule
