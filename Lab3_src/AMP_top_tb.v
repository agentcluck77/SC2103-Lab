`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:23:41 09/10/2019
// Design Name:   AMP_top
// Module Name:   AMP_top_tb.v
// Project Name:  Array_mult
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created for module: AMP_top (Task 3 - Pipelined)
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module AMP_top_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [5:0] a;
	reg [5:0] b;

	// Outputs
	wire [11:0] result;

	// Instantiate the Unit Under Test (UUT)
	AMP_top uut (
		.clk(clk), 
		.rst(rst), 
		.a(a), 
		.b(b), 
		.result(result)
	);

       
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;		// device reset
		a = 0;
		b = 0;

	    #10;
		rst = 0;		// device operates
        
		// Add stimulus here
		begin
            #10; a=0; b=0;
            $display("%b x %b is: %b", a, b, result);
            #10; a=7; b=14;
            $display("%b x %b is: %b", a, b, result);
            #10; a=-2; b=14;
            $display("%b x %b is: %b", a, b, result);
            #10; a=21; b=-28;
            $display("%b x %b is: %b", a, b, result);
            #10; a=-13; b=-28;
            $display("%b x %b is: %b", a, b, result);
            // corner cases
            #10; a=0; b=31;
            $display("%b x %b is: %b", a, b, result);
            #10; a=-32; b=-32;
            $display("%b x %b is: %b", a, b, result);
            #10; a=-32; b=31;
            $display("%b x %b is: %b", a, b, result);
            #10; a=31; b=31;
            $display("%b x %b is: %b", a, b, result);
            #10; a=-32; b=0;
            $display("%b x %b is: %b", a, b, result);
            #20 $finish();

		end

	end
	
	always #5 clk=~clk;
 
     
endmodule
