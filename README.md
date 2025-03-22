#8-bit Linear Convolution(Verilog HDL)

1)Performed Linear Convolution s(n)*h(n)=y(n) where sequences s(n) and h(n) each contained 8 samples in 2’s complement form (8 bits) and generated 15-sample outputs, ensuring proper 2’s complement representation

2)Sequences data is loaded into registers and logic of flipping is applied. Integrated efficient multiplication performed using Booth’s multiplier module

3)Data path controller approach is used to feed the data into the booth multiplier module using select lines. The addition of the multiplied samples is performed which is controlled by data path controller

4)The final samples obtained after convolution are stored into registers which are total 15 samples# Linear_Convolution_Verilog_HDL
