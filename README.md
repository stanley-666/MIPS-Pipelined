# Acknowledgments
This code is based on Stanley. 
# Intro
This is MIPS five stages pipeline including IF, ID, EX, MEM, WB stage.
You can use `tb_Pipelined.v` to test the correction of elements.
#setup environment using iverilog
set environment path to iverilog/bin
and file open path /input.txt
iverilog -o test tb/ *.v 
vvp test

