
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralFullAdder(sum, carryout, a, b, carryin);
output sum, carryout;
input a, b, carryin;
assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder(sum, carryout, a, b, carryin);
output sum, carryout;
input a, b, carryin;
 // Your Code Here

// declarations
wire AxorB, AnB, CnAxorB;

`XOR(AxorB, a, b);
`XOR(sum, AxorB, carryin);
`AND(AnB, a, b);
`AND(CnAxorB, AxorB, carryin);
`OR(carryout, CnAxorB, AnB);

endmodule

module testFullAdder;
reg a, b, carryin;
wire sum, carryout;
//behavioralFullAdder adder (sum, carryout, a, b, carryin);
structuralFullAdder adder (sum, carryout, a, b, carryin);


initial begin
// Your Code Here

$display("a  b Cin | Cout sum | Expected Output"); // opposite of provided test bed:
// LSB on the right.
a = 0; b = 0; carryin = 0; #1000 
$display("%b  %b  %b  |  %b    %b  | Zero  (00)", a, b, carryin, carryout, sum);
a = 0; b = 0; carryin = 1; #1000
$display("%b  %b  %b  |  %b    %b  | One   (01)", a, b, carryin, carryout, sum);
a = 0; b = 1; carryin = 0; #1000 
$display("%b  %b  %b  |  %b    %b  | One   (01)", a, b, carryin, carryout, sum);
a = 0; b = 1; carryin = 1; #1000
$display("%b  %b  %b  |  %b    %b  | Two   (10)", a, b, carryin, carryout, sum);
a = 1; b = 0; carryin = 0; #1000
$display("%b  %b  %b  |  %b    %b  | One   (01)", a, b, carryin, carryout, sum);
a = 1; b = 0; carryin = 1; #1000
$display("%b  %b  %b  |  %b    %b  | Two   (10)", a, b, carryin, carryout, sum);
a = 1; b = 1; carryin = 0; #1000
$display("%b  %b  %b  |  %b    %b  | Two   (10)", a, b, carryin, carryout, sum);
a = 1; b = 1; carryin = 1; #1000
$display("%b  %b  %b  |  %b    %b  | Three (11)", a, b, carryin, carryout, sum);

end
endmodule
