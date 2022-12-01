module sys2 (out,sel,in);

output out;
input  [3:0]in;
input  [1:0]sel;
wire out1,out2;

assign out1 = sel[0] ? in[1] : in[0];
assign out2 = sel[0] ? in[3] : in[2];
assign out  = sel[1] ? out2  : out1;


endmodule
