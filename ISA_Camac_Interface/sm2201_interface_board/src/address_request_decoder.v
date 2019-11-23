`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    23:57:05 08/28/2017 
// Design Name: 
// Module Name:    address_request_decoder
// Project Name:   address_request_decoder
// Target Devices: 
// Tool versions:  Quartus 19.1 sp1
// Description:    Address - 10 bit address taken from ISA, aen & ale also ISA
//
// Dependencies: 
//
// Revision: 1.0
// Additional Comments: 
//                     sel generates:
//                         1 when address < 255 (100 hex)
//                         1 when address >= 256 and aen = 0
//                         0 when address >= 256 and aen = 1
//                         0 when address > 264 (108 hex) < 288 (120 hex)
//                         1 when address > 288 and address < 318 (13E hex) AND aen = 0
//                         0 when address > 288 and address <= 318 (13E hex) AND aen = 1
//                         0 when address > 318
//                     internal_address:
//                         0 address interrupt register
//                         1 2nd byte reqister
//                         2 crate address
//                         3 ???
//                     sel1 generates (related to internal_address value):
//                         1 when internal_address = 1 and aen = 0
//                         0 in other cases
//
////////////////////////////////////////////////////////////////////////////////////////////////////

module address_request_decoder(
    input wire [9:0] address,
    input wire ale,
    input wire aen,
    input wire ior,     // = g_rd
    input wire iow,     // = p_wr
    input wire interrupt_req, // = v_rp
    input wire zk4,
    output wire sel,
    output wire sel1,
    output wire [1:0] internal_address,
    output wire interrupt_en  // interrupt enabled
);

wire [7:0] d10_addr;
wire [1:0] d10_cs;
wire [3:0] d10_out;
wire [3:0] d10_out_pulled;

wire d5_y3;

wire d9_y1;
wire d9_y2;
wire d9_y3;

// DD10
assign d10_addr[0] = address[6];
assign d10_addr[1] = address[5];
assign d10_addr[2] = address[4];
assign d10_addr[3] = address[3];
assign d10_addr[4] = address[2];
assign d10_addr[5] = address[1];
assign d10_addr[6] = address[0];
assign d10_addr[7] = ale;

assign d10_cs[0] = d9_y1;
assign d10_cs[1] = aen;

assign d10_out_pulled[0] = d10_out[0] == 1'b0 ? 1'b0 : 1'b1;
assign d10_out_pulled[1] = d10_out[1] == 1'b0 ? 1'b0 : 1'b1;
assign d10_out_pulled[2] = d10_out[2] == 1'b0 ? 1'b0 : 1'b1;
assign d10_out_pulled[3] = d10_out[3] == 1'b0 ? 1'b0 : 1'b1;

assign interrupt_en = d9_y3;
assign internal_address[0] = d10_out_pulled[0];
assign internal_address[1] = d10_out_pulled[1];
assign sel1 = d10_out_pulled[2];

// DD5
SN74LS00 d5(.a3(ior), .b3(iow), .y3(d5_y3),
            .a4(d9_y2), .b4(address[8]), .y4(sel));

// DD9
SN74LS27 d9(.a1(d5_y3), .b1(d5_y3), .c1(d5_y3), .y1(d9_y1),
            .a2(address[7]), .b2(d10_out_pulled[3]), .c2(address[9]), .y2(d9_y2),
            .a3(interrupt_req), .b3(zk4), .c3(interrupt_req), .y3(d9_y3));

// DD10
dig_machine_ip3601 d10(.address(d10_addr), .cs(d10_cs), .data(d10_out));

endmodule