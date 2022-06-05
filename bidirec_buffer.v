module bidirec_buffer(
    inout A,
    inout B,
    input cntrl
    );
assign B=(cntrl==1)?A:1'bz;
assign A=(cntrl==0)?B:1'bz;

endmodule
