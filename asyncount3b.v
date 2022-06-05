module asyncount3b(
    input clk,
    input reset,
    output [2:0]Q,
    output [2:0]Qb
    );
tff T_ff0(1,clk,reset,Q[0],Qb[0]);
tff T_ff1(1,Qb[0],reset,Q[1],Qb[1]);
tff T_ff2(1,Qb[1],reset,Q[2],Qb[2]);
endmodule
module tff(
    input T,
    input clk,
    input rst,
    output  q,
    output  qn
    );
always@(posedge clk,posedge rst)
begin 
     if(rst==1) begin
	    q<=1'b0;
	        end
     else begin
	    case(T)
		  1'b0:begin q<=q;end
		  1'b1:begin q<=~(q); end
            endcase
		end
end
assign qn=~q;
endmodule
