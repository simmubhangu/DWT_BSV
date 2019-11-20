# DWT_BSV
run the follwoing commend:
1. bsv -verilog Dwt_compression.bsv
2. bsv -e mkDWTComp mkDWTComp.v
3. ./a.out >> abc.txt # this will print and generate the .txt file

# check the generated text file
1. python sparse_to_image.py abc.txt
