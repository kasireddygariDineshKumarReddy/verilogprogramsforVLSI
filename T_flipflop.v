module T_flipflop(
    input T,
    input clk,
    input rst,
    output reg q,
    output qn
    );
always@(posedge clk,posedge rst)
begin 
     if(rst==1) begin
	    q<=1'b0; end
     else begin
	    case(T)
		  1'b0:begin q<=q;end
		  1'b1:begin q<=~(q); end
            endcase
	end
end
assign qn=~q;
endmodule
