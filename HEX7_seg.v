//Author: Marie May
//7-segment display for binary to Hexadecimal
//HEX7_seg(inputs: [3:0]sum, output: [7:0] seg);
module HEX7_seg(
	input			[3:0] sum, 
	output reg 	[7:0] seg_out);
	
	always @(sum)
		begin
		case(sum)
			0 			: seg_out = 8'b11000000;	//0
			1 			: seg_out = 8'b11111001;	//1
			2 			: seg_out = 8'b10100100;	//2
			3 			: seg_out = 8'b10110000;	//3
			4 			: seg_out = 8'b10011001;	//4
			5 			: seg_out = 8'b10010010;	//5
			6 			: seg_out = 8'b10000010;	//6
			7 			: seg_out = 8'b11111000;	//7
			8 			: seg_out = 8'b10000000;	//8
			9 			: seg_out = 8'b10011000;	//9
			10			: seg_out = 8'b10001000; 	//10 (A)
			11			: seg_out = 8'b10000011; 	//11 (b)
			12			: seg_out = 8'b11000110; 	//12 (C)
			13			: seg_out = 8'b10100001; 	//13 (d)
			14			: seg_out = 8'b10000110; 	//14 (E)
			15			: seg_out = 8'b10001110; 	//15 (F)
			default 	: seg_out = 8'b01111111; 	//dot
			endcase
		end
	endmodule