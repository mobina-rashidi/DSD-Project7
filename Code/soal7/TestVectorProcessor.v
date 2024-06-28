module TestVectorProcessor;

// Inputs
reg clk;
reg [8:0] addr;
reg [31:0] data_in;
reg write_enable;
reg burst_enable;
reg [3:0] burst_length;
reg reg_write_enable;
reg [1:0] sel_reg_write;
reg [1:0] sel_reg_read1;
reg [1:0] sel_reg_read2;
reg [1:0] operation;

// Outputs
wire [511:0] A1;
wire [511:0] A2;
wire [511:0] A3;
wire [511:0] A4;
wire [31:0] data_out;

// Instantiate the processor
VectorProcessor dut (
    .clk(clk),
    .addr(addr),
    .data_in(data_in),
    .write_enable(write_enable),
    .burst_enable(burst_enable),
    .burst_length(burst_length),
    .reg_write_enable(reg_write_enable),
    .sel_reg_write(sel_reg_write),
    .sel_reg_read1(sel_reg_read1),
    .sel_reg_read2(sel_reg_read2),
    .operation(operation),
    .A1(A1),
    .A2(A2),
    .A3(A3),
    .A4(A4),
    .data_out(data_out)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Test stimulus
initial begin
    // Initialize inputs
    addr = 0;
    data_in = 32'h0;
    write_enable = 0;
    burst_enable = 0;
    burst_length = 0;
    reg_write_enable = 0;
    sel_reg_write = 2'b00;
    sel_reg_read1 = 2'b00;
    sel_reg_read2 = 2'b00;
    operation = 2'b00;

    // Test case 1: Load data into register A1 from memory
    addr = 9'b000000001;
    data_in = 32'hAABBCCDD;
    write_enable = 1;
    burst_enable = 0;
    burst_length = 0;
    reg_write_enable = 1;
    sel_reg_write = 2'b00; // Writing to register A1
    #10;

    // Test case 2: Load data into register A2 from memory
    addr = 9'b000000010;
    data_in = 32'h11223344;
    write_enable = 1;
    burst_enable = 0;
    burst_length = 0;
    reg_write_enable = 1;
    sel_reg_write = 2'b01; // Writing to register A2
    #10;

    // Test case 3: Perform addition and store result in A3
    reg_write_enable = 0;
    sel_reg_read1 = 2'b00; // Reading from register A1
    sel_reg_read2 = 2'b01; // Reading from register A2
    operation = 2'b00; // Addition operation
    #10;

    // Test case 4: Perform multiplication and store result in A4
    operation = 2'b01; // Multiplication operation
    #10;

    // Display results
    $display("A1: %h", A1);
    $display("A2: %h", A2);
    $display("A3 (Addition Result): %h", A3);
    $display("A4 (Multiplication Result): %h", A4);

    // Test case 5: Store result of A3 in memory
    addr = 9'b000000011;
    data_in = A3[31:0]; // Store lower 32 bits of A3 in memory
    write_enable = 1;
    #10;

    // Test case 6: Store result of A4 in memory
    addr = 9'b000000100;
    data_in = A4[31:0]; // Store lower 32 bits of A4 in memory
    write_enable = 1;
    #10;

    // Test boundary conditions
    // Boundary test 1: Writing to the last memory location
    addr = 9'b111111111;
    data_in = 32'hDEADBEEF;
    write_enable = 1;
    #10;

    // Boundary test 2: Reading from the last memory location
    write_enable = 0;
    #10;
    $display("Last memory location: %h", data_out);

    // End simulation
    $stop;
end

endmodule

