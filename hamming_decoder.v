module hamming_decoder(output reg [15:0]data_out1,
output reg err,
input [20:0]data_in1);
reg [4:0]S;
reg [0:15] data_out;
reg [0:20] data_in;
reg [4:0]pout;
reg [4:0]k;
always@(*)
begin 
       data_in = data_in1;

        S=0;
	data_out =0 ;
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
       data_out={data_in[2],data_in[4:6],
	       data_in[8:14],data_in[16:20]};
       data_out[S-5]=~data_in[S-5];
       if(S!=0)begin
	       err = 1;
       end else begin
	       err = 0;
       end
       data_out1 = data_out;
end


end
endmodule
