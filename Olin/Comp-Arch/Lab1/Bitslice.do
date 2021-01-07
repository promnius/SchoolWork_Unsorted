
vlog -reportprogress 300 -work work Eight_Bit_Muxer.v ALU_Bitslice.v One_Bit_FullAdder.v Tester_ALU_Bitslice.v ALUcontrolLUT.v

# testing the muxer
vsim -voptargs="+acc" Tester_ALU_Bitslice
add wave -position insertpoint  \
sim:/Tester_ALU_Bitslice/A \
sim:/Tester_ALU_Bitslice/B \
sim:/Tester_ALU_Bitslice/carryin \
sim:/Tester_ALU_Bitslice/carryout \
sim:/Tester_ALU_Bitslice/result \
sim:/Tester_ALU_Bitslice/Control

run -all
wave zoom full
