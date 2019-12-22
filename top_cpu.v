module top_cpu(rst,clk,seg1,seg2,seg3,seg4,seg5,seg6);

    input rst,clk;
    output[6:0] seg1,seg2,seg3,seg4,seg5,seg6;
    wire out_clk;
    wire [3:0] digit1,digit2,digit3,digit4,digit5,digit6;
    wire [31:0] out_pc;
    wire [15:0] out_result;
   
    clk_dll u0(rst, clk, out_clk);  // 50MHz -> 1Hz  divide
    mips_cpu cpu(rst,outclk,out_pc,out_result);

    assign  digit5=out_pc%10;
    assign  digit6=(out_pc-digit5)/10;
    assign  digit1=out_result%10;
    assign  digit2=(out_result%100)/10;
    assign  digit3=(out_result%1000)/100;
    assign  digit4=(out_result%10000)/1000;

    seg7 s1(digit1,seg1);
    seg7 s2(digit2,seg2);
    seg7 s3(digit3,seg3);
    seg7 s4(digit4,seg4);
    seg7 s5(digit5,seg5);
    seg7 s6(digit6,seg6);
    

endmodule