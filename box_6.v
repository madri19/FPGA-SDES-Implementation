//Author: Juan and Marie
//module box_6(input: ([7:0]q_in, [7:0]q_out); 

module box_6(
	input		[7:0]q_in, 
	output	[7:0]q_out); 
	
	assign q_out = {q_in[4], q_in[7], q_in[5], q_in[3], q_in[1], q_in[6], q_in[0], q_in[2]}; 
	
endmodule 