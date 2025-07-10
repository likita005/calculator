`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 08:48:03
// Design Name: 
// Module Name: keypad_scanner
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


module keypad_scanner (
    input clk,
    input rst,
    input [3:0] row,
    output reg [3:0] col,
    output reg [3:0] row_index,
    output reg [1:0] col_index,
    output reg key_valid
);
    reg [19:0] timer;
    reg [1:0] current_col;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            timer <= 0;
            current_col <= 0;
            col <= 4'b1110;
            key_valid <= 0;
            row_index <= 0;
            col_index <= 0;
        end else begin
            timer <= timer + 1;

            if (timer == 20'd99999) begin
                timer <= 0;
                current_col <= current_col + 1;

                case (current_col)
                    2'd0: col <= 4'b1110;
                    2'd1: col <= 4'b1101;
                    2'd2: col <= 4'b1011;
                    2'd3: col <= 4'b0111;
                endcase
            end

            if (row != 4'b1111) begin
                key_valid <= 1;
                col_index <= current_col;

                case (row)
                    4'b1110: row_index <= 4'd0;
                    4'b1101: row_index <= 4'd1;
                    4'b1011: row_index <= 4'd2;
                    4'b0111: row_index <= 4'd3;
                    default: row_index <= 4'd0;
                endcase
            end else begin
                key_valid <= 0;
            end
        end
    end
endmodule
