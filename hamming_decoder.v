module hamming_decoder(output reg [0:20]data_out,
output reg [4:0]pout,
input [0:20]data_in);
reg [4:0]S=1;
reg [4:0]k;
always@(*)
begin
	data_out = data_in;
        pout[0]= data_in[2]^data_in[4]^data_in[6]^data_in[8]^data_in[10]
	           ^data_in[12]^data_in[14]^data_in[16]^data_in[18]
		   ^data_in[20];
        pout[1]= data_in[2]^data_in[5]^data_in[6]^data_in[9]^data_in[10]^
		   data_in[13]^data_in[14]^data_in[17]^data_in[18];
        pout[2]= data_in[4]^data_in[5]^data_in[6]^data_in[11]^data_in[12]
	           ^data_in[13]^data_in[14]^data_in[19]^data_in[20];
	pout[3]= data_in[8]^data_in[9]^data_in[10]^data_in[11]^data_in[12]
	           ^data_in[13]^data_in[14];
	pout[4] = data_in[15]^data_in[16]^data_in[17]^data_in[18]^
		    data_in[19]^data_in[20];
	
	for(k = 0; k<5; k=k+1)
	begin
	if(pout[k]!==data_in[2**k-1])begin
		S =S+ (2**k);
	end
       data_out={pout[0],pout[1],data_in[2],pout[2],data_in[4:6],pout[3],
	       data_in[8:14],pout[4],data_in[16:20]};
       data_out[S-1]=~data_in[S-1];
end


end
endmodule
