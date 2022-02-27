`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    23:57:05 12.02.2022 
// Design Name: 
// Module Name:    isa_slave
// Project Name:   sm2201_iface_board_v2
// Target Devices: 
// Tool versions:  Quartus 19.1 sp1
// Description:    ISA integration module
//
// 8 Bit Memory or I/O Transfer Timing Diagram  (4 wait states shown)
//
//                   __     __     __    __     __     __     __
// BCLK          ___|  |___|  |___|  |__|  |___|  |___|  |___|  |__
//                                W1    W2     W3     W4
//                       __                                            
// BALE          _______|  |_______________________________________
//
//
// AEN           __________________________________________________ 
// 
//                         ______________________________________ 
// SA0-SA19      ---------<______________________________________>-
//                                                               
//                     
//               _____________                                _____
// Command Line               |______________________________|
// (IORC,IOWC,                                   
// SMRDC, or SMWTC)     
//                                                       _____ 
// SD0-SD7       ---------------------------------------<_____>----
// (READ)                                          
//                     
//                         ___________________________________ 
// SD0-SD7       ---------<___________________________________>----
// (WRITE)                                          
//
//
//Note: W1 through W4 indicate wait cycles.

//////////////////////////////////////////////////////////////////////////////////

module isa_slave #
(
    parameter DATA_WIDTH = 8
)
(
	 input  wire [9:0] isa_addr,
    inout  wire [DATA_WIDTH-1:0] isa_data,
    input  wire isa_ale,
    input  wire isa_aen,
    input  wire isa_clk,
    output wire isa_chrdy,
    input  wire isa_reset,
    input  wire isa_ior,
    input  wire isa_iow,
	 // following signals are used to manage data
	 output wire operation,    // 1 - Input (Bus Write, isa_iow pulse), 0 - Output (Bus Read, isa_ior pulse)
	 input  wire [DATA_WIDTH-1:0] send_data,
	 input  wire send_req,
	 output wire send_ack,
	 output wire [DATA_WIDTH-1:0] recv_data,
	 output wire recv_req,
	 input  wire recv_ack
);

localparam reg[3:0] INITED_STATE = 1;
localparam reg[3:0] WAIT_OPERATION_STATE = 2;
localparam reg[3:0] READ_OPERATION_STATE = 3;
localparam reg[3:0] WRITE_OPERATION_STATE = 4;
localparam reg[3:0] OPERATION_COMPLETED_STATE = 5;
reg[3:0] state;


always @(posedge isa_clk)
begin
    
end

endmodule
