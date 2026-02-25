`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:58:13 09/06/2019
// Design Name:
// Module Name:    AMP_top
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module AMP_top (input clk, rst, input [5:0] a, b, output reg [11:0] result);

	// Stage 1 pipeline registers (inputs to multA)
    reg  [5:0]  a_r1, b_r1;

    // Stage 2 pipeline registers (inputs to multB)
    reg  [5:0]  a_r2, b_r2;
    reg  [9:0]  Pin;          // holds multA's output between stages

    // Combinational outputs from each module (wires, not regs)
    wire [9:0]  Pa;           // multA output
    wire [11:0] Pb;           // multB output

    // Instantiate both modules
    multA uA (.a(a_r1), .b(b_r1), .P(Pa));
    multB uB (.a(a_r2), .b(b_r2), .Pin(Pin), .P(Pb));


	always @ (posedge clk)
      if (rst)
      begin
          a_r1   <= 0;
          b_r1   <= 0;
          a_r2   <= 0;
          b_r2   <= 0;
          Pin    <= 0;
          result <= 0;
      end
      else
      begin
          // Stage 1: load from inputs
          a_r1 <= a;
          b_r1 <= b;
          // Stage 2: shift stage-1 regs forward + capture multA output
          a_r2 <= a_r1;
          b_r2 <= b_r1;
          Pin  <= Pa;
          // Output: register multB result
          result <= Pb;
      end


endmodule
