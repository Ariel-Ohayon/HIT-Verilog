module Mux (sel,in0,in1,out);
input sel,in0,in1;
output out;

assign out = (sel & in1) | ((~ sel) & in0);

endmodule