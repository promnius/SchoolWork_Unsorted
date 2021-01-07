
// tests functionality of an Eight bit ALU
module Tester_Eight_Bit_ALU;
reg [7:0]operandA;
reg [7:0]operandB;
reg [2:0] command;
wire [7:0]result;
wire carryout;
wire zero;
wire overflow;



ALU my_eight_bit_ALU(
.result (result), 
.carryout (carryout), 
.zero (zero), 
.overflow (overflow), 
.operandA (operandA), 
.operandB (operandB), 
.command (command));

initial begin

$display("Command |     A         B     | Cout   result   | Zero  OFL  | What are we testing?");

command = 3'b000;
operandA=8'b10100011;operandB=8'b11110100;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | Addition", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b000;
operandA=8'b01000010;operandB=8'b11110011;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | Addition", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b000;
operandA=8'b00100100;operandB=8'b01110001;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | Addition", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b000;
operandA=8'b10110101;operandB=8'b01010101;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | Addition", command, operandA, operandB, carryout, result, zero, overflow);
$display(""); // put in some blank space


command = 3'b001;
operandA=8'b01110101;operandB=8'b00010101;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | Subtract", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b001;
operandA=8'b00101011;operandB=8'b01010111;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | Subtract", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b001;
operandA=8'b00101011;operandB=8'b01011001;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | Subtract", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b001;
operandA=8'b10010111;operandB=8'b10010101;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | Subtract", command, operandA, operandB, carryout, result, zero, overflow);
$display(""); // put in some blank space


command = 3'b010;
operandA=8'b00101011;operandB=8'b01010011;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | XOR", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b010;
operandA=8'b00010101;operandB=8'b11010101;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | XOR", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b010;
operandA=8'b11010111;operandB=8'b11010111;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | XOR", command, operandA, operandB, carryout, result, zero, overflow);
$display(""); // put in some blank space


command = 3'b011;
operandA=8'b01010101;operandB=8'b01010111;  #10000 
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | SLT", command, operandA, operandB, carryout, result, zero, overflow);

command = 3'b011;
operandA=8'b01010111;operandB=8'b01010011;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | SLT", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b011;
operandA=8'b11101010;operandB=8'b01110101;  #1000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | SLT", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b011;
operandA=8'b01101011;operandB=8'b10101011;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | SLT", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b011;
operandA=8'b01010101;operandB=8'b01001011;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | SLT", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b011;
operandA=8'b11110101;operandB=8'b10101111;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | SLT", command, operandA, operandB, carryout, result, zero, overflow);
$display(""); // put in some blank space


command = 3'b100;
operandA=8'b10010101;operandB=8'b00101011;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | AND", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b100;
operandA=8'b10010101;operandB=8'b11010101;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | AND", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b100;
operandA=8'b01011111;operandB=8'b11010111;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | AND", command, operandA, operandB, carryout, result, zero, overflow);
$display(""); // put in some blank space

command = 3'b101;
operandA=8'b10101100;operandB=8'b10010111;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | NAND", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b101;
operandA=8'b10010101;operandB=8'b10010100;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | NAND", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b101;
operandA=8'b11010111;operandB=8'b11101011;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | NAND", command, operandA, operandB, carryout, result, zero, overflow);
$display(""); // put in some blank space

command = 3'b110;
operandA=8'b00010101;operandB=8'b10101100;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | NOR", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b110;
operandA=8'b11010100;operandB=8'b10101011;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | NOR", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b110;
operandA=8'b11101011;operandB=8'b11010111;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | NOR", command, operandA, operandB, carryout, result, zero, overflow);
$display(""); // put in some blank space


command = 3'b111;
operandA=8'b01101011;operandB=8'b00101001;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | OR", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b111;
operandA=8'b10101100;operandB=8'b10010101;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | OR", command, operandA, operandB, carryout, result, zero, overflow);
command = 3'b111;
operandA=8'b10101111;operandB=8'b11010111;  #10000
$display("  %b   | %b  %b  |  %b   %b   |   %b    %b   | OR", command, operandA, operandB, carryout, result, zero, overflow);
$display(""); // put in some blank space


end

endmodule