//Author: Juan and Marie
//module circ_left(input: [4:0]q_in, [4:0]q_out); 

module circ_left(
	input		[4:0]q_in, 
	output	[4:0]q_out); 
	
	
	assign q_out = {q_in[3:0], q_in[4]}; 
	
endmodule