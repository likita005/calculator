`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 08:54:08
// Design Name: 
// Module Name: top
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


module top (
    input clk,
    input rst,
    input [3:0] row,
    output [3:0] col,
    output [6:0] seg,
    output [3:0] an
);
    wire [3:0] row_idx;
    wire [1:0] col_idx;
    wire key_valid;
    wire [3:0] key;
    wire is_op, is_eq;
    wire [3:0] A, B;
    wire [1:0] op_code;
    reg [1:0] op_sel;
    reg [3:0] op1, op2;
    wire [7:0] result;
    wire load_op1, load_op2, load_operator, calc, show_result;

    keypad_scanner scanner(.clk(clk), .rst(rst), .row(row), .col(col), .row_index(row_idx), .col_index(col_idx), .key_valid(key_valid));
    key_decoder decoder(.row_index(row_idx), .col_index(col_idx), .key(key), .is_op(is_op), .is_eq(is_eq));
    control_unit ctrl(.clk(clk), .reset(rst), .key_pressed(key_valid), .is_op(is_op), .is_eq(is_eq),
                      .load_op1(load_op1), .load_op2(load_op2), .load_operator(load_operator), .calc(calc), .show_result(show_result));

    always @(posedge clk) begin
        if (load_op1) op1 <= key;
        if (load_op2) op2 <= key;
        if (load_operator) op_sel <= key[1:0]; // Only 2 LSBs for opcode
    end

    calc_1digit alu(.A(op1), .B(op2), .op(op_sel), .result(result), .error());

    seg7_mux display(.clk(clk), .digits(result), .seg(seg), .an(an));
endmodule

