`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2026 12:40:37
// Design Name: 
// Module Name: lab1_FSM_tb
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

module lab1_FSM_tb;

  // 1. Declare signals
  // Inputs as regs
  reg clk;
  reg rst;
  reg fifty;   // Renamed from c50
  reg dollar;  // Renamed from d1
  reg cancel;

  // Outputs as wires
  wire insert_coin; // New signal
  wire dispense;    // Renamed from vend
  wire money_return;// Renamed from ret
  wire [1:0] st;

  // 2. Instantiate the module as DUT
  lab1_FSM DUT (
    .clk(clk),
    .rst(rst),
    .fifty(fifty),
    .dollar(dollar),
    .cancel(cancel),
    .insert_coin(insert_coin),
    .money_return(money_return),
    .dispense(dispense),
    .st(st)
  );

  // 3. Clock generation: 10ns period (5ns high, 5ns low)
  // Note: We initialize clk in the main initial block
  always #5 clk = ~clk;

  // 4. Main Initial Block
  initial begin
    // Setup for waveform viewing
    $dumpfile("dump.vcd");
    $dumpvars(0, lab1_FSM_tb);

    // Monitor changes in the console
    $monitor("Time=%0t | st=%d | fifty=%b dollar=%b cancel=%b | Ins=%b Dsp=%b Ret=%b", 
             $time, st, fifty, dollar, cancel, insert_coin, dispense, money_return);

    // --- Stimulus Sequence from your instructions ---
    
    // Initialize Inputs
    clk = 0; rst = 1; fifty = 0; dollar = 0; cancel = 0;
    
    #10 rst = 0;      // to INIT (0) state
    
    // Case 1: 50c + 50c -> Dispense
    #10 fifty = 1;    // to S50c (1) state
    #10 fifty = 0;
    #10 fifty = 1;    // to VEND (2) state
    #10 fifty = 0;
    
    // Case 2: Reset
    #20 rst = 1;      // RESET, to INIT (0) state
    #10 rst = 0; 
    
    // Case 3: Dollar -> Dispense
    #10 dollar = 1;   // to VEND (2) state
    #10 dollar = 0;
    
    // Case 4: Reset
    #20 rst = 1;      // RESET, to INIT (0) state
    #10 rst = 0; 
    
    // Case 5: 50c + Dollar -> Return (Overpayment case)
    #10 fifty = 1;    // to S50c (1) state
    #10 fifty = 0;
    #10 dollar = 1;   // to RETURN (3) state
    #10 dollar = 0;   // to INIT (0) state (Automatic return from RETURN state)
    
    // Case 6: 50c + Cancel -> Return
    #20 fifty = 1;    // to S50c (1) state
    #10 fifty = 0;
    #10 cancel = 1;   // to RETURN (3) state
    #10 cancel = 0;   // to INIT (0) state

    // End simulation
    #20 $finish();
  end

endmodule