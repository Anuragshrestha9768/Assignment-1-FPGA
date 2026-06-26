// 8-bit Adder using structural modeling with 4-bit adders
module adder_8bit (
    input [7:0] a, b,
    input cin,
    output [7:0] sum,
    output cout
);
    
    // Internal carry signal
    wire c4;
    
    // Instantiate two 4-bit adders
    adder_4bit adder_low (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .sum(sum[3:0]),
        .cout(c4)
    );
    
    adder_4bit adder_high (
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(c4),
        .sum(sum[7:4]),
        .cout(cout)
    );
    
endmodule