//Author: Juan and Marie
//module box_4(input: [3:0]q_in, output: [7:0]q_out); 

module box_4(
	input 		[3:0]q_in, 
	output wire	[7:0]q_out);


	assign q_out = {q_in[0], q_in[3], q_in[2], q_in[1], q_in[2], q_in[1], q_in[0], q_in[3]};


endmodule 