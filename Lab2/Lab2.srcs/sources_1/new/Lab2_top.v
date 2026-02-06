`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2026 13:42:18
// Design Name: 
// Module Name: Lab2_top
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

`timescale 1ns / 1ps

module Lab2_top_tb;

    // 1. Declare Inputs as Regs and Outputs as Wires
    // [cite: 93]
    reg clk;
    reg rst;
    reg write_en;
    reg save_data;
    reg show_reg;
    reg [7:0] d_in;

    wire [7:0] d_out;

    // 2. Instantiate the Unit Under Test (UUT)
    // [cite: 93]
    Lab2_top uut (
        .clk(clk), 
        .rst(rst), 
        .write_en(write_en), 
        .save_data(save_data), 
        .show_reg(show_reg), 
        .d_in(d_in), 
        .d_out(d_out)
    );

    // 3. Clock Generation
    // "Add a clock always block to toggle every 5 timesteps" (Period = 10ns)
    // [cite: 94]
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // 4. Test Stimuli
    // Sources: Task 2, Step 3-4 [cite: 95-97] and Figure 2 [cite: 110-127]
    initial begin
        // Initialize Inputs
        // "setting all inputs to '0', except rst which should be set to '1'"
        // [cite: 95]
        rst = 1;
        write_en = 0;
        save_data = 0;
        show_reg = 0;
        d_in = 0;

        // Apply Test Vectors from Figure 2
        // [cite: 110-127]
        #10 rst = 0;
        
        #10 d_in = 8'h15;       // Load 15 into data bus
        #10 save_data = 1;      // Save 15 into internal register
        #10 save_data = 0; d_in = 8'h01; // Prep address 01
        
        #10 write_en = 1;       // Write value 15 (from reg) to Mem Address 01
        #10 write_en = 0;
        
        #10 d_in = 8'hA3;       // Load A3 into data bus
        #10 save_data = 1;      // Save A3 into internal register
        #10 save_data = 0; d_in = 8'h02; // Prep address 02
        
        #10 write_en = 1;       // Write value A3 (from reg) to Mem Address 02
        #10 write_en = 0;
        
        #10 d_in = 8'h87;       // Load 87 into data bus
        #10 save_data = 1;      // Save 87 into internal register
        #10 save_data = 0;
        
        #10 d_in = 8'h01;       // Set Address 01 (Value there is 15)
        #10 show_reg = 1;       // Switch MUX to show Memory output
        
        #10 d_in = 8'h01; show_reg = 0; // Switch MUX back to Register
        
        #10 $finish();
    end

endmodule