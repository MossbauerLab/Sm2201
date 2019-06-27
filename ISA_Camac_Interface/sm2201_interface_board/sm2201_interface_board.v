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
// Description:    SM-2201 Interface Board top module
//                 Adapter between ISA and SM-2201 interface board,
//                 ISA Ports usage:
//                 Common bus usage:
//                     - D15 - D0       Data Line, ()
//                     - PC4(ПК4)       Don't know (C22)
//                     - CX3            Don't know (B22)
//
// Dependencies: 
//
// Revision: 1.0
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module sm2201_interface_board(
    // ISA interface
    input wire[9:0] isa_data,
    input wire isa_ale,
    input wire isa_aen,
    input wire isa_clk,
    input wire isa_chrdy,
    input wire isa_reset,
    input wire isa_ior,
    input wire isa_iow,
    output wire [7:0] isa_addr,
    output wire [4:0] isa_irq,
    // Controller interface bus (common bus = ОШ)
    input wire [15:0] cb_data,
    input wire cb_prr,
    input wire cb_cx1,
    input wire cb_zk4                // X 2.2 B21 ЗК4 ???
    output wire [11:0] cb_addr,
    output wire cb_prepare_bus,      // ОШ ПОДГ.
    output wire cb_b_b1,             // ОШ B/B1
    output wire cb_pc4,              // ОШ ПК4        ???
    output wire cb_cx3               // ОШ СХ3
    
);

endmodule
