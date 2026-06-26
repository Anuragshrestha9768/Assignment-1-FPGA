module bit4_adder (
  input [3:0] a,b,
  input cin,
  output [3:0] sum,
  output cout
);

wire w1,w2,w3,w4;

  full_adder fa1(
    a[0],
    b[0],
    cin,
    sum[0],
    w1
  );
  full_adder fa2(
    a[1],
    b[1],
    w1,
    sum[1],
    w2
  );
  full_adder fa3(
    a[2],
    b[2],
    w2,
    sum[2],
    w3
  );full_adder fa4(
    a[3],
    b[3],
    w3,
    sum[3],
    w4
  );

  assign cout = w4;

endmodule

  
