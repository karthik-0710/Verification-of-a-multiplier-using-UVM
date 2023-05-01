module adder(a,b,mul);
	input [3:0] a,b;
	output reg [4:0] mul;
	
	always_comb begin
		mul<=a*b;
	end
endmodule 


