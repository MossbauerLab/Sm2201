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
	
	localparam [3:0] TEST_VALUE_1 = 4'b0101;
	localparam [3:0] TEST_VALUE_2 = 4'b0001;
	localparam [3:0] TEST_VALUE_3 = 4'b1001;
	
	reg [3:0] d_bus_reg;
	wire [3:0] d_bus_net;
	reg d_bus_source = 1'b0;
	assign d_bus = d_bus_source == 1'b1 ? d_bus_reg : d_bus_net;

	// Instantiate the Unit Under Test (UUT)
	IC82x6 # (.INVERTED_OUTPUT(0))
	uut (
		.d_in(d_in), 
		.d_out(d_out), 
		.d_bus(d_bus), 
		.cs_n(cs_n), 
		.dce(dce)
	);
	
	reg[7:0] counter;

	initial begin
	   // bus_reg = 0;
		// module is in OFF state (detached from buses)
		d_bus_source = 1'b0;
		d_bus_reg = 4'b0000;
		d_in = TEST_VALUE_1;
		cs_n = 1;
		dce = 0;
		
		#200;
		// read, d_in -> d_bus
		cs_n = 0;	
		d_in = TEST_VALUE_1;
		counter = 0;

		#200;	
		// write, d_bus -> d_out
		dce = 1;  

      
		#200;
		//  module is in OFF state (detached from buses)
		d_in = TEST_VALUE_2;
		cs_n = 1;
		dce = 0;
		
		#200;
		// read, d_in -> d_bus
		cs_n = 0;
		d_in = TEST_VALUE_2;

		#200;
		// write, d_bus -> d_out
		dce = 1;
		
		// module is OFF
		#200;
		cs_n = 1;
	end
	
	always
	begin
	    #100 counter <= counter + 1;
		 if (counter == 13)
		     d_bus_reg <= 4'b0100;
		 if (counter == 14)
		 begin
		     d_bus_source <= 1'b1;
			  dce <= 1;                 // write, d_bus -> d_out
			  cs_n <= 0;
		 end
		 if (counter == 16)
		 begin
		     cs_n <= 1;                // OFF
			  d_bus_source <= 0;
		 end
		 
		 if (counter == 18)
		 begin
		     d_in <= TEST_VALUE_3;
			  dce <= 0;
			  cs_n <= 0;
		 end
		 
		 if (counter == 20)
		 begin
			  cs_n <= 1;
			  counter <= 0;
		 end
	end
      
endmodule

