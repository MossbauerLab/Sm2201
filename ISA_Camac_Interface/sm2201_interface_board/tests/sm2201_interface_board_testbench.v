`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:13:51 02/05/2019
// Design Name:   IC82x6
// Module Name:   E:/PLD/Sm2201/ISA_Camac_Interface/sm2201_interface_board_testbench.v
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
// 
////////////////////////////////////////////////////////////////////////////////

module sm2201_interface_board_testbench;

    // isa input signals
    reg isa_clk;
    reg isa_ior;
    wire isa_iow;
    reg isa_reset;
    reg isa_ale;
    reg isa_aen;
    wire q_r_debug;

    reg [9:0] isa_addr;
    wire [7:0] isa_data;
    reg [31:0] counter;
    reg [1:0] operation;        // 0 - read, 1 - write

    // isa output signals
    wire [7:0] isa_irq;
    wire isa_chrdy;

    // CAMAC input signals
    reg cb_prr;
    reg cb_zk4;
    wire [15:0] cb_data;
    reg [15:0] cb_data_out;
    wire [15:0] cb_data_in;
    wire [11:0] cb_addr;
    reg [7:0] isa_data_out;
    wire [7:0] isa_data_in;

    assign cb_data = q_r_debug == 1'b0 ? cb_data_out : cb_data_in;//16'b0000000000000000;
    assign isa_data = q_r_debug == 1'b1 ? isa_data_out :isa_data_in;//8'b1010001;
    assign isa_iow = ~ isa_ior;

    // Instantiate the Unit Under Test (UUT)
    sm2201_interface_board
    uut (
        // isa inputs
        .isa_clk(isa_clk), 
        .isa_reset(isa_reset), 
        .isa_ior(isa_ior), 
        .isa_iow(isa_iow), 
        .isa_addr(isa_addr),
        .isa_data(isa_data),
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
        .cb_data(cb_data),
        .cb_addr(cb_addr)
    );

    initial 
    begin
        // initial ISA
        isa_reset <= 0;
        isa_clk <= 0;
        isa_ior <= 1;
        isa_addr <= 240;
        isa_ale <= 0;
        isa_aen <= 0;
        // initial CAMAC
        cb_prr <= 1;
        cb_zk4 <= 1;
        isa_data_out <= 8'b00011000;
        cb_data_out <= 16'b1111111111111111;
        counter <= 0;
        operation <= 0;
    end
    
    // we are model ISA logic
    always
    begin
        #60 isa_clk <= ~isa_clk; 
        #120 counter <= counter + 1;
        // ISA ALE, IOR, IOW generation
        if (counter == 10) 
        begin
            isa_ale <= 1;
        end
        else if (counter == 20)
        begin
            if (operation == 0)
                isa_ior <= 0;
        end
        else if (counter == 44)
        begin
            isa_ale <= 0;
        end

        else if (counter == 146)
        begin
            if (operation == 0)
                isa_ior <= 1;

            counter <= 10;
            operation <= operation + 1;
            if (operation == 1)
            begin
                isa_addr <= isa_addr + 1;
                operation <= 0;
            end
            // isa addresses range from 100-13E
            if (isa_addr == 318)
            begin
                isa_addr <= 256;
            end
        end
    end
endmodule
