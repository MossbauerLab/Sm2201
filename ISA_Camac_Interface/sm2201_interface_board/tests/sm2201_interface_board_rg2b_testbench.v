`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:13:51 02/05/2019
// Design Name:   IC82x6
// Module Name:   E:/PLD/Sm2201/ISA_Camac_Interface/sm2201_interface_board_rg2b_testbench.v
// Project Name:  sm2201_interface_board
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created for top level module sm2201_interface_board
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//  Test scenario:
//    1. Write to register 0x101 series ob bytes (isa_data): 0x00, 0x02, 0x04, 
//       0x10, 0x20, 0x40, 0x80
//    2. ??? Here we should somehow check correctness of operation result in stage 1
//    3. If write is correct write to register 0x101 value 0x99 
////////////////////////////////////////////////////////////////////////////////

module sm2201_interface_board_rg2b_testbench;

    // isa input signals
    reg isa_clk;
    reg isa_ior;
    reg isa_iow;
    reg isa_reset;
    reg isa_ale;
    reg isa_aen;
    wire q_r_debug;

    reg [9:0] isa_addr;
    wire [7:0] isa_data;
    reg [31:0] counter;
    reg [1:0] operation;        // 0 - read, 1 - write
    reg [31:0] state;
    wire cb_b_b1;

    // isa output signals
    wire [7:0] isa_irq;
    wire isa_chrdy;

    // CAMAC input signals
    reg cb_prr;
    reg cb_zk4;
    wire [15:0] cb_data;
    reg [15:0] cb_data_out;
    wire [15:0] cb_data_in;
    reg [15:0] cb_data_in_buffer;
    wire [11:0] cb_addr;
    reg [7:0] isa_data_out;
    wire [7:0] isa_data_in;
    reg [7:0] isa_data_in_buffer;

    assign cb_data = /*cb_b_b1*/ isa_ior == 1'b1 ? cb_data_out : cb_data_in;
    assign cb_data_in = cb_data_in_buffer;
    //16'b0000000000000000; //
    assign isa_data = q_r_debug == 1'b0 ? isa_data_in : isa_data_out;
    //assign isa_data_in = isa_data_in_buffer;


    localparam reg[31:0] WRITE_ADDR_INT_REG_READY = 0;
    localparam reg[31:0] WRITE_ADDR_INT_REG_SEND = 1;

    // Instantiate the Unit Under Test (UUT)
    sm2201_interface_board
    uut (
        // isa inputs
        .isa_clk(isa_clk), 
        .isa_reset(isa_reset), 
        .isa_ior(isa_ior), 
        .isa_iow(isa_iow), 
        .isa_addr(isa_addr),
        .isa_data(isa_data_in),
        .isa_ale(isa_ale),
        .isa_aen(isa_aen),
        // isa outputs
        .isa_chrdy(isa_chrdy),
        // debug
        .q_r_debug(q_r_debug),
        // CAMAC inputs
        .cb_prr(cb_prr),
        .cb_zk4(cb_zk4),
        .cb_cx1(cb_cx1),
        .cb_data(cb_data_in),
        .cb_addr(cb_addr),
        .cb_b_b1(cb_b_b1)
    );

    initial 
    begin
        // initial ISA
        isa_reset <= 0;
        isa_clk <= 0;
        isa_ior <= 1;
        isa_iow <= 1;
        isa_addr <= 34;
        isa_ale <= 0;
        isa_aen <= 0;
        // initial CAMAC
        cb_prr <= 1;
        cb_zk4 <= 1;
        isa_data_out <= 8'b01010110;
        cb_data_out <= 16'b1001100110001000;
        cb_data_in_buffer <= 16'b1111111111111111;
        //isa_data_in_buffer <= 8'b00000000;
        counter <= 0;
        operation <= 0;
    end
    
    // we are model ISA logic
    always
    begin
        #75 isa_clk <= ~isa_clk; 
        #150 counter <= counter + 1;
        if (counter == 100)
        begin
            isa_addr <= 262; // 106h
            isa_ale <= 1'b1;
        end
        if (counter == 110)
            isa_ale <= 1'b0;
        if (counter == 120)
            isa_ior <= 1'b0;
        if (counter == 200)
            isa_ior <= 1'b1;
    end
endmodule