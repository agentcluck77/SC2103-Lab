`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2026 14:20:02
// Design Name: 
// Module Name: Lab2_top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module Lab2_top(input clk, rst, write_en, save_data, show_reg, input [7:0] d_in, output reg [7:0] d_out);
    reg [7:0] reg_d;
    wire [7:0] mem_d;
    Lab2_mem U1 (
      .a(d_in[5:0]),      // input wire [5 : 0] a
      .d(reg_d),      // input wire [7 : 0] d
      .clk(clk),  // input wire clk
      .we(write_en),    // input wire we
      .spo(mem_d)  // output wire [7 : 0] spo
    );
endmodule
    


