`timescale 1ns/1ps
module bit4_adder_tb;
  reg [3:0] a,b;
  reg cin;
  wire [3:0] sum;
  wire cout;

  bit4_adder uut(
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  initial begin

    $dumpfile("bit4_adder.vcd");
    $dumpvars(0,uut);

    a = 4'h0;
    b = 4'h0;
    cin = 0;
    #100;

    a = 4'hA;
    b = 4'hA;
    cin = 1;
    #100;

  end 
endmodule



