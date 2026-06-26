`timescale 1ns / 1ps
module and_gate_tb;

  reg  a;
  reg  b;
  wire z;

  and_gate uut (
      .a(a),
      .b(b),
      .z(z)
  );

  initial begin
    // stiulus or test cases
    // following two lines are only for Icaurs Verilog
    $dumpfile("and_gate.vcd");
    $dumpvars(0, uut);

    a = 0;
    b = 0;
    #100;

    a = 0;
    b = 1;
    #100;

    a = 1;
    b = 0;
    #100;

    a = 1;
    b = 1;
    #100;

  end
endmodule
