`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    23:57:05 08/28/2017 
// Design Name: 
// Module Name:    dig_machine_ip3601
// Project Name:   sm2201_interface_board
// Target Devices: 
// Tool versions:  Quartus 12.1 sp1
// Description:    Memory state (dump) of programmed IP3601 (КР556РТ4)
//
// Dependencies: 
//
// Revision: 
// Revision 1.0
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module dig_machine_ip3601(
    input wire [7:0] address,
    input wire [1:0] cs,
    output wire [3:0] data
);

reg[3:0] selected_data;

assign data = cs == 2'b00 ? ~selected_data : 4'b0000;
always @(*)
begin
    case (address)
        0: selected_data = 4'b1001;
        1: selected_data = 4'b0000;
        2: selected_data = 4'b1101;
        3: selected_data = 4'b0000;
        4: selected_data = 4'b0000;
        5: selected_data = 4'b0000;
        6: selected_data = 4'b1101;
        7: selected_data = 4'b0000;
        8: selected_data = 4'b0000;
        9: selected_data = 4'b0000;
        10: selected_data = 4'b1101;
        11: selected_data = 4'b0000;
        12: selected_data = 4'b0000;
        13: selected_data = 4'b0000;
        14: selected_data = 4'b1101;
        15: selected_data = 4'b0000;
        16: selected_data = 4'b1001;
        17: selected_data = 4'b0000;
        18: selected_data = 4'b1101;
        19: selected_data = 4'b0000;
        20: selected_data = 4'b0000;
        21: selected_data = 4'b0000;
        22: selected_data = 4'b1101;
        23: selected_data = 4'b0000;
        24: selected_data = 4'b0000;
        25: selected_data = 4'b0000;
        26: selected_data = 4'b1101;
        27: selected_data = 4'b0000;
        28: selected_data = 4'b0000;
        29: selected_data = 4'b0000;
        30: selected_data = 4'b1101;
        31: selected_data = 4'b0000;
        32: selected_data = 4'b1001;
        33: selected_data = 4'b0000;
        34: selected_data = 4'b1101;
        35: selected_data = 4'b0000;
        36: selected_data = 4'b0000;
        37: selected_data = 4'b0000;
        38: selected_data = 4'b1101;
        39: selected_data = 4'b0000;
        40: selected_data = 4'b0000;
        41: selected_data = 4'b0000;
        42: selected_data = 4'b1101;
        43: selected_data = 4'b0000;
        44: selected_data = 4'b0000;
        45: selected_data = 4'b0000;
        46: selected_data = 4'b1101;
        47: selected_data = 4'b0000;
        48: selected_data = 4'b1011;
        49: selected_data = 4'b0000;
        50: selected_data = 4'b1101;
        51: selected_data = 4'b0000;
        52: selected_data = 4'b0000;
        53: selected_data = 4'b0000;
        54: selected_data = 4'b1101;
        55: selected_data = 4'b0000;
        56: selected_data = 4'b0000;
        57: selected_data = 4'b0000;
        58: selected_data = 4'b1101;
        59: selected_data = 4'b0000;
        60: selected_data = 4'b0000;
        61: selected_data = 4'b0000;
        62: selected_data = 4'b1101;
        63: selected_data = 4'b0000;
        64: selected_data = 4'b1010;
        65: selected_data = 4'b0000;
        66: selected_data = 4'b1010;
        67: selected_data = 4'b0000;
        68: selected_data = 4'b0000;
        69: selected_data = 4'b0000;
        70: selected_data = 4'b1010;
        71: selected_data = 4'b0000;
        72: selected_data = 4'b0000;
        73: selected_data = 4'b0000;
        74: selected_data = 4'b1010;
        75: selected_data = 4'b0000;
        76: selected_data = 4'b0000;
        77: selected_data = 4'b0000;
        78: selected_data = 4'b1010;
        79: selected_data = 4'b0000;
        80: selected_data = 4'b1010;
        81: selected_data = 4'b0000;
        82: selected_data = 4'b1010;
        83: selected_data = 4'b0000;
        84: selected_data = 4'b0000;
        85: selected_data = 4'b0000;
        86: selected_data = 4'b1010;
        87: selected_data = 4'b0000;
        88: selected_data = 4'b0000;
        89: selected_data = 4'b0000;
        90: selected_data = 4'b1010;
        91: selected_data = 4'b0000;
        92: selected_data = 4'b0000;
        93: selected_data = 4'b0000;
        94: selected_data = 4'b1010;
        95: selected_data = 4'b0000;
        96: selected_data = 4'b1010;
        97: selected_data = 4'b0000;
        98: selected_data = 4'b1010;
        99: selected_data = 4'b0000;
        100: selected_data = 4'b0000;
        101: selected_data = 4'b0000;
        102: selected_data = 4'b1010;
        103: selected_data = 4'b0000;
        104: selected_data = 4'b0000;
        105: selected_data = 4'b0000;
        106: selected_data = 4'b1010;
        107: selected_data = 4'b0000;
        108: selected_data = 4'b0000;
        109: selected_data = 4'b0000;
        110: selected_data = 4'b1010;
        111: selected_data = 4'b0000;
        112: selected_data = 4'b1010;
        113: selected_data = 4'b0000;
        114: selected_data = 4'b1010;
        115: selected_data = 4'b0000;
        116: selected_data = 4'b0000;
        117: selected_data = 4'b0000;
        118: selected_data = 4'b1010;
        119: selected_data = 4'b0000;
        120: selected_data = 4'b0000;
        121: selected_data = 4'b0000;
        122: selected_data = 4'b1010;
        123: selected_data = 4'b0000;
        124: selected_data = 4'b0000;
        125: selected_data = 4'b0000;
        126: selected_data = 4'b1010;
        default: selected_data = 4'b0000;
    endcase
end

endmodule
