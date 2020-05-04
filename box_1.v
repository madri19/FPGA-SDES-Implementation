//Author: Juan and Marie
//module box_1(input: ([9:0]q_in, [9:0]q_out); 

module box_1(
	input			[9:0]q_in, 
	output wire	[9:0]q_out); 
	
	assign q_out = {q_in[7], q_in[5], q_in[8], q_in[3], q_in[6], q_in[0], q_in[9], q_in[1], q_in[2], q_in[4]};
	//assign q_out= {q_in[2], q_in[4], q_in[1], q_in[6], q_in[3], q_in[9], q_in[0], q_in[8], q_in[7], q_in[5]};
	
endmodule 