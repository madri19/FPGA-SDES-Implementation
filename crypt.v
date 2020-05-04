//Author: Juan and Marie
//crypt(input: enable, [7:0]q_in, [7:0]key_1, [7:0]key_2, output: [7:0]cipher);

module crypt(
	input 		enable, 			//control input
	input			[7:0]q_in, 		//original plaintext of 8 bits
	input			[7:0]key_1,		//key 1 of 8 bits
	input			[7:0]key_2,		//key 2 of 8 bits
	output reg	[7:0]cipher, 
	output reg	[3:0]debug);	//final output ciphertext of 8 bits
	
	wire		[7:0]temp_1;	//output of BOX3
	wire		[7:0]temp_2; 	//output of BOX4
	wire		[7:0]temp_3;	//output of XOR1
	wire		[1:0]temp_4; 	//output of S0
	wire		[1:0]temp_5; 	//output of S1
 
	wire		[3:0]temp_7;	//output of BOX5
	wire		[3:0]temp_8; 	//output of XOR2
	wire		[7:0]temp_9;	//output of BOX4
	wire		[7:0]temp_10; 	//output of XOR1_r
	wire		[1:0]temp_11; 	//output of S0_r
	wire		[1:0]temp_12; 	//output of S1_r
	wire		[3:0]temp_14;	//output of BOX5_r
	wire		[3:0]temp_15;	//output of XOR2_r
	wire		[3:0]temp_6 = {temp_4, temp_5}; 		//input for BOX5
	wire		[3:0]temp_13 = {temp_11, temp_12};	//input for BOX5_r
	wire		[7:0]temp_16 = {temp_15, temp_8}; 	//input for BOX6_R	

	wire		[7:0]out_1; //final cipher output
	
	

	/*execution order left:*/
		box_3 BOX3(q_in, temp_1); 				//phase 1
		box_4 BOX4(temp_1[3:0], temp_2); 	//phase 2
		XOR_1 XOR1(temp_2, key_1, temp_3); 	//phase 3
		S0 left(temp_3[7:4], temp_4);			//phase 4 
		S1 left_r(temp_3[3:0], temp_5);		//phase 4
		box_5 BOX5(temp_6, temp_7); 			//phase 5
		XOR_2 XOR2(temp_1[7:4], temp_7, temp_8);  //phase 6
	
	/*execution order right*/
		box_4 BOX4_r(temp_8, temp_9); 			//phase 7
		XOR_1 XOR1_r(temp_9, key_2, temp_10);	//phase 8
		S0 right(temp_10[7:4], temp_11); 		//phase 9
		S1 right_1(temp_10[3:0], temp_12);		//phase 9
		box_5 BOX5_r(temp_13, temp_14); 			//phase 10
		XOR_2 XOR2_r(temp_1[3:0], temp_14, temp_15);	//phase 11
		box_6 BOX6(temp_16, out_1); 				//phase 12

	
	always@(enable)
		begin
			if(~enable)
				begin 
				cipher <= out_1; 
				debug <= temp_8;
				end
			else
				cipher <= 0; 
		end
	
endmodule 
		