
module mux_32(m1,m2,sel,out);
    input [31:0] m1,m2;
    input sel;

    output [31:0] out;

    assign out=sel? m2 : m1;

endmodule // 
