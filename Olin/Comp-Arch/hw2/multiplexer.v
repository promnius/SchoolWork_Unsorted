
`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;
wire[3:0] inputs = {in3, in2, in1, in0};
wire[1:0] address = {address1, address0};
assign out = inputs[address];
endmodule

module structuralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;
 // Your Code Here

// declarations
wire combo0, combo1, combo2, combo3;
wire nA, nB;

`NOT(nA, address0);
`NOT(nB, address1);
`AND(combo0, in0, nB, nA);
`AND(combo1, in1, nB, address0);
`AND(combo2, in2, address1, nA);
`AND(combo3, in3, address1, address0);

`OR(out, combo0, combo1, combo2, combo3);

endmodule


module testMultiplexer;
 // Your Code Here
reg addr0, addr1;
reg in0,in1,in2,in3;
wire out;
//behavioralMultiplexer muxer (out,addr0,addr1,in0,in1,in2,in3);
structuralMultiplexer muxer (out,addr0,addr1,in0,in1,in2,in3); // Swap after testing

initial begin
// just testing two sets of inital conditions (in0,in1,in2,in3)
$display("A1 A0 | in3 in2 in1 in0 | out | Expected Output"); // opposite of provided test bed:
// LSB on the right.
in0 = 1; in1 = 0; in2 = 1; in3 = 0; // my first set of initial conditions
addr0=0;addr1=0; #1000 
$display("%b  %b  |  %b   %b   %b   %b  |  %b  | Input 0 (1)", addr1, addr0, in3, in2, in1, in0, out);
addr0=1;addr1=0; #1000
$display("%b  %b  |  %b   %b   %b   %b  |  %b  | Input 1 (0)", addr1, addr0, in3, in2, in1, in0, out);
addr0=0;addr1=1; #1000 
$display("%b  %b  |  %b   %b   %b   %b  |  %b  | Input 2 (1)", addr1, addr0, in3, in2, in1, in0, out);
addr0=1;addr1=1; #1000 
$display("%b  %b  |  %b   %b   %b   %b  |  %b  | Input 3 (0)", addr1, addr0, in3, in2, in1, in0, out);
in0 = 0; in1 = 1; in2 = 0; in3 = 1; // my second set of initial conditions
addr0=0;addr1=0; #1000 
$display("%b  %b  |  %b   %b   %b   %b  |  %b  | Input 0 (0)", addr1, addr0, in3, in2, in1, in0, out);
addr0=1;addr1=0; #1000 
$display("%b  %b  |  %b   %b   %b   %b  |  %b  | Input 1 (1)", addr1, addr0, in3, in2, in1, in0, out);
addr0=0;addr1=1; #1000 
$display("%b  %b  |  %b   %b   %b   %b  |  %b  | Input 2 (0)", addr1, addr0, in3, in2, in1, in0, out);
addr0=1;addr1=1; #1000 
$display("%b  %b  |  %b   %b   %b   %b  |  %b  | Input 3 (1)", addr1, addr0, in3, in2, in1, in0, out);

//$display("%b  %b  |  %b   %b ", combo0, combo1, combo2, combo3);

end
endmodule
