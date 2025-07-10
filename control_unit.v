`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 08:51:38
// Design Name: 
// Module Name: control_unit
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


module control_unit (
    input clk,
    input reset,
    input key_pressed,
    input is_op,
    input is_eq,
    output reg load_op1,
    output reg load_op2,
    output reg load_operator,
    output reg calc,
    output reg show_result
);
    parameter IDLE = 0, OP1 = 1, OP = 2, OP2 = 3, CALC = 4, SHOW = 5;
    reg [2:0] state, next;

    always @(posedge clk or posedge reset) begin
        if (reset) state <= IDLE;
        else state <= next;
    end

    always @(*) begin
        load_op1 = 0; load_op2 = 0; load_operator = 0; calc = 0; show_result = 0;
        case (state)
            IDLE:    if (key_pressed && !is_op && !is_eq) next = OP1; else next = IDLE;
            OP1:     begin load_op1 = 1; next = OP; end
            OP:      if (key_pressed && is_op) begin load_operator = 1; next = OP2; end else next = OP;
            OP2:     if (key_pressed && !is_op && !is_eq) begin load_op2 = 1; next = CALC; end else next = OP2;
            CALC:    begin calc = 1; next = SHOW; end
            SHOW:    begin show_result = 1; next = IDLE; end
            default: next = IDLE;
        endcase
    end
endmodule

