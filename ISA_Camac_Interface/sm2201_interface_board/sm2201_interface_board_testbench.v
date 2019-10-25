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
// Verilog Test Fixture created of top level module sm2201_interface_board
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
    reg isa_iow;
    reg isa_reset;
    reg isa_ale;
    reg isa_aen;

    reg [9:0] isa_addr;

    // isa output signals
    wire [7:0] isa_irq;
    wire isa_chrdy;

    // CAMAC input signals
    reg cb_prr;

    // Instantiate the Unit Under Test (UUT)
    sm2201_interface_board
    uut (
        // isa inputs
        .isa_clk(isa_clk), 
        .isa_reset(isa_reset), 
        .isa_ior(isa_ior), 
        .isa_iow(isa_iow), 
        .isa_addr(isa_addr),
        .isa_ale(isa_ale),
        .isa_aen(isa_aen),
        // isa outputs
        .isa_chrdy(isa_chrdy),
        // CAMAC inputs
        .cb_prr(cb_prr)
    );

    initial begin
        // initial ISA
        isa_reset <= 0;
        isa_clk <= 0;
        isa_ior <= 1;
        isa_iow <= 1;
        isa_addr <= 10'b0100010011;
        isa_ale <= 0;
        isa_aen <= 0;
        // initial CAMAC
        cb_prr <= 1;
        
        #100 
        isa_ior <= 0;
        #1000 
        isa_ior <= 1;
        isa_iow <= 0;
    end
    
    always
    begin
        #60 isa_clk <= ~isa_clk; 
    end
endmodule
