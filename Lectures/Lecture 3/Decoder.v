module Decoder (I0,I1,Y0,Y1,Y2,Y3);
input  I0,I1;
output Y0,Y1,Y2,Y3;

assign Y0 = (~I1)  & (~I0);
assign Y1 = (~I1)  & ( I0);
assign Y2 = ( I1)  & (~I0);
assign Y3 = ( I1)  & ( I0);

endmodule