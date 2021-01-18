module hamming_code(
	clk,rst,data_in,data_out
);
input clk,rst;
input [7:0] data_in;
output [11:0] data_out;
 
reg [11:0] data_gen;
reg [4:0] i,k;
reg [2:0] m;

always @(posedge clk or posedge rst) begin
	if (rst) begin 
		i <= 5'b0;
		m <= 3'b0;	
		k <= 5'b0;
		data_gen <= 12'b0;
	end 
	else begin
		if(i < 11 && m < 3 && i >=0) begin 
			if(i == (2**m)-1) begin
				data_gen[i] <= 1'b1;
				m <= m +1;
				k <= k +1;
			end
			else begin
				data_gen[i] <= data_in[k];
				k <= k+1;
			end	
		end
		else 
			i <= i + 1;
	end 
end
endmodule
