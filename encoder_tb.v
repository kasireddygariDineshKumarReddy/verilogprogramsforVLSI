`timescale 1ns / 1ps
module encoder_tb;
	reg [7:0] i;
	wire [2:0] out;
	integer x;
	encoder DUT(.i(i),.out(out));
	initial begin
		i=8'd0;
		#20;
		for(x=0;x<8;x=x+1) begin
		        i[x]=1;
			 #10;
			 i[x]=0;
			 #10;  
			 end
		$finish;
	end 
endmodule

