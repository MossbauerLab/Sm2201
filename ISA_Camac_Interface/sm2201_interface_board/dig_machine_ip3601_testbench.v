`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    23:57:05 08/28/2017 
// Design Name: 
// Module Name:    dig_machine_ip3601_testbench
// Project Name:   sm2201_interface_board
// Target Devices: 
// Tool versions:  Quartus 12.1 sp1
// Description:    Test on dig_machine_ip3601 work
//
// Dependencies: 
//
// Revision: 
// Revision 1.0
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module dig_machine_ip3601_testbench(

);

    reg [7:0] address;
    reg [1:0] cs;
    wire [3:0] data;
    
    reg clk;

    dig_machine_ip3601 uut(.address(address), .cs(cs), .data(data));

initial
begin
    clk = 0;
    cs = 2'b11;
    address = 8'b00000000;
    #200
    cs = 2'b00;
    #400
    address = 8'b00000011;
    #400
    address = 8'b00001000;
end

always @(*)
begin
     #100 clk <= ~clk;
end

endmodule
