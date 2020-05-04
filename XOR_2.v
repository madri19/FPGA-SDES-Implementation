//Author: Juan and Marie
//module XOR_2(input: [3:0]first_in, [3:0]second_in, Output: [3:0]q_out); 

module XOR_2(
	input		[3:0]first_in, 
	input		[3:0]second_in,
	output	[3:0]q_out); 
	
	assign q_out = first_in ^ second_in; 
	
endmodule 