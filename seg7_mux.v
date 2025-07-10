`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 08:53:31
// Design Name: 
// Module Name: seg7_mux
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


module seg7_mux (
    input clk,
    input [7:0] digits, // 4 digits, 4 bits each
    output reg [3:0] an,
    output reg [6:0] seg  // Output reg to 7-segment
);

    reg [1:0] sel = 0;
    wire [3:0] digit;
    wire [6:0] seg_val;

    assign digit = digits >> (sel * 4);

    // Use intermediate wire from submodule
    bcd_to_seg conv (
        .bcd(digit),
        .seg(seg_val)
    );

    always @(posedge clk) begin
        sel <= sel + 1;
        case (sel)
            2'd0: an <= 4'b1110;
            2'd1: an <= 4'b1101;
            2'd2: an <= 4'b1011;
            2'd3: an <= 4'b0111;
        endcase

        seg <= seg_val;
    end

endmodule
