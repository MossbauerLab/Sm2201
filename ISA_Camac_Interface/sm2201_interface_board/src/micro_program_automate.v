`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    11/15/2019 
// Design Name: 
// Module Name:    micro_program_automate
// Project Name:   micro_program_automate
// Target Devices: 
// Tool versions:  Quartus 19.1 sp1
// Description:    Micro programmable automate based on ROM + Synchronous register
//
// Dependencies:   src/ip_3604_dig_machine (ROM with image)
//                 /lib/SN74LS374          (register)
//
// Revision: 1.0
// Additional Comments: 
//    rdy 
//        1) doesn not depends on w signal (read or write operation mode)
//        2) tim must be 0, it is useless (now i am not see any reason to use it,
//           because when tim is 1 it force to rdy -> 0)
//        3) sel = 1 when isa addr does not corresponds to whole sm_2201_interface_board
//        4) rdy is 1 on next clk posedge when d15_addr = 100100011, after that 
//           it goes to 100100000 value
//        5) c1 and sel2 are set to 1, c2 to 0 initially, other cases should be checked
//
//////////////////////////////////////////////////////////////////////////////////

module micro_program_automate #
(
    parameter MICRO_ADDRESS_BUS_WIDTH = 2
)
(
    input wire reset,
    input wire clk,
    input wire [MICRO_ADDRESS_BUS_WIDTH - 1 : 0] a,
    input wire w,
    input wire sel,
    input wire tim,
    input wire ie,   // ПР это, возможно, ПРЕРЫВАНИЕ РАЗРЕШЕНО (interrupt enabled)
    input wire cx1,  // ???
    output wire rdy,
    output wire c1,
    output wire c2,
    output wire sel2,
    output wire x0,
    output wire x1
);

wire [8:0] d15_addr;
wire [3:0] d15_cs;
wire [7:0] d15_out;
wire [7:0] d15_out_pulled;

wire [7:0] d16_data;
wire [7:0] d16_out;

wire [7:0] d20_data;
wire [7:0] d20_out;

supply0 gnd;
supply1 vcc;

// DD15
assign d15_addr[0] = d20_out[3];
assign d15_addr[1] = d20_out[4];
assign d15_addr[2] = d16_out[2];
assign d15_addr[3] = d16_out[1];
assign d15_addr[4] = d16_out[6];
assign d15_addr[5] = d20_out[1];
assign d15_addr[6] = d16_out[7];
assign d15_addr[7] = d16_out[0];
assign d15_addr[8] = d16_out[4];

assign d15_out_pulled[0] = d15_out[0] == 1'b0 ? 1'b0 : 1'b1;
assign d15_out_pulled[1] = d15_out[1] == 1'b0 ? 1'b0 : 1'b1;
assign d15_out_pulled[2] = d15_out[2] == 1'b0 ? 1'b0 : 1'b1;
assign d15_out_pulled[3] = d15_out[3] == 1'b0 ? 1'b0 : 1'b1;
assign d15_out_pulled[4] = d15_out[4] == 1'b0 ? 1'b0 : 1'b1;
assign d15_out_pulled[5] = d15_out[5] == 1'b0 ? 1'b0 : 1'b1;
assign d15_out_pulled[6] = d15_out[6] == 1'b0 ? 1'b0 : 1'b1;
assign d15_out_pulled[7] = d15_out[7] == 1'b0 ? 1'b0 : 1'b1;

assign d15_cs[0] = vcc;
assign d15_cs[1] = vcc;
assign d15_cs[2] = gnd;
assign d15_cs[3] = gnd;

// DD16
assign d16_data[0] = w;
assign d16_data[1] = a[0];
assign d16_data[2] = a[1];
assign d16_data[3] = d15_out_pulled[2];
assign d16_data[4] = sel;
assign d16_data[5] = d15_out_pulled[6];
assign d16_data[6] = ie;
assign d16_data[7] = tim;

// DD16
assign d20_data[0] = vcc;
assign d20_data[1] = cx1;
assign d20_data[2] = d15_out_pulled[0];
assign d20_data[3] = d15_out_pulled[1];
assign d20_data[4] = d15_out_pulled[7];
assign d20_data[5] = d15_out_pulled[5];
assign d20_data[6] = d15_out_pulled[4];
assign d20_data[7] = d15_out_pulled[3];

// DD15
dig_machine_ip3604 d15(.reset(reset), .address(d15_addr), .cs(d15_cs), .data(d15_out));

// DD16
SN74LS374 d16(.out_control(gnd), .clk(clk), .reset(reset), .data(d16_data), .out(d16_out));

// DD20
SN74LS374 d20(.out_control(gnd), .clk(clk), .reset(reset), .data(d20_data), .out(d20_out));

assign x0 = d16_out[3];
assign x1 = d16_out[5];
assign rdy = d20_out[2];
assign c2 = d20_out[5];
assign c1 = d20_out[6];
assign sel2 = d20_out[7];

endmodule
