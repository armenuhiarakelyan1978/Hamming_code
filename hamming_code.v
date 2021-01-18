module hamming_code(
	clk,rst,data_in,data_out
);

input clk,rst;
input [7:0] data_in;
output [11:0] data_out;
 
reg [11:0] data_gen;
reg [4:0] i,k;
reg [2:0] m;

always @(rst or data_in) begin
	if (rst) begin 
		data_gen = 12'b0;
	end 
	else begin
		i = 5'b0;
		m = 3'b0;	
		k = 5'b0;
		while (i < 5'd11 && k < 5'd8) begin 
			if(i == (2**m)-1) begin
				data_gen[i] = 1'b0;
				m = m + 3'b1;
			end
			else begin
				data_gen[i] = data_in[k];
				k = k + 5'b1;
			end	
			i = i + 5'b1;
		end

		if(^(data_gen & 12'b101010101010))  
			data_gen[0] = ~data_gen[0];
		if(^(data_gen & 12'b001100110011))  
			data_gen[1] = ~data_gen[1];
		if(^(data_gen & 12'b000111100001)) 
			data_gen[3] = ~data_gen[3];
		if(^(data_gen & 12'b000000001111)) 
			data_gen[7] = ~data_gen[7];
	end 
end

endmodule
