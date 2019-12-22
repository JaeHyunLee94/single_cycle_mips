
module mux_5(rt,rd,sel,wrt_reg);
    input [4:0] rt,rd;
    input sel;

    output [4:0]wrt_reg;

    assign wrt_reg=sel? rd : rt;

endmodule // 