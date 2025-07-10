`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 08:50:06
// Design Name: 
// Module Name: key_decoder
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


module key_decoder (
    input [3:0] row_index,
    input [1:0] col_index,
    output reg [3:0] key,
    output reg is_op,
    output reg is_eq
);
    always @(*) begin
        is_op = 0;
        is_eq = 0;
        case ({row_index, col_index})
            6'b000000: key = 4'd1;
            6'b000001: key = 4'd2;
            6'b000010: key = 4'd3;
            6'b000011: begin key = 4'd10; is_op = 1; end // '+'
            6'b000100: key = 4'd4;
            6'b000101: key = 4'd5;
            6'b000110: key = 4'd6;
            6'b000111: begin key = 4'd11; is_op = 1; end // '-'
            6'b001000: key = 4'd7;
            6'b001001: key = 4'd8;
            6'b001010: key = 4'd9;
            6'b001011: begin key = 4'd12; is_op = 1; end // '*'
            6'b001100: key = 4'd14; // Clear
            6'b001101: key = 4'd0;
            6'b001110: begin key = 4'd15; is_eq = 1; end // '='
            6'b001111: begin key = 4'd13; is_op = 1; end // '/'
            default: key = 4'd0;
        endcase
    end
endmodule

