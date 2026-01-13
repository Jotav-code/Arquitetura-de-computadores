module full_adder_1bit_sub(
  input wire a,
  input wire b,
  input wire cin,
  output wire sum,
  output wire cout
);




wire xor_ab;
wire and_ab, and_xor_ab_cin;
wire not_b;


not(not_b, b);

and(and_ab, a, not_b);
and(and_xor_ab_cin, xor_ab, cin);

xor(xor_ab, a, not_b);
xor(sum, xor_ab, cin);

or(cout, and_ab, and_xor_ab_cin );

endmodule
