module top;
	reg clk,rst;
	wire [15:0] data_gen;
	wire [20:0] data_out;

	LFSR_for_hc lf1(clk,rst,data_gen);
	hamming_code hc(clk,rst,data_gen,data_out);

endmodule 
