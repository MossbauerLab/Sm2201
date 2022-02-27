`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    23:57:05 12.02.2022 
// Design Name: 
// Module Name:    sm2201_iface_board_v2
// Project Name:   sm2201_iface_board_v2
// Target Devices: 
// Tool versions:  Quartus 19.1 sp1
// Description:    SM-2201 Interface Board top module
//                 Adapter between ISA and SM-2201 interface board,
//                 ISA Ports usage:
//                 CAMAC Bus: 
//
//////////////////////////////////////////////////////////////////////////////////

module sm2201_iface_board_v2(
    // ISA interface
    inout wire [7:0] isa_data,
    input wire isa_ale,
    input wire isa_aen,
    input wire isa_clk,
    output wire isa_chrdy,
    input wire isa_reset,
    input wire isa_ior,
    input wire isa_iow,
    input wire [9:0] isa_addr,
    output wire [7:0] isa_irq,
    // camac interface bus = ОШ
    inout wire [15:0] camac_data,
    input wire camac_prr,
    output wire camac_cx1,
    input wire camac_zk4,               // X 2.2 B21 ЗК4 ???
    output wire [11:0] camac_addr,
    output wire camac_prepare_bus,      // ОШ ПОДГ.
    output wire camac_b_b1,             // ОШ B/B1
    output wire camac_pc4,              // ОШ ПК4        ???
    output wire camac_cx3               // ОШ СХ3
);

endmodule
