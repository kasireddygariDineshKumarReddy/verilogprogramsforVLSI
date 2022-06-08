`timescale 1ns / 1ps
module synchronous_mod11_counter_tb;
	reg clk;
	reg rst;
	reg [3:0] ld;
	reg ld_enb;
	wire [3:0] count;
	synchronous_counter4 uut (.clk(clk),.rst(rst),.ld(ld),.ld_enb(ld_enb),.count(count));
	initial 
	 begin
	   clk=0;
	   forever #5 clk=~clk;
	 end
	task initialize();
	  begin
	     ld=0;
		  ld_enb=0;
		  rst=0;
	  end
	endtask
	task load_enb(input [3:0]a);
	  begin
	     @(negedge clk)
		    begin
			   ld_enb<=1;
				ld<=a;
			 end
		  @(negedge clk)
		    begin
			   ld_enb<=0;
	       end
		end
	endtask 
	task reset();
	   begin
	    @(negedge clk)
		   rst<=1;
		 @(negedge clk)
		   rst<=0;
		end
	endtask
   initial
    begin
	    initialize();
		 #10;
	    reset();
       load_enb(4'b0011);
       #200;
		 load_enb(4'b0111);
       #100;
		 reset();
		 $finish;
    end   		 
endmodule

