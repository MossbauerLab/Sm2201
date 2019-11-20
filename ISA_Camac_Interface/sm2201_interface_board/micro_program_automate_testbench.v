`timescale 1ns / 1ps

module micro_program_automate_testbench();

    reg reset;
    reg clk;
    reg [1:0] a;
    reg w;
    reg sel;
    reg ie;
    reg cx1;
    wire rdy;
    wire c1;
    wire c2;
    wire sel2;
    wire x0;
    wire x1;
    
    reg [31:0] counter;
    
    micro_program_automate uut(.reset(reset), .clk(clk), .a(a), .w(w), .sel(sel), .ie(ie), .cx1(cx1),
                               .rdy(rdy), .c1(c1), .c2(c2), .sel2(sel2), .x0(x0), .x1(x1));
    
    initial
    begin
        reset <= 1;
        clk <= 0;
        a <= 0;
        w <= 0;
        sel <= 0;
        //tim <= 0;
        ie <= 0;
        cx1 <= 0;
        counter <= 0;
    end

    always
    begin
        #60 clk <= ~clk;
        counter <= counter + 1;
        if (counter == 4)
        begin
           reset <= 0;
        end
        if (counter > 0 && counter % 50 == 0)
        begin
            w <= ~w;
        end
        if (counter > 0 && counter % 10000 == 0)
            a <= a + 1;
        if (counter > 40000 && counter % 2000 == 0)
        begin
            sel <= ~sel;
        end
        if (counter > 40000 && counter % 5000 == 0)
        begin
            cx1 <= ~cx1;
            ie <= ~ie;
        end
    end

endmodule