`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:46:31 01/25/2019
// Design Name:   SN74LS374
// Module Name:   E:/PLD/Sm2201/ISA_Camac_Interface/sm2201_interface_board/SN74LS374_testbench.v
// Project Name:  sm2201_interface_board
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SN74LS374
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SN74LS374_testbench;

	// Inputs
	reg [7:0] data;
	reg clk;
	reg out_control;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	SN74LS374 uut (
		.data(data), 
		.clk(clk), 
		.out_control(out_control), 
		.out(out)
	);
	
	reg[15:0] counter;

	initial begin
		// Initialize Inputs
		data = 0;
		clk = 0;
		out_control = 1;
		counter = 0;

		// Wait 1 us for global reset to finish
		#1000;
        
		// Add stimulus here
      out_control = 0;
	end
	
	always
	begin
	    #100 data <= data + 1;
		 #10 clk <= ~clk;	 
		 counter <= counter + 1;
	end
      
endmodule

