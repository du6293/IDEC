module led(
	input				clk	, // CLOCK_50 	: AF14
	input				nRst	, // KEY_0 	: AA14
	output				led	  //LED9 	: Y21
);

	reg			[25:0]			cnt;
	wire			cnt_clear = (cnt == 50000000 - 1);
	
	always @(posedge clk, negedge nRst) begin
		if (!nRst)
			cnt <= 0;
		else if (cnt_clear)
			cnt <= 0;
		else
			cnt <= cnt + 1;
	end
	
	//assign led = cnt[25];
	assign led = cnt >= 25000000;
	
endmodule
