`timescale 1ns / 1ps

module micro_program_automate_testbench();

    reg reset_n;
    reg clk;
    reg [1:0] a;
    reg w;
    reg sel;
    reg tim;
    reg ie;
    reg cx1;
    wire rdy;
    wire c1;
    wire c2;
    wire sel2;
    wire x0;
    wire x1;
    
    micro_program_automate uut(.reset_n(reset_n), .clk(clk), .a(a), .w(w), .sel(sel), .tim(tim), .ie(ie), .cx1(cx1),
                               .rdy(rdy), .c1(c1), .c2(c2), .sel2(sel2), .x0(x0), .x1(x1));
    
    initial
    begin
        reset_n <= 0;
        clk <= 0;
        a <= 0;
        w <= 0;
        sel <= 1;
        tim <= 1;
        ie <= 0;
        cx1 <= 0;
    end

    always
    begin
        #60 clk <= ~clk;
    end

endmodule