`timescale 1ns / 1ps
module bidirec_buffer_tb;
	reg cntrl;
	wire A;
	wire B;
	reg temp_A,temp_B;
	integer i;
	bidirec_buffer uut(.A(A),.B(B),.cntrl(cntrl));
	assign A=(cntrl==1)?temp_A:1'bz;
	assign B={cntrl==0}?temp_B:1'bz;
	initial begin
		for(i=0;i<8;i=i+1) begin
		  {cntrl,temp_A,temp_B}=i;
		    #15;
		 end
		$finish;
	end
      
endmodule

