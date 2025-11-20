module full_adder_1bit_sub(
  input a,
  input b,
  input cin,
  output cout,
  output s
);


wire xor_ab;
wire not_a;
wire not_b;
wire and_Na_b, and_Nxor_ab_cin;
wire not_xor_ab;

not(not_b, b);

xor(xor_ab, a, not_b);
xor(s, xor_ab, cin);

not(not_a, a);
not(not_xor_ab, xor_ab);

and(and_Nxor_ab_cin, not_xor_ab, cin);
and(and_Na_b, not_a, not_b);

or(cout, and_Na_b, and_Nxor_ab_cin);


endmodule
