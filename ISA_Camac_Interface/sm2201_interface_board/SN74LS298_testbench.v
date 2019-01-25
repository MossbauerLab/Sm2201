`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:45:50 01/25/2019
// Design Name:   SN74LS298
// Module Name:   E:/PLD/Sm2201/ISA_Camac_Interface/sm2201_interface_board/SN74LS298_testbench.v
// Project Name:  sm2201_interface_board
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SN74LS298
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SN74LS298_testbench;

	// Inputs
	reg [3:0] s1;
	reg [3:0] s2;
	reg ws;
	reg clk;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	SN74LS298 uut (
		.s1(s1), 
		.s2(s2), 
		.ws(ws), 
		.clk(clk), 
		.q(q)
	);
	
	reg [3:0] counter;

	initial begin
		// Initialize Inputs
		s1 = 4'b0110;
		s2 = 4'b1001;
		ws = 0;
		clk = 0;
		counter = 0;

		// Wait 100 ns for global reset to finish
		#1000;
        
		// Add stimulus here

	end
	
	always
	begin
	    #100 clk <= ~clk;
		 counter <= counter + 1;
		 ws = counter < 8 ? 0 : 1;
	end
      
endmodule

