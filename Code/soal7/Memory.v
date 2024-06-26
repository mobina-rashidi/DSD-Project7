module Memory (
    input clk,
    input [8:0] addr,
    input [31:0] data_in,
    input write_enable,
    output reg [31:0] data_out
);

// Memory array declaration
reg [31:0] mem [0:511];

// Memory read/write operations
always @(posedge clk) begin
    if (write_enable) begin
        mem[addr] <= data_in;
    end
    data_out <= mem[addr];
end

endmodule

