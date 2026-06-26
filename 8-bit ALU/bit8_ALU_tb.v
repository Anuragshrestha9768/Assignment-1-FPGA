`timescale 1ns/1ps

module alu_8bit_tb;
  
  reg [7:0] A,B;
  reg [2:0] ALU_Sel;

  wire [7:0] ALU_out;
  wire Carryout;

  alu_8bit uut(
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_out(ALU_out),
    .Carryout(Carryout)
  );

  initial begin
    $dumpfile("alu_8bit.vcd");
    $dumpvars(0,uut);

    // Addition
    A = 8'hFF; B=8'h01; ALU_Sel = 3'b000;
    #100;

    // Subraction
    A = 8'h00; B=8'h01; ALU_Sel = 3'b001;
    #100;

    // AND
    A = 8'hF0; B=8'h0F; ALU_Sel = 3'b010;
    #100;

    // OR 
    A = 8'hF0; B=8'h0F; ALU_Sel = 3'b011;
    #100;

    // Shift left
    A = 8'h80; B=8'h00; ALU_Sel = 3'b101;
    #100;

    // XOR 
    A = 8'hFF; B=8'h55; ALU_Sel = 3'b100;
    #100;

    // Shift right 
    A = 8'h01; B=8'h00; ALU_Sel = 3'b110;
    #100;

    // A complement
    A = 8'hFF; B=8'h00; ALU_Sel = 3'b111;
    #100;


end 
endmodule
