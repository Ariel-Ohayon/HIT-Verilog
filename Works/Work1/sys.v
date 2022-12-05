module sys (y,a,b);

output [7:0] y;
input  [7:0] a;
input  [3:0] b;

assign y[7:4] = a[3:0] & b;
assign y[3:0] = a[7:4] ^ y[7:4];
endmodule
