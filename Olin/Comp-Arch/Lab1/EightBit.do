
vlog -reportprogress 300 -work work Eight_Bit_Muxer.v ALU_Bitslice.v One_Bit_FullAdder.v Tester_ALU_Bitslice.v ALUcontrolLUT.v four_bit_ALU.v Tester_Four_Bit_ALU.v n_bit_ALU.v Tester_Eight_Bit_ALU.v

# testing the muxer
vsim -voptargs="+acc" Tester_Eight_Bit_ALU
add wave -position insertpoint  \
sim:/Tester_Eight_Bit_ALU/operandA \
sim:/Tester_Eight_Bit_ALU/operandB \
sim:/Tester_Eight_Bit_ALU/result \
sim:/Tester_Eight_Bit_ALU/command \
sim:/Tester_Eight_Bit_ALU/overflow \
sim:/Tester_Eight_Bit_ALU/zero \
sim:/Tester_Eight_Bit_ALU/carryout

run -all
wave zoom full