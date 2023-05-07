module seven_segment_cntrl (

	input 				[2:0]			inp	  ,
	output reg							seg_a	,
	output reg							seg_b	,
	output reg							seg_c	,
	output reg							seg_d	,
	output reg							seg_e	,
	output reg							seg_f	,
	output reg							seg_g


);

	always @(*) //begin
		case (inp)
			3'b000 : {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g }= 7'b1111110   ;
			3'b001 : {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g }= 7'b0110000   ;
			3'b010 : {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g }= 7'b1101101   ;
			3'b011 : {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g }= 7'b1111001   ;
			default : {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g }= 7'b1001111  ;
		
		endcase

	//end


endmodule
