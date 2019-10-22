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


reg[3:0] mem_dump[255:0];
/*localparam reg[3:0] mem_dump[255:0] = 
4'b1001,
4'b0000,
4'b1101,
4'b0000,
4'b0000,
4'b0000,
4'b1101,
4'b0000,
4'b0000,
4'b0000,
4'b1101,
4'b0000,
4'b0000,
4'b0000,
4'b1101,
4'b0000,
4'b1001,
4'b0000,
4'b1101,
4'b0000,
4'b0000,
4'b0000,
4'b1101,
4'b0000,
4'b0000,
4'b0000,
4'b1101,
4'b0000,
4'b0000,
4'b0000,
4'b1101,
4'b0000,
4'b1001,
4'b0000,
4'b1101,
4'b0000,
4'b0000,
4'b0000,
4'b1101,
4'b0000,
4'b0000,
4'b0000,
4'b1101,
4'b0000,
4'b0000,
4'b0000,
4'b1101,
4'b0000,
4'b1011,
4'b0000,
4'b1101,
4'b0000,
4'b0000,
4'b0000,
4'b1101,
4'b0000,
4'b0000,
4'b0000,
4'b1101,
4'b0000,
4'b0000,
4'b0000,
4'b1101,
4'b0000,
4'b1010,
4'b0000,
4'b1010,
4'b0000,
4'b0000,
4'b0000,
4'b1010,
4'b0000,
4'b0000,
4'b0000,
4'b1010,
4'b0000,
4'b0000,
4'b0000,
4'b1010,
4'b0000,
4'b1010,
4'b0000,
4'b1010,
4'b0000,
4'b0000,
4'b0000,
4'b1010,
4'b0000,
4'b0000,
4'b0000,
4'b1010,
4'b0000,
4'b0000,
4'b0000,
4'b1010,
4'b0000,
4'b1010,
4'b0000,
4'b1010,
4'b0000,
4'b0000,
4'b0000,
4'b1010,
4'b0000,
4'b0000,
4'b0000,
4'b1010,
4'b0000,
4'b0000,
4'b0000,
4'b1010,
4'b0000,
4'b1010,
4'b0000,
4'b1010,
4'b0000,
4'b0000,
4'b0000,
4'b1010,
4'b0000,
4'b0000,
4'b0000,
4'b1010,
4'b0000,
4'b0000,
4'b0000,
4'b1010,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000,
4'b0000
};*/

wire[3:0] selected_data;

assign selected_data = mem_dump[address];
assign data = cs == 2'b00 ? selected_data : 4'b0000;

always @(*)
begin
    mem_dump[0] = 4'b1001;
	 mem_dump[1] = 4'b0000;
    mem_dump[2] = 4'b1101;
    mem_dump[3] = 4'b0000;
    mem_dump[4] = 4'b0000;
    mem_dump[5] = 4'b0000;
    mem_dump[6] = 4'b1101;
    mem_dump[7] = 4'b0000;
    mem_dump[8] = 4'b0000;
    mem_dump[9] = 4'b0000;
    mem_dump[10] = 4'b1101;
    mem_dump[11] = 4'b0000;
    mem_dump[12] = 4'b0000;
    mem_dump[13] = 4'b0000;
    mem_dump[14] = 4'b1101;
    mem_dump[15] = 4'b0000;
    mem_dump[16] = 4'b1001;
    mem_dump[17] = 4'b0000;
    mem_dump[18] = 4'b1101;
    mem_dump[19] = 4'b0000;
    mem_dump[20] = 4'b0000;
    mem_dump[21] = 4'b0000;
    mem_dump[22] = 4'b1101;
    mem_dump[23] = 4'b0000;
    mem_dump[24] = 4'b0000;
    mem_dump[25] = 4'b0000;
    mem_dump[26] = 4'b1101;
    mem_dump[27] = 4'b0000;
    mem_dump[28] = 4'b0000;
    mem_dump[29] = 4'b0000;
    mem_dump[30] = 4'b1101;
    mem_dump[31] = 4'b0000;
    mem_dump[32] = 4'b1001;
    mem_dump[33] = 4'b0000;
    mem_dump[34] = 4'b1101;
    mem_dump[35] = 4'b0000;
    mem_dump[36] = 4'b0000;
    mem_dump[37] = 4'b0000;
    mem_dump[38] = 4'b1101;
    mem_dump[39] = 4'b0000;
    mem_dump[40] = 4'b0000;
    mem_dump[41] = 4'b0000;
    mem_dump[42] = 4'b1101;
    mem_dump[43] = 4'b0000;
    mem_dump[44] = 4'b0000;
    mem_dump[45] = 4'b0000;
    mem_dump[46] = 4'b1101;
    mem_dump[47] = 4'b0000;
    mem_dump[48] = 4'b1011;
    mem_dump[49] = 4'b0000;
    mem_dump[50] = 4'b1101;
    mem_dump[51] = 4'b0000;
    mem_dump[52] = 4'b0000;
    mem_dump[53] = 4'b0000;
    mem_dump[54] = 4'b1101;
    mem_dump[55] = 4'b0000;
    mem_dump[56] = 4'b0000;
    mem_dump[57] = 4'b0000;
    mem_dump[58] = 4'b1101;
    mem_dump[59] = 4'b0000;
    mem_dump[60] = 4'b0000;
    mem_dump[61] = 4'b0000;
    mem_dump[62] = 4'b1101;
    mem_dump[63] = 4'b0000;
    mem_dump[64] = 4'b1010;
    mem_dump[65] = 4'b0000;
    mem_dump[66] = 4'b1010;
    mem_dump[67] = 4'b0000;
    mem_dump[68] = 4'b0000;
    mem_dump[69] = 4'b0000;
    mem_dump[70] = 4'b1010;
    mem_dump[71] = 4'b0000;
    mem_dump[72] = 4'b0000;
    mem_dump[73] = 4'b0000;
    mem_dump[74] = 4'b1010;
    mem_dump[75] = 4'b0000;
    mem_dump[76] = 4'b0000;
    mem_dump[77] = 4'b0000;
    mem_dump[78] = 4'b1010;
    mem_dump[79] = 4'b0000;
    mem_dump[80] = 4'b1010;
    mem_dump[81] = 4'b0000;
    mem_dump[82] = 4'b1010;
    mem_dump[83] = 4'b0000;
    mem_dump[84] = 4'b0000;
    mem_dump[85] = 4'b0000;
    mem_dump[86] = 4'b1010;
    mem_dump[87] = 4'b0000;
    mem_dump[88] = 4'b0000;
    mem_dump[89] = 4'b0000;
    mem_dump[90] = 4'b1010;
    mem_dump[91] = 4'b0000;
    mem_dump[92] = 4'b0000;
    mem_dump[93] = 4'b0000;
    mem_dump[94] = 4'b1010;
    mem_dump[95] = 4'b0000;
    mem_dump[96] = 4'b1010;
    mem_dump[97] = 4'b0000;
    mem_dump[98] = 4'b1010;
    mem_dump[99] = 4'b0000;
    mem_dump[100] = 4'b0000;
    mem_dump[101] = 4'b0000;
    mem_dump[102] = 4'b1010;
    mem_dump[103] = 4'b0000;
    mem_dump[104] = 4'b0000;
    mem_dump[105] = 4'b0000;
    mem_dump[106] = 4'b1010;
    mem_dump[107] = 4'b0000;
    mem_dump[108] = 4'b0000;
    mem_dump[109] = 4'b0000;
    mem_dump[110] = 4'b1010;
    mem_dump[111] = 4'b0000;
    mem_dump[112] = 4'b1010;
    mem_dump[113] = 4'b0000;
    mem_dump[114] = 4'b1010;
    mem_dump[115] = 4'b0000;
    mem_dump[116] = 4'b0000;
    mem_dump[117] = 4'b0000;
    mem_dump[118] = 4'b1010;
    mem_dump[119] = 4'b0000;
    mem_dump[120] = 4'b0000;
    mem_dump[121] = 4'b0000;
    mem_dump[122] = 4'b1010;
    mem_dump[123] = 4'b0000;
    mem_dump[124] = 4'b0000;
    mem_dump[125] = 4'b0000;
    mem_dump[126] = 4'b1010;
    mem_dump[127] = 4'b0000;
    mem_dump[128] = 4'b0000;
    mem_dump[129] = 4'b0000;
    mem_dump[130] = 4'b0000;
    mem_dump[131] = 4'b0000;
    mem_dump[132] = 4'b0000;
    mem_dump[133] = 4'b0000;
    mem_dump[134] = 4'b0000;
    mem_dump[135] = 4'b0000;
    mem_dump[136] = 4'b0000;
    mem_dump[137] = 4'b0000;
    mem_dump[138] = 4'b0000;
    mem_dump[139] = 4'b0000;
    mem_dump[140] = 4'b0000;
    mem_dump[141] = 4'b0000;
    mem_dump[142] = 4'b0000;
    mem_dump[143] = 4'b0000;
    mem_dump[144] = 4'b0000;
    mem_dump[145] = 4'b0000;
    mem_dump[146] = 4'b0000;
    mem_dump[147] = 4'b0000;
    mem_dump[148] = 4'b0000;
    mem_dump[149] = 4'b0000;
    mem_dump[150] = 4'b0000;
    mem_dump[151] = 4'b0000;
    mem_dump[152] = 4'b0000;
    mem_dump[153] = 4'b0000;
    mem_dump[154] = 4'b0000;
    mem_dump[155] = 4'b0000;
    mem_dump[156] = 4'b0000;
    mem_dump[157] = 4'b0000;
    mem_dump[158] = 4'b0000;
    mem_dump[159] = 4'b0000;
    mem_dump[160] = 4'b0000;
    mem_dump[161] = 4'b0000;
    mem_dump[162] = 4'b0000;
    mem_dump[163] = 4'b0000;
    mem_dump[164] = 4'b0000;
    mem_dump[165] = 4'b0000;
    mem_dump[166] = 4'b0000;
    mem_dump[167] = 4'b0000;
    mem_dump[168] = 4'b0000;
    mem_dump[169] = 4'b0000;
    mem_dump[170] = 4'b0000;
    mem_dump[171] = 4'b0000;
    mem_dump[172] = 4'b0000;
    mem_dump[173] = 4'b0000;
    mem_dump[174] = 4'b0000;
    mem_dump[175] = 4'b0000;
    mem_dump[176] = 4'b0000;
    mem_dump[177] = 4'b0000;
    mem_dump[178] = 4'b0000;
    mem_dump[179] = 4'b0000;
    mem_dump[180] = 4'b0000;
    mem_dump[181] = 4'b0000;
    mem_dump[182] = 4'b0000;
    mem_dump[183] = 4'b0000;
    mem_dump[184] = 4'b0000;
    mem_dump[185] = 4'b0000;
    mem_dump[186] = 4'b0000;
    mem_dump[187] = 4'b0000;
    mem_dump[188] = 4'b0000;
    mem_dump[189] = 4'b0000;
    mem_dump[190] = 4'b0000;
    mem_dump[191] = 4'b0000;
    mem_dump[192] = 4'b0000;
    mem_dump[193] = 4'b0000;
    mem_dump[194] = 4'b0000;
    mem_dump[195] = 4'b0000;
    mem_dump[196] = 4'b0000;
    mem_dump[197] = 4'b0000;
    mem_dump[198] = 4'b0000;
    mem_dump[199] = 4'b0000;
    mem_dump[200] = 4'b0000;
    mem_dump[201] = 4'b0000;
    mem_dump[202] = 4'b0000;
    mem_dump[203] = 4'b0000;
    mem_dump[204] = 4'b0000;
    mem_dump[205] = 4'b0000;
    mem_dump[206] = 4'b0000;
    mem_dump[207] = 4'b0000;
    mem_dump[208] = 4'b0000;
    mem_dump[209] = 4'b0000;
    mem_dump[210] = 4'b0000;
    mem_dump[211] = 4'b0000;
    mem_dump[212] = 4'b0000;
    mem_dump[213] = 4'b0000;
    mem_dump[214] = 4'b0000;
    mem_dump[215] = 4'b0000;
    mem_dump[216] = 4'b0000;
    mem_dump[217] = 4'b0000;
    mem_dump[218] = 4'b0000;
    mem_dump[219] = 4'b0000;
    mem_dump[220] = 4'b0000;
    mem_dump[221] = 4'b0000;
    mem_dump[222] = 4'b0000;
    mem_dump[223] = 4'b0000;
    mem_dump[224] = 4'b0000;
    mem_dump[225] = 4'b0000;
    mem_dump[226] = 4'b0000;
    mem_dump[227] = 4'b0000;
    mem_dump[228] = 4'b0000;
    mem_dump[229] = 4'b0000;
    mem_dump[230] = 4'b0000;
    mem_dump[231] = 4'b0000;
    mem_dump[232] = 4'b0000;
    mem_dump[233] = 4'b0000;
    mem_dump[234] = 4'b0000;
    mem_dump[235] = 4'b0000;
    mem_dump[236] = 4'b0000;
    mem_dump[237] = 4'b0000;
    mem_dump[238] = 4'b0000;
    mem_dump[239] = 4'b0000;
    mem_dump[240] = 4'b0000;
    mem_dump[241] = 4'b0000;
    mem_dump[242] = 4'b0000;
    mem_dump[243] = 4'b0000;
    mem_dump[244] = 4'b0000;
    mem_dump[245] = 4'b0000;
    mem_dump[246] = 4'b0000;
    mem_dump[247] = 4'b0000;
    mem_dump[248] = 4'b0000;
    mem_dump[249] = 4'b0000;
    mem_dump[250] = 4'b0000;
    mem_dump[251] = 4'b0000;
    mem_dump[252] = 4'b0000;
    mem_dump[253] = 4'b0000;
    mem_dump[254] = 4'b0000;
    mem_dump[255] = 4'b0000;
end

endmodule
