`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    23:57:05 08/28/2017 
// Design Name: 
// Module Name:    address_request_decoder_testbench
// Project Name:   address_request_decoder_testbench
// Target Devices: 
// Tool versions:  Quartus 19.1 sp1
// Description:    Address - 10 bit address taken from ISA, aen & ale also ISA
//
// Dependencies: 
//
// Revision: 1.0
// Additional Comments: 
//                      1) Time relation between ale & aen
//
//////////////////////////////////////////////////////////////////////////////////

module address_request_decoder_testbench(

);

    reg [9:0] address;
    reg ale;
    reg aen;
    reg ior;     // = g_rd
    reg iow;     // = p_wr
    reg interrupt_req; // = v_rp
    reg zk4;
    wire sel;
    wire sel1;
    wire [1:0] internal_address;
    wire interrupt_en;  // interrupt enabled
    
    reg [31:0] counter;
    reg [1:0] operation;        // 0 -read, 1 - write
    
    address_request_decoder uut(.address(address), .ale(ale), .aen(aen), .ior(ior), .iow(iow), .interrupt_req(interrupt_req), .zk4(zk4),
                                .sel(sel), .sel1(sel1), .internal_address(internal_address), .interrupt_en(interrupt_en));

    initial
    begin
        address <= 40;
        ale <= 0;
        aen <= 0;
        ior <= 1;
        iow <= 1;
        interrupt_req <= 0; // ???
        zk4 <= 1;
        counter <= 0;
        operation <= 0;
    end
    
    always @*
    begin
         #120 counter <= counter + 1;
         // ALE generation
        if (counter == 10) 
        begin
            ale <= 1;
            aen <= 1;
        end
        else if (counter == 20)
        begin
            if (operation == 0)
                ior <= 0;
            else
                iow <= 0;
        end
        else if (counter == 44)
        begin
            ale <= 0;
            aen <= 0;
        end
        else if (counter == 136)
        begin
            if (operation == 0)
                ior <= 1;
            else
                iow <= 1;
        end
        else if (counter == 146)
        begin
            counter <= 10;
            operation <= operation + 1;
            if (operation == 1)
            begin
                address <= address + 1;
                operation <= 0;
            end
            // isa addresses range from 100-13E
            if (address == 318)
            begin
                address <= 256;
            end
        end
    end

endmodule