//Author: Juan and Marie
//module XOR_1(input: [7:0]first_in, [7:0]second_in, Output: [7:0]q_out); 

module XOR_1(
	input		[7:0]first_in, 
	input		[7:0]second_in,
	output	[7:0]q_out); 
	
	assign q_out = first_in ^ second_in; 
	
endmodule 