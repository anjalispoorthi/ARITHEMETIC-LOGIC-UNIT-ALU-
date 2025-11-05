module alu(A, B, op, alu_out);
  input [3:0] A, B; // 4-bit input A and B
  input [2:0] op;    // 3-bit opcode to select ALU operation
  output reg [3:0] alu_out; // 4-bit output of the ALU

  always @(*) // Combinational logic, executes whenever any input changes
    begin
      case (op) // Select operation based on the opcode
        3'b000: alu_out = 0;     // Operation: Reset (output is 0)
        3'b001: alu_out = A + B; // Operation: Addition
        3'b010: alu_out = A - B; // Operation: Subtraction
        3'b011: alu_out = A & B; // Operation: Bitwise AND
        3'b100: alu_out = A | B; // Operation: Bitwise OR
        3'b101: alu_out = ~A;    // Operation: Bitwise NOT of A
        3'b110: alu_out = ~B;    // Operation: Bitwise NOT of B
        3'b111: alu_out = 0;     // Operation: Reset (output is 0)
        default: alu_out = 0;     // Default case: Reset (output is 0) if opcode is invalid
      endcase
    end
endmodule

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
