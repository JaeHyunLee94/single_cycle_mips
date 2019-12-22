module control(inst,out);

input [5:0] inst;
output reg [9:0] out;

always@(inst)begin
    case (inst)
        6'b000000: out<=10'b1100000100;//r
        6'b100011: out<=10'b1010011000;//lw
        6'b101011: out<=10'b0010100000;//sw
        6'b000100: out<=10'b0001000010;//beq
        6'b001000: out<=10'b1010000000;//addi
        6'b001101: out<=10'b1010000000;//ori
        6'b000010: out<=10'b0000000001;//j
        default: out<=10'b0000000000;
    endcase

end

endmodule