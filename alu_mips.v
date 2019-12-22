module alu_mips(reg_data1, reg_data2,shamt, control, aluout, zero);
input [31:0] reg_data1,reg_data2;
input [4:0] shamt;
input [3:0] control;
output reg [31:0] aluout;
output zero;

always@(control, reg_data1, reg_data2)
begin
	case(control)
		4'b0010: aluout=reg_data1+reg_data2;
		4'b0110: aluout=reg_data1-reg_data2;
		4'b0000: aluout=reg_data1&reg_data2;
		4'b0001: aluout=reg_data1|reg_data2;
		4'b1001: aluout=reg_data1^reg_data2;
		4'b1010: aluout=reg_data2<<shamt;
		4'b1100: aluout=reg_data2>>shamt;
		default: aluout=reg_data1+reg_data2;
	endcase
end

assign zero=aluout==0?1:0;

endmodule
