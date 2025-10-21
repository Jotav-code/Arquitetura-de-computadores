module adder4bits(
    input [3:0] a,
    input [3:0] b,
    output [4:0] s
);

    wire [2:0] cout;

    fulladder fa1( .a(a[0]), .b(b[0]), .cout(cout[0]), .cin(1'b0), .s(s[0]));
    fulladder fa2( .a(a[1]), .b(b[1]), .cout(cout[1]), .cin(cout[0]), .s(s[1]));
    fulladder fa3( .a(a[2]), .b(b[2]), .cout(cout[2]), .cin(cout[1]), .s(s[2]));
    fulladder fa4( .a(a[3]), .b(b[3]), .cout(s[4]), .cin(cout[2]), .s(s[3]));
endmodule