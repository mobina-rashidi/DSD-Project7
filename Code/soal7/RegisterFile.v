module RegisterFile (
    input clk,
    input [1:0] sel_reg_write,  // Select which register to write to
    input [1:0] sel_reg_read1,  // Select first register for read
    input [1:0] sel_reg_read2,  // Select second register for read
    input [511:0] data_in,      // Data to be written into selected register
    input reg_write_enable,     // Enable signal for write operation
    output reg [511:0] A1,      // Register A1
    output reg [511:0] A2,      // Register A2
    output reg [511:0] A3,      // Register A3
    output reg [511:0] A4       // Register A4
);

// Register declaration
reg [511:0] registers [0:3];

// Write operation
always @(posedge clk) begin
    if (reg_write_enable) begin
        registers[sel_reg_write] <= data_in;
    end
end

// Output assignment
always @(*) begin
    A1 = registers[0];
    A2 = registers[1];
    A3 = registers[2];
    A4 = registers[3];
end

endmodule

