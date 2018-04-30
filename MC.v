`timescale 1ns / 1ps

module MC(
    input clk,
    input rst,
    input winrnd,
    input slowen,
	 input random,
    output reg leds_on,
    output reg clear,
    output reg [1:0] leds_ctrl
    );
	
	reg [7:0] state;

	`define RESET 				0
	`define wait_a 			    1
	`define wait_b 			    2
	`define dark_random 		3
	`define play			 	4
	`define gloat_a		 	    5
	`define gloat_b 			6
	
	`define off 				0
	`define on 					3
	`define score				2
	`define sn                  1
	
	reg [7:0] next_state;	
	
	always @(posedge clk or posedge rst)
		begin 
		if(rst) state <= `RESET;
		else state <= next_state;
		end
		
	always @(state or rst or slowen or winrnd)
		begin
		
		case(state)
		`RESET: 			if(!rst)	next_state = `wait_a;
							else		next_state = `RESET;
		`wait_a: 		if(slowen)	next_state = `wait_b;
							else 			next_state = `wait_a;
		`wait_b: 		if(slowen)	next_state = `dark_random;
							else			next_state = `wait_b;
		`dark_random:	if(winrnd)	next_state = `gloat_a;
							else if(slowen&random)	next_state = `play;
							else	next_state = `dark_random;
		`play:			if(winrnd)	next_state = `gloat_a;
							else 			next_state = `play;
		`gloat_a:		if(slowen)	next_state = `gloat_b;
							else			next_state = `gloat_a;
		`gloat_b:		if(slowen)	next_state = `dark_random;
							else			next_state = `gloat_b;
		default:			next_state = `RESET;
		
		endcase
		
		end
		
	always @(state)
		begin
		
		case(state)
		`RESET:			begin  	leds_on = 1;  
										clear = 1;  
										leds_ctrl = `sn; 			
							end
		`wait_a: 		begin   	 leds_on = 1;  
										 clear = 1;  
										 leds_ctrl = `on; 			
							end
		`wait_b: 		begin  	 leds_on = 1;  
										 clear = 1;  
										 leds_ctrl = `on; 			
							end
		`dark_random:	begin  	 leds_on = 0;  
										 clear = 0;  
										 leds_ctrl = `off; 			
							end
		`play:			begin  	 leds_on = 1; 
										 clear = 0;  
										 leds_ctrl = `score; 	
							end
		`gloat_a:		begin  	 leds_on = 1;  
										 clear = 1;  
										 leds_ctrl = `score; 		
							end
		`gloat_b:		begin 	 leds_on = 1;  
										 clear = 1;  
										 leds_ctrl = `score; 		
							end
		default:			begin  	 leds_on = 0;  
										 clear = 0;  
										 leds_ctrl = `off; 			
							end
		endcase 
		end
		
		
endmodule
