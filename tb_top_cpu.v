`timescale 1ns/1ns

module tb_top_cpu();

reg rst,clk;
wire [6:0] seg1,seg2,seg3,seg4,seg5,seg6;

top_cpu tcpu0(rst,clk,seg1,seg2,seg3,seg4,seg5,seg6);

initial begin
   rst=0;
   #33; rst=1; 
end

initial begin
    clk=0;
    forever #5 clk=~clk;
    
end

endmodule