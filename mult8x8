/****************************************
* IDEC Intel FPGA Verilog desigin training
* Mudule : top design of the mult8x8
* author : kim seon deok
*****************************************/



module mult8x8(

	input			[7:0]			dataa					,
	input			[7:0]			datab					,
	input							  start					,
	input							  reset_a				,
	input							  clk					  ,
	
	output 							done_flag			      ,
	output 			[15:0]		product8x8_out		,
	output 							seg_a					      ,
	output 							seg_b					      ,
	output 							seg_c					      ,
	output 							seg_d					      ,
	output 							seg_e					      ,
	output 							seg_f					      ,
	output 							seg_g					
);	


	wire		[1:0]			sel					  ;
	wire		[3:0]			aout					;
	wire		[3:0]			bout					;
	wire		[7:0]			product				;
	wire		[1:0]			shift					;
	wire		[15:0]		shift_out			;

	wire		[15:0]		sum					  ;
	wire		[1:0]			count					;


	reg 		[2:0] 		current_state ;
  reg 		[2:0] 		next_state    ;
	reg		  [1:0]			input_sel     ;
	reg		  [1:0]			shift_sel     ;
	reg						    done		      ;
  
	wire						  clk_ena	      ;
	wire						  sclr_n	      ;
	wire		[2:0]			state_out     ;
			

	

mux4 u6_mux4 (                   // 1
	.mux_in_a		  (dataa[3:0])    ,
	.mux_in_b		  (dataa[7:4])    ,
	.mux_out			(aout[3:0])     ,
	.mux_sel			(sel[1])
);
	
	
	
mux4_t u6_mux4_t (               // 2
	.mux_in_a		  (datab[3:0])    ,
	.mux_in_b		  (datab[7:4])    ,
	.mux_out			(bout[3:0])     ,
	.mux_sel			(sel[0])
);

 
mult4x4 u6_mult4x4 (               // 3
	.dataa			  (aout[3:0])     ,
	.datab			  (bout[3:0])     ,
	.product			(product[7:0])
);



adder u6_adder(                     // 4
	.dataa			  (shift_out[15:0])         ,
 	.datab			  (product8x8_out[15:0])    ,
	.sum				  (sum[15:0])

);


shifter u6_shifter(                 //5
	.inp				    (product[7:0])      ,
	.shift_cntrl	  (shift[1:0])        ,
	.shift_out		  (shift_out[15:0])

);


reg16 u6_reg16(                    //6
	.clk				    (clk)                   ,
	.sclr_n			    (sclr_n)                ,
	.clk_ena			  (clk_ena)               ,
	.datain			    (sum[15:0])             ,
	.reg_out			  (product8x8_out[15:0])
);


counter u6_counter (                            // 7
	.aclr_n			    (~start)            ,                   //not
	.clk				    (clk)               ,
	.count_out		  (count[1:0])
);
	
seven_segment_cntrl u6_seven_segment_cntrl (         // 9
	.inp				  (state_out)       ,
	.seg_a			  (seg_a)           ,
	.seg_b			  (seg_b)           ,
	.seg_c			  (seg_c)           ,
	.seg_d			  (seg_d)           ,
	.seg_e			  (seg_e)           ,
	.seg_f			  (seg_f)           ,
	.seg_g			  (seg_g)	
);


mult_control u6_mult_control (                  // 8
	.clk				    (clk)               ,
	.reset_a			  (reset_a)           ,
	.start			    (start)             ,
	.count			    (count[1:0])        ,
	.done				    (done_flag)         ,
	.input_sel		  (sel[1:0])          ,
	.shift_sel		  (shift[1:0])        ,
	.state_out		  (state_out[2:0])    ,
	.clk_ena			  (clk_ena)           ,
	.sclr_n			    (sclr_n)
	
);


endmodule
