`timescale 1ns / 1ps

module div256(clk, rst, slowen);
	input clk, rst;
	output slowen; 
	
	reg [7:0] count;

	always @(posedge clk or posedge rst)
		begin
			if(rst) count <= 0;
			else count <= count + 1;
		end
	
	assign slowen = &count;
endmodule