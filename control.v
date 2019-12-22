module control(inst,RegWrite,RegDst,AluSrc,Branch,MemWrite,MemRead,MemtoReg,AluOp,jump);

input [5:0] inst;
output RegWrite,RegDst,AluSrc,Branch,MemWrite,MemRead,MemtoReg,jump;
output [1:0] AluOp;
reg [9:0] out;

always@(inst)begin
    case (inst)
        6'b000000: out<=10'b1100000100;//r
        6'b100011: out<=10'b1010011000;//lw
        6'b101011: out<=10'b0010100000;//sw
        6'b000100: out<=10'b0001000010;//beq
        6'b001000: out<=10'b1010000000;//addi
        6'b001101: out<=10'b1010000100;//ori
        6'b000010: out<=10'b0000000001;//j
        default: out<=10'b0000000000;
    endcase

end

assign RegWrite=out[9];
assign RegDst=out[8];
assign AluSrc=out[7];
assign Branch=out[6];
assign MemWrite=out[5];
assign MemRead=out[4];
assign MemtoReg=out[3];
assign AluOp=out[2:1];
assign jump=out[0];

endmodule