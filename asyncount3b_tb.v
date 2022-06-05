`timescale 1ns / 1ps
module asyncount3b_tb;
reg clk,reset;
wire [2:0]Qb,Q;
asyncount3b counter(clk,reset,Q,Qb);
initial 
begin
  clk=0;
  forever #10 clk=(~clk);
end
task rst_in(input a);
  begin 
    @(negedge clk); 
    reset=a;
  end
  endtask
initial 
  begin
         rst_in(1);
	 rst_in(0);
	 #300;
	 rst_in(1);
	 #40;
	 $finish;
  end
endmodule
