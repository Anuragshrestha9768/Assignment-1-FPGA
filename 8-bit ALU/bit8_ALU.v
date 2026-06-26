module alu_8bit (
    input [7:0] A,
    input [7:0] B,
    input [2:0] ALU_Sel,  // ALU operation selector
    output reg [7:0] ALU_out,  // Result
    output reg Carryout  // Carry out flag
);


  wire [7:0] sum, diff, and_res, or_res, xor_res, shift_left, shift_righ, not_a;
  wire carry_sum, borrow_diff;

  // Arithmetic operation 
  assign {carry_sum, sum} = A + B;
  assign {borrow_diff, diff} = A - B;

  // Logical operation 
  assign and_res = A & B;
  assign or_res = A | B;
  assign xor_res = A ^ B;
  assign not_a = ~A;

  // Shift Operation 
  assign shift_left = A << 1;
  assign shift_right = A >> 1;

  // ALU operation selection 
  always @(*) begin
    case (ALU_Sel)
      3'b000: begin  //Addition
        ALU_out  = sum;
        Carryout = carry_sum;
      end
      3'b001: begin  //Subtraction 
        ALU_out  = diff;
        Carryout = borrow_diff;
      end
      3'b010: begin  //AND
        ALU_out  = and_res;
        Carryout = 1'b0;
      end
      3'b011: begin  //OR
        ALU_out  = or_res;
        Carryout = 1'b0;
      end
      3'b100: begin  //XOR 
        ALU_out  = xor_res;
        Carryout = 1'b0;
      end
      3'b101: begin  //Shift left 
        ALU_out  = shift_left;
        Carryout = A[7];
      end
      3'b110: begin  //Shift right 
        ALU_out  = shift_right;
        Carryout = A[0];
      end
      3'b111: begin  //A complement 
        ALU_out  = not_a;
        Carryout = 1'b0;
      end
      default: begin
        ALU_out  = 8'b0;
        Carryout = 1'b0;
      end
    endcase

  end
endmodule

