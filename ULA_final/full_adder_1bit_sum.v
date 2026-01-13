module full_adder_1bit_sum(
  input wire a,
  input wire b,
  input wire cin,
  output wire sum,
  output wire cout
);

wire xor_ab;
wire and_ab, and_xor_ab_cin;


and(and_ab, a, b);
and(and_xor_ab_cin, xor_ab, cin);

xor(xor_ab, a, b);
xor(sum, xor_ab, cin);

or(cout, and_ab, and_xor_ab_cin );

endmodule
