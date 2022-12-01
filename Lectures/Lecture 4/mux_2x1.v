module mux_2x1(out,in,sel);

output reg out;
input [1:0] in;
input sel;

always @(in,sel)
begin
if (sel)
	out = in[1];
else
	out = in[0];
end
endmodule
