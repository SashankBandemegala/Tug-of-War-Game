`timescale 1ns / 1ps

module tow_tb;

	// Inputs
	reg pbr;
	reg pbl;
	reg CLK_I;
	reg rst;

	// Outputs
	wire [6:0] leds_out;
	wire [1:0] leds_ctrl;

	// Instantiate the Unit Under Test (UUT)
	tow uut (
		.pbr(pbr), 
		.pbl(pbl), 
		.CLK_I(CLK_I), 
		.rst(rst), 
		.leds_out(leds_out),
		.push(push),
		.tie(tie),
		.right(right),
		.clear(clear),
		.clk(clk),
		.sypush(sypush),
		.winrnd(winrnd),
		.leds_on(leds_on),
		.score(score),
		.leds_ctrl(leds_ctrl),
		.slowen(slowen),
		.random(random)
	);

	always #976562.5 CLK_I <= ~CLK_I;

	initial begin
		// Initialize Inputs
		pbr = 0;
		pbl = 0;
		CLK_I = 0;
		rst = 0;

		// Wait 10 us for global reset to finish
		#10000000;
      
		// Reset the system
		@(posedge CLK_I) #10000
		rst = 1;
		
		//Remove system from RESET
		@(posedge CLK_I); #10000;
		rst = 0;
		#10000;
		
		
		
		////////////////////////////////////////////////// Testing the right player winning all the way with no jumping of any lights \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		wait(leds_out == 7'b0001000);
		$display($time, "We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbr = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbr = 0;
		wait(clear == 1); #10000;
		$display($time, " We are at state gloat_a now \n<< Leds_out = %d   >>",leds_out);
		wait(clear == 0 & leds_on == 1); #10000 
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		// player right won the round!
		
	
		wait(leds_out == 7'b0000100);
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbr = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbr = 0;
		wait(clear == 1); #10000;
		$display($time, " We are at state gloat_a now \n<< Leds_out = %d   >>",leds_out);
		wait(clear == 0 & leds_on == 1); #10000 
		$display($time, "We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		// player right won the round!
		
		wait(leds_out == 7'b0000010);
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbr = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbr = 0;
		wait(clear == 1); #10000;
		$display($time, " We are at state gloat_a now \n<< Leds_out = %d   >>",leds_out);
		wait(clear == 0 & leds_on == 1); #10000
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		// player right won the round!
		
		wait(leds_out == 7'b0000001);
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbr = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbr = 0;
		// player right won the GAME!
		wait(leds_out == 7'b0000111);
		$display($time, " The RIGHT PLAYER WON THE GAME!! ",leds_out);
		
		#1000000000;
		
		//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ End of right player wins all the way //////////////////////////////////////////////////////////////
		
		// Reset the system
		@(posedge CLK_I) #10000
		rst = 1;
		
		//Remove system from RESET
		@(posedge CLK_I); #10000;
		rst = 0;
		#10000;
		
		
		////////////////////////////////////////////////// Testing the left player winning all the way with no jumping of any lights \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		wait(leds_out == 7'b0001000);
		$display($time, "We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbl = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbl = 0;
		wait(clear == 1); #10000;
		$display($time, " We are at state gloat_a now \n<< Leds_out = %d   >>",leds_out);
		wait(clear == 0 & leds_on == 1); #10000
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		// player left won the round!
		
	
		wait(leds_out == 7'b0010000);
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbl = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbl = 0;
		wait(clear == 1); #10000;
		$display($time, " We are at state gloat_a now \n<< Leds_out = %d   >>",leds_out);
		wait(clear == 0 & leds_on == 1); #10000
		$display($time, "We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		// player left won the round!
		
		wait(leds_out == 7'b0100000);
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbl = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbl = 0;
		wait(clear == 1); #10000;
		$display($time, " We are at state gloat_a now \n<< Leds_out = %d   >>",leds_out);
		wait(clear == 0 & leds_on == 1); #10000
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		// player left won the round!
		
		wait(leds_out == 7'b1000000);
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbl = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbl = 0;
		// player right won the GAME!
		wait(leds_out == 7'b1110000);
		$display($time, " The LEFT WON THE GAME!! ",leds_out);
		
		#1000000000;
		
		//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ End of LEFT player wins all the way //////////////////////////////////////////////////////////////
		
		
		
		
		// Reset the system
		@(posedge CLK_I) #10000
		rst = 1;
		
		//Remove system from RESET
		@(posedge CLK_I); #10000;
		rst = 0;
		#10000;
		
		
		////////////////////////////////////////////////// Testing Favour The Loser when right player is loosing with no jumping of any lights \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		wait(leds_out == 7'b0001000);
		$display($time, "We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbl = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbl = 0;
		wait(clear == 1); #10000;
		$display($time, " We are at state gloat_a now \n<< Leds_out = %d   >>",leds_out);
		wait(clear == 0 & leds_on == 1); #10000
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		// player left won the round!
		
	
		wait(leds_out == 7'b0010000);
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbl = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbl = 0;
		wait(clear == 1); #10000;
		$display($time, " We are at state gloat_a now \n<< Leds_out = %d   >>",leds_out);
		wait(clear == 0 & leds_on == 1); #10000
		$display($time, "We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		// player left won the round!
		
		wait(leds_out == 7'b0100000);
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbl = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbl = 0;
		wait(clear == 1); #10000;
		$display($time, " We are at state gloat_a now \n<< Leds_out = %d   >>",leds_out);
		wait(clear == 0 & leds_on == 1); #10000
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		// player left won the round!
		
		wait(leds_out == 7'b1000000);
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbr = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbr = 0;
		// player right managed to save the game and was favoured
		wait(leds_out == 7'b0010000);
		$display($time, " The right managed to save the game and was favoured!! ",leds_out);
		
		#1000000000;
		
		//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ End of Testing Favour The Loser when right player is loosing with no jumping of any lights //////////////////////////////////////////////////////////////
		
		
		
		// Reset the system
		@(posedge CLK_I) #10000
		rst = 1;
		
		//Remove system from RESET
		@(posedge CLK_I); #10000;
		rst = 0;
		#10000;
		
		
		
		
		////////////////////////////////////////////////// Testing Favour The Loser when left player is loosing with no jumping of any lights \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		wait(leds_out == 7'b0001000);
		$display($time, "We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbr = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbr = 0;
		wait(clear == 1); #10000;
		$display($time, " We are at state gloat_a now \n<< Leds_out = %d   >>",leds_out);
		wait(clear == 0 & leds_on == 1); #10000
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		// player right won the round!
		
	
		wait(leds_out == 7'b0000100);
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbr = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbr = 0;
		wait(clear == 1); #10000;
		$display($time, " We are at state gloat_a now \n<< Leds_out = %d   >>",leds_out);
		wait(clear == 0 & leds_on == 1); #10000
		$display($time, "We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		// player right won the round!
		
		wait(leds_out == 7'b0000010);
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbr = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbr = 0;
		wait(clear == 1); #10000;
		$display($time, " We are at state gloat_a now \n<< Leds_out = %d   >>",leds_out);
		wait(clear == 0 & leds_on == 1); #10000
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		// player right won the round!
		
		wait(leds_out == 7'b0000001);
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbl = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbl = 0;
		// player left managed to save the game and was favoured		wait(leds_out == 7'b0000111);
		wait(leds_out == 7'b0000100);
		$display($time, " The player left managed to save the game and was favoured!! ",leds_out);
		
		#1000000000;
		
		//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ End of Testing Favour The Loser when left player is loosing with no jumping of any lights //////////////////////////////////////////////////////////////
		
		
		
		// Reset the system
		@(posedge CLK_I) #10000
		rst = 1;
		
		//Remove system from RESET
		@(posedge CLK_I); #10000;
		rst = 0;
		#10000;
		
		
		
		////////////////////////////////////////////////// Testing the right player jumping the light on a non winning round \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		wait(leds_out == 7'b0000000);
		$display($time, "We are at state Dark now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbr = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbr = 0;
		wait(clear == 1); #10000;
		$display($time, " We are at state gloat_a now \n<< Leds_out = %d   >>",leds_out);
		wait(clear == 0 & leds_on == 1); #10000
		wait(leds_out == 7'b0010000);
		$display($time, " << Right lost round because he/she jumped light   >>",leds_out);
		// player right LOST the round!
		
		#1000000000;
		
		//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ End of Testing the right player jumping the light on a non winning round //////////////////////////////////////////////////////////////
		
		
		
		// Reset the system
		@(posedge CLK_I) #10000
		rst = 1;
		
		//Remove system from RESET
		@(posedge CLK_I); #10000;
		rst = 0;
		#10000;
		
		
		
		////////////////////////////////////////////////// Testing the left player jumping the light on a non winning round \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		wait(leds_out == 7'b0000000);
		$display($time, "We are at state Dark now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbl = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbl = 0;
		wait(clear == 1); #10000;
		$display($time, " We are at state gloat_a now \n<< Leds_out = %d   >>",leds_out);
		wait(clear == 0 & leds_on == 1); #10000
		wait(leds_out == 7'b0000100);
		$display($time, " << Right lost round because he/she jumped light   >>",leds_out);
		// player right LOST the round!
		
		#1000000000;
		
		//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ End of Testing the left player jumping the light on a non winning round //////////////////////////////////////////////////////////////
		
		
		
		
		
		
		// Reset the system
		@(posedge CLK_I) #10000
		rst = 1;
		
		//Remove system from RESET
		@(posedge CLK_I); #10000;
		rst = 0;
		#10000;
		
		
		////////////////////////////////////////////////// Testing that Favour The Loser DOESN't happen when left winner jumps the light \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		wait(leds_out == 7'b0001000);
		$display($time, "We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbl = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbl = 0;
		wait(clear == 1); #10000;
		$display($time, " We are at state gloat_a now \n<< Leds_out = %d   >>",leds_out);
		wait(clear == 0 & leds_on == 1); #10000
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		// player left won the round!
		
	
		wait(leds_out == 7'b0010000);
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbl = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbl = 0;
		wait(clear == 1); #10000;
		$display($time, " We are at state gloat_a now \n<< Leds_out = %d   >>",leds_out);
		wait(clear == 0 & leds_on == 1); #10000
		$display($time, "We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		// player left won the round!
		
		wait(leds_out == 7'b0100000);
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbl = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbl = 0;
		wait(clear == 1); #10000;
		$display($time, " We are at state gloat_a now \n<< Leds_out = %d   >>",leds_out);
		wait(leds_out == 7'b1000000);
		
		wait(leds_out == 7'b0000000);
		$display($time, " We are at state DARK now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbl = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbl = 0;
		// Winning left player jumped the light, the loser must not be favoured
		wait(leds_out == 7'b0100000);
		$display($time, " Winning left player jumped the light, the loser must not be favoured!! ",leds_out);
		
		#1000000000;
		
		//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ End of Testing that Favour The Loser DOESN't happen when left winner jumps the light //////////////////////////////////////////////////////////////
		
		
		
		// Reset the system
		@(posedge CLK_I) #10000
		rst = 1;
		
		//Remove system from RESET
		@(posedge CLK_I); #10000;
		rst = 0;
		#10000;
		
		
		
		
		////////////////////////////////////////////////// Testing that Favour The Loser DOESN't happen when right winner jumps the light \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		wait(leds_out == 7'b0001000);
		$display($time, "We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbr = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbr = 0;
		wait(clear == 1); #10000;
		$display($time, " We are at state gloat_a now \n<< Leds_out = %d   >>",leds_out);
		wait(clear == 0 & leds_on == 1); #10000
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		// player right won the round!
		
	
		wait(leds_out == 7'b0000100);
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbr = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbr = 0;
		wait(clear == 1); #10000;
		$display($time, " We are at state gloat_a now \n<< Leds_out = %d   >>",leds_out);
		wait(clear == 0 & leds_on == 1); #10000
		$display($time, "We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		// player right won the round!
		
		wait(leds_out == 7'b0000010);
		$display($time, " We are at state PLAY now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbr = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbr = 0;
		wait(clear == 1); #10000;
		$display($time, " We are at state gloat_a now \n<< Leds_out = %d   >>",leds_out);
		wait(leds_out == 7'b0000001);
		
		wait(leds_out == 7'b0000000);
		$display($time, " We are at state DARK now \n<< Leds_out = %d   >>",leds_out);
		@(posedge CLK_I); #10000;
		pbr = 1;
		repeat(100) @(posedge CLK_I); #10000;
		pbr = 0;
		// Winning right player jumped the light, the loser must not be favoured
		wait(leds_out == 7'b0000010);
		$display($time, " Winning right player jumped the light, the loser must not be favoured!! ",leds_out);
		
		#1000000000;
		
		//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ End of Testing that Favour The Loser DOESN't happen when right winner jumps the light ///////////////////////////////
		
		// Reset the system
		@(posedge CLK_I) 
		rst = 1;
		#1000000000;
		//Remove system from RESET
		@(posedge CLK_I); #10000;
		rst = 0;
		#10000;
		
	end
      
endmodule

