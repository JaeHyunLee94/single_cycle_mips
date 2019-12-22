module aludec(func, aluop, alucontrol);
input   [5:0] func;
input   [1:0] aluop;
output reg [3:0] alucontrol;

always @(aluop, func)
begin
    case(aluop)
      2'b00: alucontrol <= 4'b0010;  // add
      2'b01: alucontrol <= 4'b0110;  // sub
      default: case(func)          // RTYPE
          6'b100000: alucontrol <= 4'b0010; // add
          6'b000000: alucontrol <= 4'b1010; // sll
          6'b000010: alucontrol <= 4'b1100; // srl
          6'b100010: alucontrol <= 4'b0110; // sub
          6'b100100: alucontrol <= 4'b0000; // and
          6'b100101: alucontrol <= 4'b0001; // or
          6'b101011: alucontrol <= 4'b0111; // sltu
          default:   alucontrol <= 4'b0001; // ori
        endcase
    endcase
end

endmodule
