// Testbench for the ALU module
module TB();
  reg [3:0] A, B;    // Registers to hold input values A and B
  reg [2:0] op;     // Register to hold the opcode
  wire [3:0] alu_out; // Wire to connect to the ALU output

  alu a1(A, B, op, alu_out); // Instantiate the ALU module

  initial // Initial block for test sequence
    begin
      op = 3'b000; A = 4'b0011; B = 4'b0001; // Set opcode and input values
      #10; // Wait for 10 time units

      op = 3'b001; A = 4'b0011; B = 4'b0001; // Set opcode and input values
      #10; // Wait for 10 time units

      op = 3'b010; A = 4'b0011; B = 4'b0001; // Set opcode and input values
      #10; // Wait for 10 time units

      op = 3'b011; A = 4'b0011; B = 4'b0001; // Set opcode and input values
      #10; // Wait for 10 time units

      // The testbench currently only tests the first 4 operations.
      // More test vectors can be added to fully verify the ALU functionality.

    end

endmodule
