


vlog -reportprogress 300 -work work multiplexer.v decoder.v adder.v

# Testing the Decoder
if (1) { # way of quickly selecting which circuit I wish to debug without multiple do files
vsim -voptargs="+acc" testDecoder
add wave -position insertpoint  \
sim:/testDecoder/addr0 \
sim:/testDecoder/addr1 \
sim:/testDecoder/enable \
sim:/testDecoder/out0 \
sim:/testDecoder/out1 \
sim:/testDecoder/out2 \
sim:/testDecoder/out3
}


# testing the muxer
if (0) {
vsim -voptargs="+acc" testMultiplexer
add wave -position insertpoint  \
sim:/testMultiplexer/addr0 \
sim:/testMultiplexer/addr1 \
sim:/testMultiplexer/in0 \
sim:/testMultiplexer/in1 \
sim:/testMultiplexer/in2 \
sim:/testMultiplexer/in3 \
sim:/testMultiplexer/out
}


# testing the adder
if (0) {
vsim -voptargs="+acc" testFullAdder
add wave -position insertpoint  \
sim:/testFullAdder/a \
sim:/testFullAdder/b \
sim:/testFullAdder/carryin \
sim:/testFullAdder/sum \
sim:/testFullAdder/carryout
}


run -all
wave zoom full