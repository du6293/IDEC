module reg16 (
  
	input								    clk		    ,
	input								    sclr_n	  ,
	input								    clk_ena	  ,
	input				  [15:0]	  datain	  ,
	output reg		[15:0]	  reg_out	 

);

	always @(posedge clk) begin
		if (clk_ena == 1 & sclr_n == 1)
			reg_out <= datain     ;
		else if (clk_ena == 1 & sclr_n == 0)
			reg_out <= 0          ;
		else
			reg_out <= reg_out    ;
			
	end


endmodule
