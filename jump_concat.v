module jump_concat(inst,pc,out_adr);
    input [25:0] inst;
    input [3:0] pc;

    output [31:0] out_adr;

    assign out_adr = {pc,inst <<2};



endmodule