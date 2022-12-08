module ALU (B,ENB,ENA,A,INVA,F0,F1,Carry_in,Carry_out,Out);

input A,B,ENA,ENB;
input INVA;

input F0,F1;
input Carry_in;

output reg Out;
output reg Carry_out;

reg sysA,sysB;	// signal in the system (after the 'xor' and 'and' gates)
reg Casig;
reg [1:0] Arith;
reg  sum,opand,opor,opnot;
wire [1:0] state;
assign state = {F1,F0};

always @(state)
begin
case (state)
2'b00: begin Out = opand;	Carry_out = 1'b0;		end
2'b01: begin Out = opor;	Carry_out = 1'b0;		end
2'b10: begin Out = opnot;	Carry_out = 1'b0;		end
2'b11: begin Out = sum;		Carry_out = Casig;	end
endcase
end

always @(state or INVA or A or ENA or B or ENB)
begin
	
	if (INVA)
	begin
		if (ENA)
		begin
			sysA = ~A;
		end
		else
		begin
			sysA = 1'b1;
		end
	end
	else
	begin
		if (ENA)
		begin
			sysA = A;
		end
		else
		begin
			sysA = 1'b0;
		end
	end
	
	if (ENB)
	begin
		sysB = B;
	end
	else
	begin
		sysB = 1'b0;
	end

	case (state)
	2'b00: begin
		opor	=	1'b0;
		opnot	=	1'b0;
		Casig	=	1'b0;
		sum	=	1'b0;
		opand = 	sysA & sysB;
		end
		
	2'b01: begin
		opand =	1'b0;
		opnot =	1'b0;
		Casig =	1'b0;
		sum 	=	1'b0;
		opor	=	sysA | sysB;
		end

	2'b10: begin
		opand	=	1'b0;
		opor	=	1'b0;
		Casig	=	1'b0;
		sum	=	1'b0;
		opnot	=	~sysB;
	end
	
	2'b11: begin
		opand	=	1'b0;
		opor	=	1'b0;
		opnot	=	1'b0;
		Arith	=	sysA + sysB + Carry_in;
		Casig	=	Arith[1];
		sum	=	Arith[0];
	end

	endcase
	
end

endmodule
