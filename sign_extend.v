module sign_extend(unextend,extended);

    input  [15:0] unextend;
    output [31:0] extended;

    assign extended = {{16{unextend[15]}}, unextend};

endmodule