`timescale 1ns / 1ps

module LFSR(
	input clk,
   input rst,
   output wire random
   );
	
	reg [9:0] lfsr;
	
	always @(posedge clk or posedge rst)
		begin 
			if(rst)lfsr[9:0]<=1;
			else 	begin
					lfsr[8:0]<=lfsr[9:1];
					lfsr[9]<=lfsr[0]^lfsr[3];
					end
		end 
		
		assign random = lfsr[0];
		
endmodule