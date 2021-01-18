module LFSR_for_hc(
clk,rst,data_out
);
input wire clk,rst;
output reg [15:0] data_out; 
wire polyn_data,polyn_data_for0;
reg [15:0] random;

assign polyn_data = (random[15]^random[14]^random[12]^random[3]);
assign polyn_data_for0 = ~random[15]||~random[14]||~random[12]||~random[3];

always @(posedge clk or posedge rst)
	if(rst) 
		random <= 16'b0;
	else begin 
		random <= data_out;
	end

always @(*) begin 
	data_out = {random[15:0],polyn_data||polyn_data_for0};
end
  
endmodule
