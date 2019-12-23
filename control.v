module control(inst,func,RegWrite,RegDst,AluSrc,Branch,MemWrite,MemRead,MemtoReg,AluOp,jump);

input [5:0] inst;
input [5:0] func;
output RegWrite,RegDst,AluSrc,Branch,MemWrite,MemRead,MemtoReg,jump;
output [3:0] AluOp;
reg [11:0] out;

always@(inst,func)begin
    if(inst==6'b000000)begin //r
        if(func==6'b100000) out<=12'b110001000100;//add
        else if(func==6'b000000)out<=12'b10000100010100;//sll
        else if(func==6'b000010)out<=12'b11000100011000;//srl
        else if(func==6'b100010)out<=12'b11000100001100;//sub
        else if(func==6'b100100)out<=12'b11000100000000;//and
        else if(func==6'b100101)out<=12'b11000100000010;//or
        else if(func==6'b101011)out<=12'b11000100001110;//sltu
        

    end
    else if(inst== 6'b100011) out<=12'b101001100100;//lw
    else if(inst==6'b101011) out<=12'b001010000100;//sw
    else if(inst==6'b000100) out<=12'b000100001100;//beq
    else if (inst==6'b001000) out<=12'b101000000100;//addi
    else if(inst==6'b001101) out<=12'b101000000010;//ori
    else if(inst==6'b000010) out<=12'b000000000101;//j
    else out<=12'b000000000000;
    

end

assign RegWrite=out[11];
assign RegDst=out[10];
assign AluSrc=out[9];
assign Branch=out[8];
assign MemWrite=out[7];
assign MemRead=out[6];
assign MemtoReg=out[5];
assign AluOp=out[4:1];
assign jump=out[0];

endmodule