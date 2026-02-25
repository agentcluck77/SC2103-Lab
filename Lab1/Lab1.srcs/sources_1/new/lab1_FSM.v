`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2026 12:31:12
// Design Name: 
// Module Name: lab1_FSM
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

module lab1_FSM (
    input wire clk,
    input wire rst,
    input wire fifty,
    input wire dollar, 
    input wire cancel,
    
    // Updated Output Ports to match top_FSM instantiation
    output reg insert_coin,  // Added this port
    output reg money_return, // Renamed from 'ret'
    output reg dispense,     // Renamed from 'vend'
    output reg [1:0] st
);
    
    parameter INIT = 2'd0, S50c = 2'd1, VEND = 2'd2, RETURN = 2'd3;
    reg [1:0] nst;
    
    // State register updates on clock
    always @(posedge clk) begin
        if (rst) st <= INIT;
        else st <= nst;
    end
    
    // Combinational logic for next state and outputs
    always @(*) begin
        // Defaults to prevent latches and set idle values
        nst = st;
        dispense = 1'b0;
        money_return = 1'b0;
        insert_coin = 1'b0;
        
        case (st)
            INIT: begin
                insert_coin = 1'b1; // LED on: Waiting for money
                if (dollar) nst = VEND;
                else if (fifty) nst = S50c;
            end
            
            S50c: begin
                insert_coin = 1'b1; // LED on: Waiting for more money
                if (cancel || dollar) nst = RETURN;
                else if (fifty) nst = VEND;
            end
            
            RETURN: begin
                money_return = 1'b1;
                nst = INIT;
            end
            
            VEND: begin
                dispense = 1'b1;
                nst = INIT; // Fixed: Must return to INIT, otherwise stuck in VEND forever
            end
            
            default: nst = INIT;
        endcase
    end

endmodule