`timescale 1ns/1ns

module tb_mips_cpu();

reg rst,clk;
wire [31:0] out_pc;
wire [15:0] out_result;
mips_cpu m_cpu(rst,clk,out_pc,out_result);

initial begin
   rst=0;
   #33; rst=1; 
end

initial begin
    clk=0;
    forever #5 clk=~clk;
    
end

endmodule