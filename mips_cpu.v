module mips_cpu(rst,clk,out_pc,out_result);

    input rst,clk;
    output [31:0] out_pc;
    output [15:0] out_result;

    wire[4:0] reg_wrtadr;
    wire [31:0] instruction,read_data1,read_data2,sign_extended,alu_scr2,alu_result,reg_wrtdata,mem_readdata;
    wire [31:0] new_pc,now_pc,next_pc,branced_pc,jump_pc,branch_selected;
    wire alu_zero,is_branced;
    wire RegWrite,RegDst,AluSrc,Branch,MemWrite,MemRead,MemtoReg,jump;
    wire [1:0] AluOp;
    wire [3:0] Alu_conrtol;
    


    pc p1(rst,clk,new_pc,now_pc);
    jump_concat jcon(instruction[25:0],next_pc[31:28],jump_pc);
    control c1(instruction[31:26],RegWrite,RegDst,AluSrc,Branch,MemWrite,MemRead,MemtoReg,AluOp,jump);
    instruction_mem ins_mem(now_pc,instruction);
    mux_5 regmux(instruction[20:16],instruction[15:11],RegDst,reg_wrtadr);
    register_mips r1(RegWrite,instruction[25:21],instruction[20:16],reg_wrtadr,reg_wrtdata,read_data1,read_data2);
    sign_extend se(instruction[15:0],sign_extended);
    mux_32 alscr(read_data2,sign_extended,AluSrc,alu_scr2);
    aludec alcon(instruction[5:0],AluOp,Alu_conrtol);
    alu_mips ALU(read_data1,alu_scr2,instruction[10:6],Alu_conrtol,alu_result,alu_zero);
    data_mem dm(MemRead,MemWrite,alu_result,read_data2,mem_readdata);
    mux_32 memmux(alu_result,mem_readdata,MemtoReg,reg_wrtdata);
    mux_32 bmux(next_pc,branced_pc,is_branced,branch_selected);
    mux_32 jmux(branch_selected,jump_pc,jump,new_pc);

    assign next_pc=now_pc+4;
    assign is_branced=alu_zero&Branch;
    assign branced_pc=(sign_extended<<2)+next_pc;
    


    assign out_pc=new_pc;
    assign out_result=reg_wrtdata[15:0];

endmodule