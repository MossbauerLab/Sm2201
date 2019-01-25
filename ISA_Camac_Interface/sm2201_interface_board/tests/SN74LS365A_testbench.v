`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:30:23 01/26/2019
// Design Name:   SN74LS365
// Module Name:   E:/PLD/Sm2201/ISA_Camac_Interface/sm2201_interface_board/tests/SN74LS365A_testbench.v
// Project Name:  sm2201_interface_board
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SN74LS365
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SN74LS365A_testbench;

	// Inputs
	reg e1;
	reg e2;
	reg [5:0] data;

	// Outputs
	wire [5:0] out;

	// Instantiate the Unit Under Test (UUT)
	SN74LS365 uut (
		.e1(e1), 
		.e2(e2), 
		.data(data), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		e1 = 1;
		e2 = 0;
		data = 0;
		
		#100;
		e2 = 1;

		// Wait 100 ns for global reset to finish
		#100;      
		// Add stimulus here
      e1 = 0;
		
		#100;
		e2 = 0;
	end
      
	always
	begin
	    #100 data <= data + 1;
	end
endmodule

