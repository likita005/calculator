`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 08:50:57
// Design Name: 
// Module Name: debounce
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


module debounce (
    input clk,
    input btn_in,
    output reg btn_out
);
    reg [19:0] count;
    reg stable;

    always @(posedge clk) begin
        if (btn_in == stable)
            count <= 0;
        else
            count <= count + 1;

        if (count == 20'd1000000) begin
            stable <= btn_in;
            btn_out <= btn_in;
        end
    end
endmodule
