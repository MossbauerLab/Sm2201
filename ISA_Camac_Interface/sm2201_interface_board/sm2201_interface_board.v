`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    23:57:05 08/28/2017 
// Design Name: 
// Module Name:    sm2201_interface_board
// Project Name:   sm2201_interface_board
// Target Devices: 
// Tool versions:  Quartus 19.1 sp1
// Description:    
//
// Dependencies: 
//
// Revision: 1.0
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module sm2201_interface_board(
    input wire[9:0] isa_bus_data,
	 input wire isa_bus_ale,
	 input wire isa_bus_aen,
	 input wire isa_bus_clk,
	 input wire isa_bus_chrdy,
	 input wire isa_bus_reset,
	 input wire isa_bus_ior,
	 input wire isa_bus_iow,
	 output wire [7:0] isa_bus_addr,
	 output wire [4:0] isa_bus_irq,
	 input wire [15:0] camac_data_bus
	 output wire [11:0] camac_addr_bus;
	 // todo: umv: implement connection to CAMAC 
);

endmodule
