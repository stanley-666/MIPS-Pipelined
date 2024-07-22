# Acknowledgments
contributor @Stanley @Iris @Fan 
# Intro
This is MIPS five stages pipeline including IF, ID, EX, MEM, WB stage.
You can use `tb_Pipelined.v` to test the correction of elements.  

# MIPS Lite Instruction set  
SUB, AND, OR, SLT, DIV, MFHI, MFLO

# Setup environment using iverilog
Set environment path to `iverilog/bin` then put all the file under `iverilog/bin/'name'` directory   
Open and set `tb_ALU.v` fopen path `'name'/input.txt` , `'name'/ans.txt`or put `input.txt` under iverilog/bin  
Open command prompt then type
```
cd C:\iverilog\bin  
iverilog -o test tb/*.v  
vvp test  
```
