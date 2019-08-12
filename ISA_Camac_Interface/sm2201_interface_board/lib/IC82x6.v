`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    23:57:05 08/28/2017 
// Design Name: 
// Module Name:    IC8216
// Project Name:   sm2201_interface_board
// Target Devices: 
// Tool versions:  Quartus 12.1 sp1
// Description:    An implementation of chip IC8216 and 8226 (4bit bus former)
//                 8216 - buffers, 8226 - inverters (INVERTED_OUTPUT must be set to 1)
//
// Dependencies: 
//
// Revision: 1.0
// Additional Comments: Analog of К589АП16 & К589АП26
//
//////////////////////////////////////////////////////////////////////////////////

module IC82x6 #
(
    INVERTED_OUTPUT = 0
)
(
    input wire [3:0] d_in,
    output wire [3:0] d_out,
    inout wire [3:0] d_bus,
    input wire cs_n,
    input wire dce
);


wire [3:0] d_out_value;
wire [3:0] d_bus_value;


assign d_out_value = cs_n == 1'b0 && dce == 1'b1 ? d_bus : 4'b0;
assign d_out = INVERTED_OUTPUT == 1 ? ~d_out_value : d_out_value;

assign d_bus_value = INVERTED_OUTPUT == 1 ? ~d_in : d_in;
assign d_bus = cs_n == 1'b0 && dce == 1'b0 ? d_bus_value : 4'bz;

/*
reg [3:0] out_buffer;
assign d_bus = (cs_n == 1'b0 && dce== 1'b0) ? out_buffer : 4'bz; 
// cs_n == 1'b0 ? ((dce== 1'b0) ? buffer : d_bus) : 4'bz;

always @(*)
begin
   if (cs_n == 1'b1)                                                             // chip is OFF
	begin
	    d_out = 4'bz;
		 out_buffer = 4'bz;
	end
	else                                                                          // chip is ON
	begin
       if (dce == 1'b0)                                                          // READ: d_in -> d_bus
		     out_buffer = INVERTED_OUTPUT == 0 ? d_in : 15 - d_in;    
       else d_out = INVERTED_OUTPUT == 0 ? out_buffer : 15  - out_buffer;              // WRITE: d_bus -> d_out via register
	end
end
*/
endmodule
