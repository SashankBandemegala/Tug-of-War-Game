`timescale 1ns / 1ps

module OPP(sypush, clk, rst, winrnd);
	input sypush, clk, rst;
	output winrnd;
	wire sypush, clk, rst;
	reg x;
	//reg winrnd;
	
	always@(posedge clk or posedge rst)
		begin
			if (rst) x <= 0;
			else x <= sypush;
		end
		
	assign winrnd = sypush & ~x;
endmodule

