`timescale 1ns / 1ps
module T_flipflop_tb;
	reg T;
	reg clk;
	reg rst;
	wire q;
	wire qn;
	T_flipflop uut(.T(T),.clk(clk),.rst(rst),.q(q),.qn(qn));
initial begin
		clk = 0;
	forever #10 clk=(~clk);
	end
task T_ff(input a);
	begin
	 @(negedge clk);
	 T=a;
  	end
endtask
task rst_in(input b);
	begin
	 @(negedge clk);
	 rst=b;
	end
endtask
initial begin
  rst_in(1);
  #20;
  rst_in(0);
  T_ff(0);
  #40;
  T_ff(1);
  #200;
  T_ff(0);
  #40;
 $finish;
  end
endmodule

