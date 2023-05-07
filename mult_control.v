module mult_control (
	input                 clk, reset_a, start     ,				
	input       [1:0]     count                   ,
	output reg  [1:0]     input_sel, shift_sel    ,	
	output reg  [2:0]     state_out               ,				
	output reg            done, clk_ena, sclr_n
);



	
	reg [2:0] current_state, next_state       ;
	
  
  
	
	parameter idle=0, lsb=1, mid=2, msb=3, calc_done=4, err=5;

	
	always @(posedge clk, posedge reset_a) // begin
		if (reset_a)
			current_state <= idle;
		else
			current_state <= next_state;
	// end
  
  
	
	always @ *
		case (current_state)
			idle : 
				if (start)
					next_state = lsb;
				else
					next_state = idle;
			lsb : 
				if (count == 0 && start == 0)
					next_state = mid;
				else
					next_state = err;
			mid : 
				if (start == 0 && count == 2)
					next_state = msb;
				else if (start == 0 && count == 1)
					next_state = mid;
				else
					next_state = err;
			msb : 
				if (count == 3 && start == 0)
					next_state = calc_done;
				else
					next_state = err;
			calc_done :
				if (!start)
					next_state = idle;
				else
					next_state = err;
			err : 
				if (start)
					next_state = lsb;
				else
					next_state = err;
		endcase
	//end




	
	always @* begin
		input_sel = 2'bxx;
		shift_sel = 2'bxx;
		done = 1'b0;
		clk_ena = 1'b0;
		sclr_n = 1'b1;		
		case (current_state)
			idle : 
				if (start) begin
					clk_ena = 1'b1;
					sclr_n = 1'b0;
				end
			lsb : 
				if (count == 0 && start == 0) begin
					input_sel = 2'd0;
					shift_sel = 2'd0;
					clk_ena = 1'b1;
				end
			mid : 
				if (count == 2 && start == 0) begin
					input_sel = 2'd2;
					shift_sel = 2'd1;
					clk_ena = 1'b1;
				end
				else if (count == 1 && start == 0) begin
					input_sel = 1'd1;
					shift_sel = 1'd1;
					clk_ena = 1'b1;
				end
			msb : 
				if (count == 3 && start == 0) begin
					input_sel = 2'd3;
					shift_sel = 2'd2;
					clk_ena = 1'b1;
				end
			calc_done :
				if (!start)
					done = 1'b1;
			err : 
				if (start) begin
					clk_ena = 1'b1;
					sclr_n = 1'b0;
				end
		endcase
	end
	
  
  
  
  
  
	always @(current_state) begin
		state_out = 3'd0;
		case (current_state)
			idle : ;
			lsb : state_out = 3'd1;
			mid : state_out = 3'd2;
			msb : state_out = 3'd3;
			calc_done : state_out = 3'd4;
			err : state_out = 3'd5;
		endcase
	end
  
  
  
  
  
endmodule 
