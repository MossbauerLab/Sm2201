`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:47:52 01/26/2019
// Design Name:   IC82x6
// Module Name:   E:/PLD/Sm2201/ISA_Camac_Interface/sm2201_interface_board/tests/IC8216_testbench.v
// Project Name:  sm2201_interface_board
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IC82x6
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module IC8216_testbench;

	// Inputs
	reg [3:0] d_in;
	reg cs_n;
	reg dce;

	// Outputs
	wire [3:0] d_out;

	// Bidirs
	wire [3:0] d_bus;
	
	// assign d_bus = bus_reg;

	// Instantiate the Unit Under Test (UUT)
	IC82x6 uut (
		.d_in(d_in), 
		.d_out(d_out), 
		.d_bus(d_bus), 
		.cs_n(cs_n), 
		.dce(dce)
	);
	
	reg[3:0] counter;

	initial begin
	   // bus_reg = 0;
		// Trird state, detached from bus
		d_in = 4'b0101;
		cs_n = 1;
		dce = 0;
		
		#200;
		cs_n = 0;
		// data in to data buss
		d_in = 4'b0101;
		counter = 0;

		#200;	
		dce = 1;  // d_bus to d_out
		// bus_reg = 4'b1111;
		

		#200;
		cs_n = 1;
		dce = 0;
	end
	
	always
	begin
	    #100 counter <= counter + 1;
	end
      
endmodule

