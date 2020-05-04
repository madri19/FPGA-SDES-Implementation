//Author: Juan and Marie

module S1(
	input 		[3:0]q_in, 
	output reg	[1:0]q_out);

always @(q_in)
	begin
		case(q_in)
			4'b0000: q_out = 2'b00; //row 0, col 0
			4'b0010: q_out = 2'b01; //row 0, col 1
			4'b0100: q_out = 2'b10; //row 0, col 2
			4'b0110: q_out = 2'b11; //row 0, col 3
			
			4'b0001: q_out = 2'b10; //row 1, col 0
			4'b0011: q_out = 2'b00; //row 1, col 1
			4'b0101: q_out = 2'b01; //row 1, col 2
			4'b0111: q_out = 2'b11; //row 1, col 3
		
			4'b1000: q_out = 2'b11; //row 2, col 0
			4'b1010: q_out = 2'b00; //row 2, col 1
			4'b1100: q_out = 2'b01; //row 2, col 2
			4'b1110: q_out = 2'b00; //row 2, col 3
	
			4'b1001: q_out = 2'b10; //row 3, col 0
			4'b1011: q_out = 2'b01; //row 3, col 1
			4'b1101: q_out = 2'b00; //row 3, col 2
			4'b1111: q_out = 2'b11; //row 3, col 3
		endcase
	end

endmodule 