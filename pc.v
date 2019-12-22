module pc(rst, clk, newpc, pc);
input rst, clk;
input [31:0] newpc;
output reg [31:0] pc;

always@(negedge rst or posedge clk)
begin
if (!rst)
	pc <= 0 ;
else
	pc <= newpc ;
end

endmodule
