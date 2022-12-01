module sys3 (out,in,sel);

output reg out;
input [1:0] sel;
input [3:0] in;
reg out1,out2;

always @(sel,in)
begin
	if (sel[0])
	begin
		out1 = in[1];
	end
	else
	begin
		out1 = in[0];
	end
	if (sel[0])
	begin
		out2 = in[3];
	end
	else
	begin
		out2 = in[2];
	end
	if (sel[1])
	begin
		out = out2;
	end
	else
	begin
		out = out1;
	end
	
end

endmodule
