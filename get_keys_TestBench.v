//Author Marie May
//testing the get_keys function in the HWK2 SDES Program
module get_keys_TestBench; 

//inputs
reg 	enable; 
reg		[9:0] q_in; 


//outputs
wire	[7:0] key_1; 
wire	[7:0] key_2;  

//Instantiate the Unit Under Test(UUT)
get_keys uut (
	.enable(enable),
	.q_in(q_in),
	.key_1(key_1),
	.key_2(key_2));

initial 
	begin
$display("Commencing test procedure...");

//scenario 1
enable = 0; q_in = 10'b1111100000; 			//test input 
#50; 
if(key_1 != 8'b10010100) $display("ERROR: Key_1 does not match in case 1!"); 
else  $display("PASS: Key_1 does match in case 1!"); 

if(key_2 != 8'b01010101) $display("ERROR: Key_2 does not match in case 1!"); 
else  $display("PASS: Key_2 does match in case 1!");

//clear out data
enable = 1; #50;

//scenario 2
enable = 0; q_in = 10'b1010101010; 			//test input 
#50; 
if(key_1 != 8'b11100100) $display("ERROR: Key_1 does not match in case 2!"); 
else  $display("PASS: Key_1 does match in case 2!"); 

if(key_2 != 8'b01010011) $display("ERROR: Key_2 does not match in case 2!"); 
else  $display("PASS: Key_2 does match in case 2!");

$display("Testing procedure completed!");
	end
endmodule 