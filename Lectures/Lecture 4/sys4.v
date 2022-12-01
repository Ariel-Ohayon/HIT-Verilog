module sys4 (out,in,sel);

output reg out;
input [1:0] sel;
input [3:0] in;
wire out1,out2;

assign out1 = sel[0] ? in[1] : in[0];
assign out2 = sel[0] ? in[3] : in[2];

always @(sel,in)
begin
if (sel[1]) begin out = out2; end
else			begin out = out1; end
end

endmodule
