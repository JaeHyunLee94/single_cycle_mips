module mips_cpu(rst,clk,out_pc,out_result);

    input rst,clk;
    output [31:0] out_pc;
    output [15:0] out_result;

    reg [31:0] original_pc=32'b00000000000000000000000000000100;
    wire [31:0] new_pc,jump_pc,next_pc,branch_pc,tmp1;
    
    wire [31:0] instruction,sign_extended;
    wire is_branched;

    wire [9:0] control_signal;

    wire [4:0] reg_write_adr;
    wire [31:0] reg_write_data,reg_out1,reg_out2;

    wire alu_zero;
    wire [3:0] alu_control;
    wire [31:0] alu_result,alu_in2;
    

    wire [31:0] mem_read_data;

    

    jump_concat j1(instruction[25:0],next_pc[31:28],jump_pc);
    sign_extend se(instruction[15:0],sign_extended);

   
    
    assign reg_write_adr=(control_signal[8]==1'b1)?instruction[15:11]:instruction[20:16]; 
    assign alu_in2=(control_signal[7]==1'b1)?sign_extended:reg_out2;
    assign reg_write_data=(control_signal[3]==1'b1)?mem_read_data:alu_result;
    assign is_branched=control_signal[6]&alu_zero;
    assign tmp1=(is_branched==1'b1)? branch_pc:next_pc;

    always@(control_signal[0],jump_pc,tmp1)begin
       original_pc<=(control_signal[0]==1'b1)?jump_pc:tmp1;
    end


    pc p1(rst,clk,original_pc,new_pc);
    instruction_mem ins_mem(new_pc,instruction);
    control c1(instruction[31:26],control_signal);
    register_mips r1(control_signal[9],instruction[25:21],instruction[20:16],reg_write_adr,reg_write_data,reg_out1,reg_out2);
    aludec alucon(instruction[5:0],control_signal[2:1],alu_control);
    alu_mips alu(reg_out1,alu_in2,instruction[10:6],alu_control,alu_result,alu_zero);
    data_mem dm(control_signal[4],control_signal[5],alu_result,reg_out2,mem_read_data);

    assign next_pc=new_pc+4;
    assign branch_pc=(sign_extended<<2)+next_pc;

    assign out_pc=original_pc;
    assign out_result=reg_write_data[15:0];

endmodule
