module alu_8bit (
    input [7:0] A,
    input [7:0] B,
    input [2:0] ALU_Sel,  // ALU operation selector
    output [7:0] ALU_out,  // Result
    output Carryout  // Carry out flag
);

  wire [7:0] sum, diff, and_res, or_res, xor_res, shift_left, shift_right, not_a;
  wire carry_sum, borrow_diff;

  assign {carry_sum, sum} = A + B;
  assign {borrow_diff, diff} = A - B;

  assign and_res = A & B;
  assign or_res = A | B;
  assign xor_res = A ^ B;
  assign not_a = ~A;

  assign shift_left = {A[6:0],A[0]};
  assign shift_right = {A[7],A[7:1]};


  assign ALU_out = (ALU_Sel == 3'b000) ? sum:
  (ALU_Sel == 3'b001) ? diff:
  (ALU_Sel == 3'b010) ? and_res:
  (ALU_Sel == 3'b011) ? or_res:
  (ALU_Sel == 3'b100) ? xor_res:
  (ALU_Sel == 3'b101) ? shift_left:
  (ALU_Sel == 3'b110) ? shift_right:
  (ALU_Sel == 3'b111) ? not_a:8'b0;

  assign Carryout  = (ALU_Sel == 3'b000) ? carry_sum:
  (ALU_Sel == 3'b001) ? borrow_diff: 1'b0;
  
endmodule

