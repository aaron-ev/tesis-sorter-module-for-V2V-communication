
`timescale 1ns / 1ps



module merge8to16_tb();



parameter WIDTH = 3;
parameter n = 8;

//odd inputs
`define a1 [WIDTH-1:0] 
`define b1 [WIDTH-1:0] 
`define a3 [3*WIDTH-1:2*WIDTH] 
`define b3 [3*WIDTH-1:2*WIDTH] 
`define a5 [5*WIDTH-1:4*WIDTH] 
`define b5 [5*WIDTH-1:4*WIDTH] 
`define a7 [7*WIDTH-1:6*WIDTH] 
`define b7 [7*WIDTH-1:6*WIDTH] 
//even inputs
`define a2 [2*WIDTH-1:WIDTH] 
`define b2 [2*WIDTH-1:WIDTH] 
`define a4 [4*WIDTH-1:3*WIDTH] 
`define b4 [4*WIDTH-1:3*WIDTH] 
`define a6 [6*WIDTH-1:5*WIDTH] 
`define b6 [6*WIDTH-1:5*WIDTH] 
`define a8 [8*WIDTH-1:7*WIDTH]
`define b8 [8*WIDTH-1:7*WIDTH]

reg [(n*WIDTH)-1:0]a;
reg [(n*WIDTH)-1:0]b;
wire [(2*n*WIDTH)-1:0]c;

wire [WIDTH-1:0]c00 = c`a1;
/*
reg `a1 a1 = a[WIDTH-1:0];
reg `a2 a2 = a`a2;
reg `a3 a3 = a`a3;
reg `a4 a4 = a`a4;
reg `a5 a5 = a`a5;
reg `a6 a6 = a`a6;
reg `a7 a7 = a`a7;
reg `a8 a8 = a`a8;
*/
merge8to16 UUT
(
.a(a),
.b(b),
.c(c)
);

initial begin 
a`a1 = 7;
a`a2 = 7;
a`a3 = 7;
a`a4 = 7;
a`a5 = 7;
a`a6 = 7;
a`a7 = 7;
a`a8 = 7;

b`b1 = 1;
b`b2 = 3;
b`b3 = 4;
b`b4 = 6;
b`b5 = 7;
b`b6 = 7;
b`b7 = 7;
b`b8 = 7;

end
endmodule

