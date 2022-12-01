module Mux_8x1(sel,in,out);

output reg out;
input [2:0] sel;
input [7:0] in;

integer count;

always @(sel,in)
	out = in[sel];
endmodule
