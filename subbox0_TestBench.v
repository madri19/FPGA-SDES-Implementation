//Author Marie May
//testing the S0 box
module subbox0_TestBench; 

//inputs
reg		[3:0] q_in; 


//outputs
wire	[1:0] q_out; 
 

//Instantiate the Unit Under Test(UUT)
S0 uut (
	.q_in(q_in),
	.q_out(q_out));

initial 
	begin
$display("Commencing test procedure...");

//scenario 1 - KEY: 1010101010
	q_in = 4'b0111; 			//test input 
	#50; 
	if(cipher != 8'b01011001) $display("ERROR: cipher does not match in case 1!"); 
	else  $display("PASS: case 1!"); 

//clear out data
	enable = 1; #50;

//scenario 2 - KEY: 1010101010
	enable = 0; q_in = 8'b10101010; 			//test input 
	key_1 = 8'b11100100; key_2 = 8'b01010011; 
	#50; 
	if(cipher != 8'b01101011) $display("ERROR: cipher does not match in case 2!"); 
	else  $display("PASS: case 2!"); 
	
//clear out data
	enable = 1; #50;
	
//scenario 3 encrypt - KEY: 1011111101
	enable = 0; q_in = 8'b11111110; 			//test input 
	key_1 = 8'b11011111; key_2 = 8'b11111001; 
	#50; 
	if(cipher != 8'b11100110) $display("ERROR: cipher does not match in case 3!"); 
	else  $display("PASS: case 3!"); 

//clear out data
	enable = 1; #50;
	
//scenario 4 decrypt - KEY: 1011111101
	enable = 0; q_in = 8'b01111111; 			//test input 
	key_1 = 8'b11111001; key_2 = 8'b11011111; 
	#50; 
	if(cipher != 8'b00000000) $display("ERROR: cipher does not match in case 4!"); 
	else  $display("PASS: case 4!"); 
	
//clear out data
	enable = 1; #50;
	
//scenario 5 encrypt - KEY: 1111100000
	enable = 0; q_in = 8'b10011001; 			//test input 
	key_1 = 8'b10010100; key_2 = 8'b01010101; 
	#50; 
	if(cipher != 8'b00111100) $display("ERROR: cipher does not match in case 5!"); 
	else  $display("PASS: case 5!"); 
	
//clear out data
	enable = 1; #50;

//scenario 6 decrypt - KEY: 1111100000
	enable = 0; q_in = 8'b10101010; 			//test input 
	key_1 = 8'b01010101; key_2 = 8'b10010100; 
	#50; 
	if(cipher != 8'b01111010) $display("ERROR: cipher does not match in case 6!"); 
	else  $display("PASS: case 6!"); 

$display("Testing procedure completed!");
	end
endmodule 