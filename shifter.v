module shifter (

	input				  [7:0]				inp 			  ,
	input 			  [1:0]				shift_cntrl ,
	output reg  	[15:0]			shift_out 


);
	
	always @(*) begin
			
		if	(shift_cntrl == 2'b01)
			shift_out = {4'b0000, inp, 4'b0000};
		else if	(shift_cntrl == 2'b10)
			shift_out = {inp, 8'b0000_0000};
		else
			shift_out = {8'b0000_0000, inp};
			
	end
			
endmodule
