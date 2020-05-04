//Author: Juan and Marie
//module circ_left_double(input:[4:0]q_in, [4:0]q_out); 

module circ_left_double(
	input		[4:0]q_in, 
	output	[4:0]q_out); 
	
	
	assign q_out = {q_in[2:0], q_in[4:3]}; 
	
endmodule