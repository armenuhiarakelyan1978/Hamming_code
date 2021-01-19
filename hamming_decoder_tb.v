module hamming_decoder_tb;
reg [20:0] data_in;
wire [4:0]pout;
wire [20:0] data_out;

hamming_decoder hamm_dec(
.data_in(data_in),
.pout(pout),
.data_out(data_out)
);
initial
begin
//#10	data_in = 21'b000010001100001011101;
#15 data_in = 21'b100110000100001011101; 
#1000 $finish;
end
initial
begin
	$dumpfile("hamming_decoder_tb.vcd");
	$dumpvars();
	
end

endmodule
