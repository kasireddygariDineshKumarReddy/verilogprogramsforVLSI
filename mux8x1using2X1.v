module mux2x1(i,sel,y);
input[1:0] i;
input sel;
output y;
always@(*)
begin 
     case(sel)
     1'b0:y=i[0];
     1'b1:y=i[1];
     default:y=1'bz;
     endcase
end
endmodule
module mux8X1using2X1(i,sel,y);
input [7:0]i;
input [2:0]sel;
output y;
wire y0,y1,y2,y3,y4,y5;
mux2x1 a(i[1:0],sel[0],y0);
mux2x1 b(i[3:2],sel[0],y1); 
mux2x1 c(i[5:4],sel[0],y2);
mux2x1 d(i[7:6],sel[0],y3);  
mux2x1 e({y1,y0},sel[1],y4);
mux2x1 f({y3,y2},sel[1],y5);
mux2x1 g({y5,y4},sel[2],y);
endmodule
