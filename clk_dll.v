module clk_dll(rst, clk, out_clk);
  input clk, rst;

  output out_clk;

  reg out_clk;
  reg [24:0]cnt_clk;

  always@(posedge clk or negedge rst) begin
    if(!rst) begin
      out_clk = 0;
      cnt_clk = 0;
    end
    
    else begin  
      cnt_clk <= cnt_clk+1;
            
     // if(cnt_clk == 24999999)
      if(cnt_clk == 24)
        cnt_clk <=0;
      else if(cnt_clk==0)
        out_clk = !out_clk;     

    end
    
  end    
endmodule
