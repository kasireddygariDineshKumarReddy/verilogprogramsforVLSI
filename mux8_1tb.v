`timescale 1ns / 1ps
module mux8_1tb;
	reg [7:0] i;
	reg [2:0] sel;
	wire out;
        integer x;
	mux8_1 uut(.i(i),.sel(sel),.out(out));
	initial 
	 begin
		i = 8'd0;
		sel = 3'd0;
		#30;
		for(x=0;x<8;x=x+1)
		 begin 
		  sel=x;
		  #10;
		  i[x]=1;
		  #10;
		  i[x]=0;
		 end
	 $finish;
	end     
endmodule

