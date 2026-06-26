module full_adder(
  input a,b,c,
  output sum, cout 
);
wire o1,o2,o3,o4;

half_adder ha1(
  .a(a),
  .b(b),
  .sum(o1),
  .cout(o2)
);
half_adder ha2(
  .a(o1),
  .b(c),
  .sum(o4),
  .cout(o3)
);

assign sum=o4;
assign cout = o3|o2;

endmodule;
