`timescale 1ns / 1ps

module tow(
    input pbr,
    input pbl,
	 input pbu,
	 input pbd,
    input CLK_I,
    input rst,
    output [6:0] leds_out,
	 output wire push,
		output wire tie,
		output wire right, 
		output wire clear,
		output wire clk,
		output wire sypush,
		output wire winrnd,
		output wire leds_on,
		output wire [6:0] score,
		output wire [1:0] leds_ctrl,
		output wire slowen,
		output wire random, 
		output wire speaker, 
		output wire gain, 
		output wire shutdown   
    ); 
	//Complete  wire signals needed below ?? 
	
	////////////
	//output wire push, tie, right, clear, clk, sypush, winrnd, leds_on, score, leds_ctrl, slowen, random;
	///////
	
	//Slower Clock from 100Mhz to 500Hz -Given DO NOT remove 
	clk_div createCLKdivide( .CLK_I(CLK_I),.rst(rst), .clk(clk));
	//assign clk = CLK_I;

	//---------------------------------------------------------------------
	//Instantiate PBL Sync OPP ??? 
	PBL PBL_1( .push(push), .tie(tie), .right(right), .pbr(pbr), .pbl(pbl), .pbu(pbu), .pbd(pbd), .clear(clear),.rst(rst) );
	synchronizer synchronizer_1( .push(push), .clk(clk), .rst(rst), .sypush(sypush) );
	OPP OPP_1( .sypush(sypush), .clk(clk), .rst(rst), .winrnd(winrnd) );

	//----------------------------------------------------------------------
	//Instantiate scorer Led_Mux    /// pushCounter \\\
	scorer scorer_1( .winrnd(winrnd), .right(right), .leds_on(leds_on), .clk(clk), .rst(rst), .score(score), .tie(tie) );
	led_mux led_mux_1( .leds_ctrl(leds_ctrl), .score(score), .rst(rst), .leds_out(leds_out) );
		 
	//----------------------------------------------------------------------
	//Div256 LFSR MC        ***********speed_controller
	div256 div256_1(clk,rst,slowen);
	LFSR LFSR_1(clk,rst,random);
	MC MC_1(clk,rst,winrnd,slowen,random,leds_on,clear,leds_ctrl);
	
endmodule 
