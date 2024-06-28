module MathUnit (
    input clk,
    input [511:0] A1,
    input [511:0] A2,
    input [1:0] operation,    // 00: Addition, 01: Multiplication
    output reg [511:0] A3,
    output reg [511:0] A4
);

always @(posedge clk) begin
    case (operation)
        2'b00: begin // Addition
            A3 <= A1 + A2;
            A4 <= 512'b0;
        end
        2'b01: begin // Multiplication
            {A4, A3} <= A1 * A2;
        end
        default: begin
            A3 <= 512'b0;
            A4 <= 512'b0;
        end
    endcase
end

endmodule

