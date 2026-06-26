`timescale 1ns/1ps
module half_adder_tb;
  reg a;
  reg b;
  wire sum;
  wire cout;

  half_adder uut(
    .a(a),
    .b(b),
    .sum(sum),
    .cout(cout)
  );

  initial begin
    $dumpfile("half_adder.vcd");
    $dumpvars(0,uut);

    a=0;
    b=0;
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
