//Behaviorial modeling Design.
module Decoder3x8_ver1_Behave (D0,D1,D2,D3,D4,D5,D6,D7,A,B,C);
output reg D0,D1,D2,D3,D4,D5,D6,D7;
input  A,B,C;	//A - MSB, C - LSB
reg [2:0] in;
always @ (A,B,C)
begin
in = {A,B,C};
D0 = 0;
D1 = 0;
D2 = 0;
D3 = 0;
D4 = 0;
D5 = 0;
D6 = 0;
D7 = 0;
case (in)
3'b000: D0 = 1'b1;
3'b001: D1 = 1'b1;
3'b010: D2 = 1'b1;
3'b011: D3 = 1'b1;
3'b100: D4 = 1'b1;
3'b101: D5 = 1'b1;
3'b110: D6 = 1'b1;
3'b111: D7 = 1'b1;
endcase
end
endmodule