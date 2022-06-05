`timescale 1ns / 1ps
module priority_encoder_tb;
	reg [7:0] in;
	wire [2:0] out;
	integer i;
	priority_encoder uut (.in(in),.out(out));

	initial begin
		in = 0;
		#10;
                for(i=1;i<256;i=i+1) 
                    begin
		    in=i;
		    #10;
		    end
		$finish;
	end     
endmodule

