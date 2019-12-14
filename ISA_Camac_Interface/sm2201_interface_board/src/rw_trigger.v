`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    11/15/2019 
// Design Name: 
// Module Name:    rw_trigger
// Project Name:   rw_trigger
// Target Devices: 
// Tool versions:  Quartus 19.1 sp1
// Description:    Operation trigger read or wrire
//
// Dependencies:   no
//
// Revision: 1.0
// Additional Comments: 
//                WHEN R is 0 - active level of Read operation
//                WHEN W is 0 - active level of Write operation
//
//////////////////////////////////////////////////////////////////////////////////

module rw_trigger
(
    input wire reset,
    input wire clk,
    input wire ior,
    input wire iow,
    output reg w,
    output reg r
);


always @(posedge clk)
begin
    if(reset)
    begin
        r <= 1'b1;
        w <= 1'b1;
    end
    else
    begin
        if (ior == 1'b0 && iow == 1'b1)
        begin
            r <= 1'b0;
            w <= 1'b1;
        end
        else if (ior == 1'b1 && iow == 1'b0)
        begin
            r <= 1'b1;
            w <= 1'b0;
        end
        else
        begin
            r <= 1'b1;
            w <= 1'b1;
        end
    end
end

endmodule
