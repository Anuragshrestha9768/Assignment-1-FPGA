`timescale 1ns/1ps

module full_adder_tb;
  reg a;
  reg b;
  reg c;
  wire sum;
  wire cout;

  full_adder uut(
    .a(a),
    .b(b),
    .c(c),
    .sum(sum),
    .cout(cout)
  );

  initial begin

    $dumpfile("full_adder.vcd");
    $dumpvars(0,uut);
 
    a=0;
    b=0;
    c=0;
    #100;
    
    a = 0;
    b = 1;
    c = 0;
    #100;

    a = 1;
    b = 0;
    c = 0;
    #100;

    a = 1;
    b = 1;
    c = 0;
    #100;


    a=0;
    b=0;
    c=1;
    #100;
    
    a = 0;
    b = 1;
    c = 1;
    #100;

    a = 1;
    b = 0; 
    c = 1;
    #100;

    a = 1;
    b = 1; 
    c = 1;
    #100;


end
endmodule

