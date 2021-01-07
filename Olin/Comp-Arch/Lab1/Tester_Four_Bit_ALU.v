
// tests a four bit ALU
module Tester_Four_Bit_ALU;
reg [3:0]operandA;
reg [3:0]operandB;
reg [2:0] command;
wire [3:0]result;
wire carryout;
wire zero;
wire overflow;


ALU my_four_bit_ALU(
.result (result), 
.carryout (carryout), 
.zero (zero), 
.overflow (overflow), 
.operandA (operandA), 
.operandB (operandB), 
.command (command));

initial begin

$display("Command |   A     B   | Cout result | Zero  OFL  | Expected Output | What are we testing?");
command = 3'b000;
operandA=4'b0011;operandB=4'b0100;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0111       | Addition", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b000;
operandA=4'b0100;operandB=4'b1111;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0011       | Addition, Carryout, but NOT an overflow (pos plus neg)", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b000;
operandA=4'b0010;operandB=4'b0111;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      1001       | Addition, overflow, but NOT a carryout (pos plus pos)", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b000;
operandA=4'b1011;operandB=4'b0101;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0000       | Addition, zero (pos plus neg). only official test for zero.", command, operandA, operandB, carryout, result, zero, overflow);
$display(""); // put in some blank space


command = 3'b001;
operandA=4'b0111;operandB=4'b0001;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0110       | Subtraction (pos minus pos)", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b001;
operandA=4'b0011;operandB=4'b0111;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      1100       | Subtraction w/ Carryout (ie, second number larger than first), no overflow (pos minus pos)", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b001;
operandA=4'b0011;operandB=4'b1001;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      1010       | Subtraction, no carryout, yes overflow (pos minus neg) ", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b001;
operandA=4'b1011;operandB=4'b1001;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0010       | Subtraction (neg minus neg), therefore no overflow.", command, operandA, operandB, carryout, result, zero, overflow);
$display(""); // put in some blank space


command = 3'b010;
operandA=4'b0011;operandB=4'b0011;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0000       | XOR: random test case 1", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b010;
operandA=4'b0001;operandB=4'b1101;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      1100       | XOR: random test case 2 ", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b010;
operandA=4'b1111;operandB=4'b1111;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0000       | XOR: carryout and overflow are always false", command, operandA, operandB, carryout, result, zero, overflow);
$display(""); // put in some blank space


command = 3'b011;
operandA=4'b0101;operandB=4'b0111;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0001       | SLT A<B, no overflow", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b011;
operandA=4'b0111;operandB=4'b0011;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0000       | SLT A>B, no overflow", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b011;
operandA=4'b1110;operandB=4'b0111;  #1000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0001       | SLT A<B, overflow (flag should remain unset)", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b011;
operandA=4'b0111;operandB=4'b1011;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0000       | SLT A>B, overflow (flag should remain unset)", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b011;
operandA=4'b0101;operandB=4'b0101;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0000       | SLT A=B, no overflow", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b011;
operandA=4'b1111;operandB=4'b1111;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0000       | SLT carryout should be false (disabled)", command, operandA, operandB, carryout, result, zero, overflow);
$display(""); // put in some blank space


command = 3'b100;
operandA=4'b1001;operandB=4'b0011;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0001       | AND: random case 1", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b100;
operandA=4'b1001;operandB=4'b1101;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      1001       | AND: random case 2", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b100;
operandA=4'b1111;operandB=4'b1111;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      1111       | AND: carryout and overflow are always false", command, operandA, operandB, carryout, result, zero, overflow);
$display(""); // put in some blank space

command = 3'b101;
operandA=4'b1100;operandB=4'b1011;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0111       | NAND: random test case 1", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b101;
operandA=4'b1001;operandB=4'b1000;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0111       | NAND: random test case 2", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b101;
operandA=4'b1111;operandB=4'b1111;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0000       | NAND: carryout and overflow are always false", command, operandA, operandB, carryout, result, zero, overflow);
$display(""); // put in some blank space

command = 3'b110;
operandA=4'b0001;operandB=4'b1100;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0010       | NOR: random test case 1", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b110;
operandA=4'b1100;operandB=4'b1011;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0000       | NOR: random test case 2", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b110;
operandA=4'b1111;operandB=4'b1111;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0000       | NOR: carryout and overflow are always false", command, operandA, operandB, carryout, result, zero, overflow);
$display(""); // put in some blank space


command = 3'b111;
operandA=4'b0111;operandB=4'b0001;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      0111       | OR: random test case 1", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b111;
operandA=4'b1100;operandB=4'b1001;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      1101       | OR: random test case 2", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b111;
operandA=4'b1111;operandB=4'b1111;  #1000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   |      1111       | OR: carryout and overflow are always false", command, operandA, operandB, carryout, result, zero, overflow);
$display(""); // put in some blank space

$display("Note that the cases that test for carryout and overflow always being false, only actually test carryout. since the equivilant addition is (-1) + (-1), this case would never show overflow. an additional test case should be added to each of the discrete gates."); // put in some blank space

end

endmodule
