`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:45:01 01/25/2019
// Design Name:   SN74LS257
// Module Name:   E:/PLD/Sm2201/ISA_Camac_Interface/sm2201_interface_board/SN74LS257_testbench.v
// Project Name:  sm2201_interface_board
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SN74LS257
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SN74LS257_testbench;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg select;
	reg out_control;

	// Outputs
	wire [7:0] y;

	// Instantiate the Unit Under Test (UUT)
	SN74LS257 uut (
		.a(a), 
		.b(b), 
		.select(select), 
		.out_control(out_control), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		select = 0;
		out_control = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

