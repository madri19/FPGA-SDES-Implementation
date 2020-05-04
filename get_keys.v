//Author: Juan and Marie
//module get_keys(input: enable, [9:0]q_in, output: [7:0]key_1, [7:0]key_2);
//module circ_left(input: (i, [4:0]q_in, [4:0]q_out);
//module box_1(input: ([9:0]q_in, [9:0]q_out); 
//module box_2(input: ([9:0]q_in, [9:0]q_out); 


module get_keys(
	input 		enable, 			//control input
	input			[9:0]q_in, 		//original key of 10 bits
	output reg	[7:0]key_1,		//key 1 of 8 bits
	output reg	[7:0]key_2,		//key 2 of 8 bits
	output reg	[9:0]q_out);	//display input keys
	
	wire		[4:0]temp_1; //output of first circular left
	wire		[4:0]temp_2; //output of second circular left
	wire		[4:0]temp_3; //output of first double circular left
	wire		[4:0]temp_4; //output of second double circular left
	wire		[9:0]temp_5; //output of BOX1
	
	wire		[9:0]temp_6 = {temp_1, temp_2};	//BOX2_K1 input
	wire		[9:0]temp_7 = {temp_3, temp_4};	//BOX2_K2 input
	wire		[7:0]out_1;	 	//output key 1
	wire		[7:0]out_2;		//output key 2

	
	/*execution order:*/
	box_1 BOX1(q_in, temp_5);							//phase 1
	circ_left singular_1(temp_5[9:5], temp_1); 	//phase 2
	circ_left singular_2(temp_5[4:0], temp_2); 	//phase 2
	circ_left_double double_1(temp_1, temp_3); 	//phase 3
	circ_left_double double_2(temp_2, temp_4); 	//phase 3
	box_2 BOX2_K1(temp_6, out_1); 					//phase 3
	box_2 BOX2_K2(temp_7, out_2);						//phase 4
	
	always@(enable)
		begin
			if(~enable)
				begin
					key_1 <= out_1; 
					key_2 <= out_2;
					q_out <= q_in; 
				end
		end
	
endmodule 
		