`timescale 1ns / 1ps

module led_mux(
    input [1:0] leds_ctrl,
    input [6:0] score,
	 input rst,
    output reg [6:0] leds_out
    );
	
	`define off 				0
	`define on 					3
	`define score				2
	`define sn              1

	
	always @(leds_ctrl, score, rst)
		begin
			if(~rst)
				case(leds_ctrl)
					`on: leds_out[6:0] = 7'b1111111;
					`off: leds_out[6:0] = 0;
					`score: leds_out[6:0] = score[6:0];
					`sn: leds_out[6:0] = 7'b1011000;
					default: leds_out[6:0] = 0;
				endcase
			else if (rst)
				leds_out[6:0] = 7'b1011000;
			else
				leds_out[6:0] = 0;
		end
			
endmodule
