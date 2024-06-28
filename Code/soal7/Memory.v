module Memory (
    input clk,
    input [8:0] addr,
    input [31:0] data_in,
    input write_enable,
    input burst_enable,
    input [3:0] burst_length,
    output reg [31:0] data_out
);

// Memory array declaration
reg [31:0] mem [0:511];
integer i;

// Memory read/write operations
always @(posedge clk) begin
    if (burst_enable) begin
        if (write_enable) begin
            for (i = 0; i <= burst_length; i = i + 1) begin
                mem[addr + i] <= data_in; // This may need to change per cycle in actual implementation
            end
        end else begin
            data_out <= mem[addr]; // For simplicity, returning the start address in burst read
        end
    end else begin
        if (write_enable) begin
            mem[addr] <= data_in;
        end
        data_out <= mem[addr];
    end
end

endmodule

