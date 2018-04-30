`timescale 1ns / 1ps

module PBL(push,tie,right,pbr,pbl,pbu,pbd,clear,rst);
	input pbr,pbl,pbu,pbd,clear,rst; // inputs
	output push,tie,right; // outputs
	wire G,H,x,y; // wires used to make the logic
	//reg tie; 
	
	//PBL logic  
	assign x = (~H)&pbl || (~H)&pbu; 
	assign y = (~G)&pbr || (~G)&pbd;
	assign G = (G|x) & (~(rst|clear));	
	assign H = (H|y) & (~(rst|clear));	
	
	// outputs we want in this module
	assign push = G|H; // Either player pushed button
	assign tie = G&H; // both player pushed simultaneously
	assign right = H&(~G); // 1 if right player pushed first
	
endmodule