`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 08:52:23
// Design Name: 
// Module Name: calc_1digit
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

module calc_1digit (
    input [3:0] A,
    input [3:0] B,
    input [1:0] op,  // 00=+, 01=-, 10=*, 11=/
    output reg [7:0] result,
    output reg error
);
    always @(*) begin
        error = 0;
        case (op)
            2'b00: result = A + B;
            2'b01: result = A - B;
            2'b10: result = A * B;
            2'b11: if (B == 0) begin error = 1; result = 0; end
                   else result = A / B;
            default: result = 0;
        endcase
    end
endmodule

