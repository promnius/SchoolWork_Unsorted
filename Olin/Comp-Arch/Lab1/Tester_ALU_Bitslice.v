
// exaustively tests a single bitslice
module Tester_ALU_Bitslice;
reg A;
reg B;
reg carryin;
reg [2:0] Control;
wire result;
wire carryout;

ALU_Bitslice myBitslice(
.result_i (result), 
.A_i (A), 
.B_i (B), 
.carryin (carryin), 
.carryout (carryout), 
.command (Control));


initial begin
$display("Command | A  B  carryin | Cout result | What are we testing?");
Control = 3'b000;
A=0;B=0;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | Addition: 00", Control, A, B, carryin, carryout, result);
A=0;B=1;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | Addition: 01", Control, A, B, carryin, carryout, result);
A=1;B=0;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | Addition: 01", Control, A, B, carryin, carryout, result);
A=1;B=1;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | Addition: 10", Control, A, B, carryin, carryout, result);
A=0;B=0;carryin=1; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | Addition: 01", Control, A, B, carryin, carryout, result);
A=0;B=1;carryin=1; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | Addition: 10", Control, A, B, carryin, carryout, result);
A=1;B=0;carryin=1; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | Addition: 10", Control, A, B, carryin, carryout, result);
A=1;B=1;carryin=1; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | Addition: 11", Control, A, B, carryin, carryout, result);

Control = 3'b001;
A=0;B=0;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | Subtraction: 01", Control, A, B, carryin, carryout, result);
A=0;B=1;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | Subtraction: 00", Control, A, B, carryin, carryout, result);
A=1;B=0;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | Subtraction: 10", Control, A, B, carryin, carryout, result);
A=1;B=1;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | Subtraction: 01", Control, A, B, carryin, carryout, result);
A=0;B=0;carryin=1; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | Subtraction: 10", Control, A, B, carryin, carryout, result);
A=0;B=1;carryin=1; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | Subtraction: 01", Control, A, B, carryin, carryout, result);
A=1;B=0;carryin=1; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | Subtraction: 11", Control, A, B, carryin, carryout, result);
A=1;B=1;carryin=1; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | Subtraction: 10", Control, A, B, carryin, carryout, result);

Control = 3'b010;
A=0;B=0;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | XOR: result false ", Control, A, B, carryin, carryout, result);
A=0;B=1;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | XOR: result true ", Control, A, B, carryin, carryout, result);
A=1;B=0;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | XOR: result true", Control, A, B, carryin, carryout, result);
A=1;B=1;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | XOR: result false ", Control, A, B, carryin, carryout, result);
A=1;B=1;carryin=1; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | XOR: carryin and carryout don't matter", Control, A, B, carryin, carryout, result);

Control = 3'b011;
A=0;B=0;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | SLT (subtract): 01", Control, A, B, carryin, carryout, result);
A=0;B=1;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | SLT (subtract): 00", Control, A, B, carryin, carryout, result);
A=1;B=0;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | SLT (subtract): 10", Control, A, B, carryin, carryout, result);
A=1;B=1;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | SLT (subtract): 01", Control, A, B, carryin, carryout, result);
A=0;B=0;carryin=1; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | SLT (subtract): 10", Control, A, B, carryin, carryout, result);
A=0;B=1;carryin=1; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | SLT (subtract): 01", Control, A, B, carryin, carryout, result);
A=1;B=0;carryin=1; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | SLT (subtract): 11", Control, A, B, carryin, carryout, result);
A=1;B=1;carryin=1; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | SLT (subtract): 10", Control, A, B, carryin, carryout, result);

Control = 3'b100;
A=0;B=0;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | AND: result false", Control, A, B, carryin, carryout, result);
A=0;B=1;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | AND: result false", Control, A, B, carryin, carryout, result);
A=1;B=0;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | AND: result false", Control, A, B, carryin, carryout, result);
A=1;B=1;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | AND: result true", Control, A, B, carryin, carryout, result);
A=1;B=1;carryin=1; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | AND: carryin and carryout don't matter", Control, A, B, carryin, carryout, result);

Control = 3'b101;
A=0;B=0;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | NAND: result true", Control, A, B, carryin, carryout, result);
A=0;B=1;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | NAND: result true", Control, A, B, carryin, carryout, result);
A=1;B=0;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | NAND: result true", Control, A, B, carryin, carryout, result);
A=1;B=1;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | NAND: result false", Control, A, B, carryin, carryout, result);
A=1;B=1;carryin=1; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | NAND: carryin and carryout don't matter", Control, A, B, carryin, carryout, result);


Control = 3'b110;
A=0;B=0;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | NOR: result true", Control, A, B, carryin, carryout, result);
A=0;B=1;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | NOR: result false", Control, A, B, carryin, carryout, result);
A=1;B=0;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | NOR: result false", Control, A, B, carryin, carryout, result);
A=1;B=1;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | NOR: result false", Control, A, B, carryin, carryout, result);
A=1;B=1;carryin=1; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | NOR: carryin and carryout don't matter", Control, A, B, carryin, carryout, result);


Control = 3'b111;
A=0;B=0;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | OR: result false", Control, A, B, carryin, carryout, result);
A=0;B=1;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | OR: result true", Control, A, B, carryin, carryout, result);
A=1;B=0;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | OR: result true", Control, A, B, carryin, carryout, result);
A=1;B=1;carryin=0; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | OR: result true", Control, A, B, carryin, carryout, result);
A=1;B=1;carryin=1; #1000 
$display("  %b   | %b  %b     %b    |   %b    %b    | OR: carryin and carryout don't matter", Control, A, B, carryin, carryout, result);

end

endmodule
