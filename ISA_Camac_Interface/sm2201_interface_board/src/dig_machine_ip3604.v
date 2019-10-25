`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        MossbauerLab, EasySoft
// Engineer:       EvilLord666 (Ushakov MV)
// 
// Create Date:    23:57:05 08/28/2017 
// Design Name: 
// Module Name:    dig_machine_ip3604
// Project Name:   sm2201_interface_board
// Target Devices: 
// Tool versions:  Quartus 12.1 sp1
// Description:    A Memory state (dump) of programmed IP3604 (КР556РТ5)
//
// Dependencies: 
//
// Revision: 
// Revision 1.0
// Additional Comments: TODO: move to SystemVerilog due to i can't init array
//
//////////////////////////////////////////////////////////////////////////////////
module dig_machine_ip3604(
    input wire [8:0] address,
    input wire [3:0] cs,
    output wire [7:0] data
);

//reg[7:0] mem_dump[511:0];

/*localparam reg[7:0] mem_dump[511:0] = {
8'b00001001,
8'b10100010,
8'b00100010,
8'b10100011,
8'b10100011,
8'b00100010,
8'b00100010,
8'b10100011,
8'b10100011,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100011,
8'b10100010,
8'b00100010,
8'b00100101,
8'b10100011,
8'b00100010,
8'b00100010,
8'b00100101,
8'b10100011,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10000010,
8'b10100010,
8'b00100010,
8'b10100011,
8'b11100001,
8'b11100001,
8'b00100010,
8'b10100011,
8'b10110010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10000010,
8'b10100010,
8'b00100010,
8'b00100101,
8'b11100001,
8'b11100001,
8'b00100010,
8'b00100101,
8'b10110010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10000010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b00100010,
8'b10100010,
8'b10110010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10000010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b00100010,
8'b10100010,
8'b10110010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100011,
8'b10100010,
8'b01100010,
8'b10100011,
8'b10100011,
8'b01110010,
8'b01100010,
8'b10100011,
8'b10101010,
8'b10100010,
8'b01100010,
8'b10101010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100011,
8'b10100010,
8'b01100010,
8'b00100101,
8'b10100011,
8'b01110010,
8'b01100010,
8'b00100101,
8'b10101010,
8'b10100010,
8'b01100010,
8'b00101100,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100011,
8'b11100001,
8'b11100001,
8'b01100010,
8'b10100011,
8'b10101010,
8'b10100010,
8'b01100010,
8'b10101010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b00100101,
8'b11100001,
8'b11100001,
8'b01100010,
8'b00100101,
8'b10101010,
8'b10100010,
8'b01100010,
8'b00101100,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b01110010,
8'b01100010,
8'b10100010,
8'b10101010,
8'b10100010,
8'b01100010,
8'b10101010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b01110010,
8'b01100010,
8'b10100010,
8'b10101010,
8'b10100010,
8'b01100010,
8'b00101100,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b01100010,
8'b10100010,
8'b10101010,
8'b10100010,
8'b01100010,
8'b10101010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b01100010,
8'b10100010,
8'b10101010,
8'b10100010,
8'b01100010,
8'b00101100,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b00100100,
8'b10100010,
8'b10100010,
8'b00100100,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b00100100,
8'b10100010,
8'b10100010,
8'b00100100,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b00100100,
8'b10100010,
8'b10100010,
8'b00100100,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b00100010,
8'b10100010,
8'b00100100,
8'b10100010,
8'b10100010,
8'b00100100,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b00100100,
8'b10100010,
8'b10100010,
8'b00100100,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b00100100,
8'b10100010,
8'b10100010,
8'b00100100,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b00100100,
8'b10100010,
8'b10100010,
8'b00100100,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b10100010,
8'b10100010,
8'b01100010,
8'b10100010,
8'b00100100,
8'b10100010,
8'b10100010,
8'b00100100
};*/

// wire[7:0] selected_data;
reg[7:0] selected_data;

// assign selected_data = mem_dump[address];
assign data = cs == 4'b0011 ? selected_data : 8'b00000000;

always @(*)
begin
    case (address)
        0: selected_data = 8'b00001001;
        1: selected_data = 8'b10100010;
        2: selected_data = 8'b00100010;
        3: selected_data = 8'b10100011;
        4: selected_data = 8'b10100011;
        5: selected_data = 8'b00100010;
        6: selected_data = 8'b00100010;
        7: selected_data = 8'b10100011;
        8: selected_data = 8'b10100011;
        9: selected_data = 8'b10100010;
        10: selected_data = 8'b00100010;
        11: selected_data = 8'b10100010;
        12: selected_data = 8'b10100010;
        13: selected_data = 8'b10100010;
        14: selected_data = 8'b00100010;
        15: selected_data = 8'b10100010;
        16: selected_data = 8'b10100011;
        17: selected_data = 8'b10100010;
        18: selected_data = 8'b00100010;
        19: selected_data = 8'b00100101;
        20: selected_data = 8'b10100011;
        21: selected_data = 8'b00100010;
        22: selected_data = 8'b00100010;
        23: selected_data = 8'b00100101;
        24: selected_data = 8'b10100011;
        25: selected_data = 8'b10100010;
        26: selected_data = 8'b00100010;
        27: selected_data = 8'b10100010;
        28: selected_data = 8'b10100010;
        29: selected_data = 8'b10100010;
        30: selected_data = 8'b00100010;
        31: selected_data = 8'b10100010;
        32: selected_data = 8'b10000010;
        33: selected_data = 8'b10100010;
        34: selected_data = 8'b00100010;
        35: selected_data = 8'b10100011;
        36: selected_data = 8'b11100001;
        37: selected_data = 8'b11100001;
        38: selected_data = 8'b00100010;
        39: selected_data = 8'b10100011;
        40: selected_data = 8'b10110010;
        41: selected_data = 8'b10100010;
        42: selected_data = 8'b00100010;
        43: selected_data = 8'b10100010;
        44: selected_data = 8'b10100010;
        45: selected_data = 8'b10100010;
        46: selected_data = 8'b00100010;
        47: selected_data = 8'b10100010;
        48: selected_data = 8'b10000010;
        49: selected_data = 8'b10100010;
        50: selected_data = 8'b00100010;
        51: selected_data = 8'b00100101;
        52: selected_data = 8'b11100001;
        53: selected_data = 8'b11100001;
        54: selected_data = 8'b00100010;
        55: selected_data = 8'b00100101;
        56: selected_data = 8'b10110010;
        57: selected_data = 8'b10100010;
        58: selected_data = 8'b00100010;
        59: selected_data = 8'b10100010;
        60: selected_data = 8'b10100010;
        61: selected_data = 8'b10100010;
        62: selected_data = 8'b00100010;
        63: selected_data = 8'b10100010;
        64: selected_data = 8'b10100010;
        65: selected_data = 8'b10100010;
        66: selected_data = 8'b00100010;
        67: selected_data = 8'b10100010;
        68: selected_data = 8'b10100010;
        69: selected_data = 8'b00100010;
        70: selected_data = 8'b00100010;
        71: selected_data = 8'b10100010;
        72: selected_data = 8'b10100010;
        73: selected_data = 8'b10100010;
        74: selected_data = 8'b00100010;
        75: selected_data = 8'b10100010;
        76: selected_data = 8'b10100010;
        77: selected_data = 8'b10100010;
        78: selected_data = 8'b00100010;
        79: selected_data = 8'b10100010;
        80: selected_data = 8'b10100010;
        81: selected_data = 8'b10100010;
        82: selected_data = 8'b00100010;
        83: selected_data = 8'b10100010;
        84: selected_data = 8'b10100010;
        85: selected_data = 8'b00100010;
        86: selected_data = 8'b00100010;
        87: selected_data = 8'b10100010;
        88: selected_data = 8'b10100010;
        89: selected_data = 8'b10100010;
        90: selected_data = 8'b00100010;
        91: selected_data = 8'b10100010;
        92: selected_data = 8'b10100010;
        93: selected_data = 8'b10100010;
        94: selected_data = 8'b00100010;
        95: selected_data = 8'b10100010;
        96: selected_data = 8'b10000010;
        97: selected_data = 8'b10100010;
        98: selected_data = 8'b00100010;
        99: selected_data = 8'b10100010;
        100: selected_data = 8'b10100010;
        101: selected_data = 8'b00100010;
        102: selected_data = 8'b00100010;
        103: selected_data = 8'b10100010;
        104: selected_data = 8'b10110010;
        105: selected_data = 8'b10100010;
        106: selected_data = 8'b00100010;
        107: selected_data = 8'b10100010;
        108: selected_data = 8'b10100010;
        109: selected_data = 8'b10100010;
        110: selected_data = 8'b00100010;
        111: selected_data = 8'b10100010;
        112: selected_data = 8'b10000010;
        113: selected_data = 8'b10100010;
        114: selected_data = 8'b00100010;
        115: selected_data = 8'b10100010;
        116: selected_data = 8'b10100010;
        117: selected_data = 8'b00100010;
        118: selected_data = 8'b00100010;
        119: selected_data = 8'b10100010;
        120: selected_data = 8'b10110010;
        121: selected_data = 8'b10100010;
        122: selected_data = 8'b00100010;
        123: selected_data = 8'b10100010;
        124: selected_data = 8'b10100010;
        125: selected_data = 8'b10100010;
        126: selected_data = 8'b00100010;
        127: selected_data = 8'b10100010;
        128: selected_data = 8'b10100011;
        129: selected_data = 8'b10100010;
        130: selected_data = 8'b01100010;
        131: selected_data = 8'b10100011;
        132: selected_data = 8'b10100011;
        133: selected_data = 8'b01110010;
        134: selected_data = 8'b01100010;
        135: selected_data = 8'b10100011;
        136: selected_data = 8'b10101010;
        137: selected_data = 8'b10100010;
        138: selected_data = 8'b01100010;
        139: selected_data = 8'b10101010;
        140: selected_data = 8'b10100010;
        141: selected_data = 8'b10100010;
        142: selected_data = 8'b01100010;
        143: selected_data = 8'b10100010;
        144: selected_data = 8'b10100011;
        145: selected_data = 8'b10100010;
        146: selected_data = 8'b01100010;
        147: selected_data = 8'b00100101;
        148: selected_data = 8'b10100011;
        149: selected_data = 8'b01110010;
        150: selected_data = 8'b01100010;
        151: selected_data = 8'b00100101;
        152: selected_data = 8'b10101010;
        153: selected_data = 8'b10100010;
        154: selected_data = 8'b01100010;
        155: selected_data = 8'b00101100;
        156: selected_data = 8'b10100010;
        157: selected_data = 8'b10100010;
        158: selected_data = 8'b01100010;
        159: selected_data = 8'b10100010;
        160: selected_data = 8'b10100010;
        161: selected_data = 8'b10100010;
        162: selected_data = 8'b01100010;
        163: selected_data = 8'b10100011;
        164: selected_data = 8'b11100001;
        165: selected_data = 8'b11100001;
        166: selected_data = 8'b01100010;
        167: selected_data = 8'b10100011;
        168: selected_data = 8'b10101010;
        169: selected_data = 8'b10100010;
        170: selected_data = 8'b01100010;
        171: selected_data = 8'b10101010;
        172: selected_data = 8'b10100010;
        173: selected_data = 8'b10100010;
        174: selected_data = 8'b01100010;
        175: selected_data = 8'b10100010;
        176: selected_data = 8'b10100010;
        177: selected_data = 8'b10100010;
        178: selected_data = 8'b01100010;
        179: selected_data = 8'b00100101;
        180: selected_data = 8'b11100001;
        181: selected_data = 8'b11100001;
        182: selected_data = 8'b01100010;
        183: selected_data = 8'b00100101;
        184: selected_data = 8'b10101010;
        185: selected_data = 8'b10100010;
        186: selected_data = 8'b01100010;
        187: selected_data = 8'b00101100;
        188: selected_data = 8'b10100010;
        189: selected_data = 8'b10100010;
        190: selected_data = 8'b01100010;
        191: selected_data = 8'b10100010;
        192: selected_data = 8'b10100010;
        193: selected_data = 8'b10100010;
        194: selected_data = 8'b01100010;
        195: selected_data = 8'b10100010;
        196: selected_data = 8'b10100010;
        197: selected_data = 8'b01110010;
        198: selected_data = 8'b01100010;
        199: selected_data = 8'b10100010;
        200: selected_data = 8'b10101010;
        201: selected_data = 8'b10100010;
        202: selected_data = 8'b01100010;
        203: selected_data = 8'b10101010;
        204: selected_data = 8'b10100010;
        205: selected_data = 8'b10100010;
        206: selected_data = 8'b01100010;
        207: selected_data = 8'b10100010;
        208: selected_data = 8'b10100010;
        209: selected_data = 8'b10100010;
        210: selected_data = 8'b01100010;
        211: selected_data = 8'b10100010;
        212: selected_data = 8'b10100010;
        213: selected_data = 8'b01110010;
        214: selected_data = 8'b01100010;
        215: selected_data = 8'b10100010;
        216: selected_data = 8'b10101010;
        217: selected_data = 8'b10100010;
        218: selected_data = 8'b01100010;
        219: selected_data = 8'b00101100;
        220: selected_data = 8'b10100010;
        221: selected_data = 8'b10100010;
        222: selected_data = 8'b01100010;
        223: selected_data = 8'b10100010;
        224: selected_data = 8'b10100010;
        225: selected_data = 8'b10100010;
        226: selected_data = 8'b01100010;
        227: selected_data = 8'b10100010;
        228: selected_data = 8'b10100010;
        229: selected_data = 8'b01100010;
        230: selected_data = 8'b01100010;
        231: selected_data = 8'b10100010;
        232: selected_data = 8'b10101010;
        233: selected_data = 8'b10100010;
        234: selected_data = 8'b01100010;
        235: selected_data = 8'b10101010;
        236: selected_data = 8'b10100010;
        237: selected_data = 8'b10100010;
        238: selected_data = 8'b01100010;
        239: selected_data = 8'b10100010;
        240: selected_data = 8'b10100010;
        241: selected_data = 8'b10100010;
        242: selected_data = 8'b01100010;
        243: selected_data = 8'b10100010;
        244: selected_data = 8'b10100010;
        245: selected_data = 8'b01100010;
        246: selected_data = 8'b01100010;
        247: selected_data = 8'b10100010;
        248: selected_data = 8'b10101010;
        249: selected_data = 8'b10100010;
        250: selected_data = 8'b01100010;
        251: selected_data = 8'b00101100;
        252: selected_data = 8'b10100010;
        253: selected_data = 8'b10100010;
        254: selected_data = 8'b01100010;
        255: selected_data = 8'b10100010;
        256: selected_data = 8'b10100010;
        257: selected_data = 8'b10100010;
        258: selected_data = 8'b00100010;
        259: selected_data = 8'b10100010;
        260: selected_data = 8'b10100010;
        261: selected_data = 8'b10100010;
        262: selected_data = 8'b00100010;
        263: selected_data = 8'b10100010;
        264: selected_data = 8'b10100010;
        265: selected_data = 8'b10100010;
        266: selected_data = 8'b00100010;
        267: selected_data = 8'b10100010;
        268: selected_data = 8'b10100010;
        269: selected_data = 8'b10100010;
        270: selected_data = 8'b10100010;
        271: selected_data = 8'b10100010;
        272: selected_data = 8'b10100010;
        273: selected_data = 8'b10100010;
        274: selected_data = 8'b00100010;
        275: selected_data = 8'b10100010;
        276: selected_data = 8'b10100010;
        277: selected_data = 8'b10100010;
        278: selected_data = 8'b00100010;
        279: selected_data = 8'b10100010;
        280: selected_data = 8'b10100010;
        281: selected_data = 8'b10100010;
        282: selected_data = 8'b00100010;
        283: selected_data = 8'b10100010;
        284: selected_data = 8'b00100100;
        285: selected_data = 8'b10100010;
        286: selected_data = 8'b10100010;
        287: selected_data = 8'b00100100;
        288: selected_data = 8'b10100010;
        289: selected_data = 8'b10100010;
        290: selected_data = 8'b00100010;
        291: selected_data = 8'b10100010;
        292: selected_data = 8'b10100010;
        293: selected_data = 8'b10100010;
        294: selected_data = 8'b00100010;
        295: selected_data = 8'b10100010;
        296: selected_data = 8'b10100010;
        297: selected_data = 8'b10100010;
        298: selected_data = 8'b00100010;
        299: selected_data = 8'b10100010;
        300: selected_data = 8'b10100010;
        301: selected_data = 8'b10100010;
        302: selected_data = 8'b10100010;
        303: selected_data = 8'b10100010;
        304: selected_data = 8'b10100010;
        305: selected_data = 8'b10100010;
        306: selected_data = 8'b00100010;
        307: selected_data = 8'b10100010;
        308: selected_data = 8'b10100010;
        309: selected_data = 8'b10100010;
        310: selected_data = 8'b00100010;
        311: selected_data = 8'b10100010;
        312: selected_data = 8'b10100010;
        313: selected_data = 8'b10100010;
        314: selected_data = 8'b00100010;
        315: selected_data = 8'b10100010;
        316: selected_data = 8'b00100100;
        317: selected_data = 8'b10100010;
        318: selected_data = 8'b10100010;
        319: selected_data = 8'b00100100;
        320: selected_data = 8'b10100010;
        321: selected_data = 8'b10100010;
        322: selected_data = 8'b00100010;
        323: selected_data = 8'b10100010;
        324: selected_data = 8'b10100010;
        325: selected_data = 8'b10100010;
        326: selected_data = 8'b00100010;
        327: selected_data = 8'b10100010;
        328: selected_data = 8'b10100010;
        329: selected_data = 8'b10100010;
        330: selected_data = 8'b00100010;
        331: selected_data = 8'b10100010;
        332: selected_data = 8'b10100010;
        333: selected_data = 8'b10100010;
        334: selected_data = 8'b10100010;
        335: selected_data = 8'b10100010;
        336: selected_data = 8'b10100010;
        337: selected_data = 8'b10100010;
        338: selected_data = 8'b00100010;
        339: selected_data = 8'b10100010;
        340: selected_data = 8'b10100010;
        341: selected_data = 8'b10100010;
        342: selected_data = 8'b00100010;
        343: selected_data = 8'b10100010;
        344: selected_data = 8'b10100010;
        345: selected_data = 8'b10100010;
        346: selected_data = 8'b00100010;
        347: selected_data = 8'b10100010;
        348: selected_data = 8'b00100100;
        349: selected_data = 8'b10100010;
        350: selected_data = 8'b10100010;
        351: selected_data = 8'b00100100;
        352: selected_data = 8'b10100010;
        353: selected_data = 8'b10100010;
        354: selected_data = 8'b00100010;
        355: selected_data = 8'b10100010;
        356: selected_data = 8'b10100010;
        357: selected_data = 8'b10100010;
        358: selected_data = 8'b00100010;
        359: selected_data = 8'b10100010;
        360: selected_data = 8'b10100010;
        361: selected_data = 8'b10100010;
        362: selected_data = 8'b00100010;
        363: selected_data = 8'b10100010;
        364: selected_data = 8'b10100010;
        365: selected_data = 8'b10100010;
        366: selected_data = 8'b10100010;
        367: selected_data = 8'b10100010;
        368: selected_data = 8'b10100010;
        369: selected_data = 8'b10100010;
        370: selected_data = 8'b00100010;
        371: selected_data = 8'b10100010;
        372: selected_data = 8'b10100010;
        373: selected_data = 8'b10100010;
        374: selected_data = 8'b00100010;
        375: selected_data = 8'b10100010;
        376: selected_data = 8'b10100010;
        377: selected_data = 8'b10100010;
        378: selected_data = 8'b00100010;
        379: selected_data = 8'b10100010;
        380: selected_data = 8'b00100100;
        381: selected_data = 8'b10100010;
        382: selected_data = 8'b10100010;
        383: selected_data = 8'b00100100;
        384: selected_data = 8'b10100010;
        385: selected_data = 8'b10100010;
        386: selected_data = 8'b01100010;
        387: selected_data = 8'b10100010;
        388: selected_data = 8'b10100010;
        389: selected_data = 8'b10100010;
        390: selected_data = 8'b01100010;
        391: selected_data = 8'b10100010;
        392: selected_data = 8'b10100010;
        393: selected_data = 8'b10100010;
        394: selected_data = 8'b01100010;
        395: selected_data = 8'b10100010;
        396: selected_data = 8'b10100010;
        397: selected_data = 8'b10100010;
        398: selected_data = 8'b10100010;
        399: selected_data = 8'b10100010;
        400: selected_data = 8'b10100010;
        401: selected_data = 8'b10100010;
        402: selected_data = 8'b01100010;
        403: selected_data = 8'b10100010;
        404: selected_data = 8'b10100010;
        405: selected_data = 8'b10100010;
        406: selected_data = 8'b01100010;
        407: selected_data = 8'b10100010;
        408: selected_data = 8'b10100010;
        409: selected_data = 8'b10100010;
        410: selected_data = 8'b01100010;
        411: selected_data = 8'b10100010;
        412: selected_data = 8'b00100100;
        413: selected_data = 8'b10100010;
        414: selected_data = 8'b10100010;
        415: selected_data = 8'b00100100;
        416: selected_data = 8'b10100010;
        417: selected_data = 8'b10100010;
        418: selected_data = 8'b01100010;
        419: selected_data = 8'b10100010;
        420: selected_data = 8'b10100010;
        421: selected_data = 8'b10100010;
        422: selected_data = 8'b01100010;
        423: selected_data = 8'b10100010;
        424: selected_data = 8'b10100010;
        425: selected_data = 8'b10100010;
        426: selected_data = 8'b01100010;
        427: selected_data = 8'b10100010;
        428: selected_data = 8'b10100010;
        429: selected_data = 8'b10100010;
        430: selected_data = 8'b10100010;
        431: selected_data = 8'b10100010;
        432: selected_data = 8'b10100010;
        433: selected_data = 8'b10100010;
        434: selected_data = 8'b01100010;
        435: selected_data = 8'b10100010;
        436: selected_data = 8'b10100010;
        437: selected_data = 8'b10100010;
        438: selected_data = 8'b01100010;
        439: selected_data = 8'b10100010;
        440: selected_data = 8'b10100010;
        441: selected_data = 8'b10100010;
        442: selected_data = 8'b01100010;
        443: selected_data = 8'b10100010;
        444: selected_data = 8'b00100100;
        445: selected_data = 8'b10100010;
        446: selected_data = 8'b10100010;
        447: selected_data = 8'b00100100;
        448: selected_data = 8'b10100010;
        449: selected_data = 8'b10100010;
        450: selected_data = 8'b01100010;
        451: selected_data = 8'b10100010;
        452: selected_data = 8'b10100010;
        453: selected_data = 8'b10100010;
        454: selected_data = 8'b01100010;
        455: selected_data = 8'b10100010;
        456: selected_data = 8'b10100010;
        457: selected_data = 8'b10100010;
        458: selected_data = 8'b01100010;
        459: selected_data = 8'b10100010;
        460: selected_data = 8'b10100010;
        461: selected_data = 8'b10100010;
        462: selected_data = 8'b10100010;
        463: selected_data = 8'b10100010;
        464: selected_data = 8'b10100010;
        465: selected_data = 8'b10100010;
        466: selected_data = 8'b01100010;
        467: selected_data = 8'b10100010;
        468: selected_data = 8'b10100010;
        469: selected_data = 8'b10100010;
        470: selected_data = 8'b01100010;
        471: selected_data = 8'b10100010;
        472: selected_data = 8'b10100010;
        473: selected_data = 8'b10100010;
        474: selected_data = 8'b01100010;
        475: selected_data = 8'b10100010;
        476: selected_data = 8'b00100100;
        477: selected_data = 8'b10100010;
        478: selected_data = 8'b10100010;
        479: selected_data = 8'b00100100;
        480: selected_data = 8'b10100010;
        481: selected_data = 8'b10100010;
        482: selected_data = 8'b01100010;
        483: selected_data = 8'b10100010;
        484: selected_data = 8'b10100010;
        485: selected_data = 8'b10100010;
        486: selected_data = 8'b01100010;
        487: selected_data = 8'b10100010;
        488: selected_data = 8'b10100010;
        489: selected_data = 8'b10100010;
        490: selected_data = 8'b01100010;
        491: selected_data = 8'b10100010;
        492: selected_data = 8'b10100010;
        493: selected_data = 8'b10100010;
        494: selected_data = 8'b10100010;
        495: selected_data = 8'b10100010;
        496: selected_data = 8'b10100010;
        497: selected_data = 8'b10100010;
        498: selected_data = 8'b01100010;
        499: selected_data = 8'b10100010;
        500: selected_data = 8'b10100010;
        501: selected_data = 8'b10100010;
        502: selected_data = 8'b01100010;
        503: selected_data = 8'b10100010;
        504: selected_data = 8'b10100010;
        505: selected_data = 8'b10100010;
        506: selected_data = 8'b01100010;
        507: selected_data = 8'b10100010;
        508: selected_data = 8'b00100100;
        509: selected_data = 8'b10100010;
        510: selected_data = 8'b10100010;
        511: selected_data = 8'b00100100;
        default: selected_data = 8'b00000000;
    endcase
end

endmodule
