`timescale 1ns / 1ps

module bit8_adder_tb;

  // Inputs
  reg [7:0] a, b;
  reg cin;

  // Outputs
  wire [7:0] sum;
  wire cout;

  // Instantiate the 8-bit adder
  adder_8bit uut (
      .a(a),
      .b(b),
      .cin(cin),
      .sum(sum),
      .cout(cout)
  );

  // Test procedure
  initial begin
    $dumpfile("bit8_adder.vcd");
    $dumpvars(0, uut);

    // Test Case 1: Basic addition
    a   = 8'h05;
    b   = 8'h03;
    cin = 1'b0;
    #100;

    // Test Case 2: Addition with carry in
    a   = 8'h0A;
    b   = 8'h0F;
    cin = 1'b1;
    #100;

    // Test Case 3: Addition with carry out
    a   = 8'hFF;
    b   = 8'h01;
    cin = 1'b0;
    #100;

    // Test Case 4: Maximum addition
    a   = 8'hFF;
    b   = 8'hFF;
    cin = 1'b1;
    #100;

    // Test Case 5: Random test 1
    a   = 8'h3C;
    b   = 8'h4A;
    cin = 1'b0;
    #100;

    // Test Case 6: Random test 2
    a   = 8'h99;
    b   = 8'h66;
    cin = 1'b1;
    #100;

    // Test Case 7: Zero addition
    a   = 8'h00;
    b   = 8'h00;
    cin = 1'b0;
    #100;

    // Test Case 8: Crossing 8-bit boundary
    a   = 8'h80;
    b   = 8'h80;
    cin = 1'b0;
    #100;

    $finish;
  end

endmodule

