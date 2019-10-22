`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:13:51 02/05/2019
// Design Name:   IC82x6
// Module Name:   E:/PLD/Sm2201/ISA_Camac_Interface/sm2201_interface_board_testbench.v
// Project Name:  sm2201_interface_board
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created of top level module sm2201_interface_board
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sm2201_interface_board_testbench;

    reg isa_clk;
    reg isa_ior;
    reg isa_iow;
    reg isa_reset;

    // Instantiate the Unit Under Test (UUT)
    sm2201_interface_board
    uut (
        .d_in(d_in), 
        .d_out(d_out), 
        .d_bus(d_bus), 
        .cs_n(cs_n), 
        .dce(dce)
    );

    initial begin
    end
    
    always
    begin
   end
endmodule
