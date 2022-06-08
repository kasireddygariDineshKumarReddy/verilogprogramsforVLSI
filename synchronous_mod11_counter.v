module synchronous_mod11_counter(
    input clk,
    input rst,
    input [3:0]ld,
    input ld_enb,
    output reg [3:0]count
    );
always@(posedge clk,posedge rst)
begin  
	if(rst==1)
	  count<=0;
	else if(ld_enb==1)
	  count<=ld;
   else if(count==4'b1010)
     count<=0;
	else
	  count<=count+1;
end  
endmodule
