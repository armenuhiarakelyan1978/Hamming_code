module LFSR_tb;
	reg clk,rst;
	wire [15:0] out;

	LFSR_for_hc lfsr(clk,rst,out);
	initial begin 
		$dumpfile("v.vcd");
		$dumpvars();
	end
	initial begin 
		clk = 0;
		rst = 1;
		#25;
		rst = 0;
		#10000;
		$finish;
	end
	always 
		#10 clk = ~clk;

endmodule
