module fulladder(
    input a,
    input b,
    input cin,
    output cout,
    output s
);

wire xor_ab;
wire and_ab, and_ac, and_bc;

xor (xor_ab, a, b);
xor (s , xor_ab, cin);

and (and_ab, a, b);
and (and_bc, b, cin);
and (and_ac, a, cin);

or (cout, and_ab, and_ac, and_bc);

endmodule