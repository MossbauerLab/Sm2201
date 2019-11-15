`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    23:57:05 08/28/2017 
// Design Name: 
// Module Name:    micro_program_automate
// Project Name:   micro_program_automate
// Target Devices: 
// Tool versions:  Quartus 19.1 sp1
// Description:    Micro programmable automate based on ROM + Synchronous register
//
// Dependencies:   src/ip_3604_dig_machine (ROM with image), /lib/SN74LS374 (register)
//
// Revision: 1.0
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module micro_program_automate #
(
    MICRO_ADDRESS_BUS_WIDTH = 2
)
(
    input wire reset_n,
    input wire clk,
    input wire [MICRO_ADDRESS_BUS_WIDTH - 1 : 0] micro_address,
    output [DATA_BUS - 1 : 0] data
);

endmodule
