module full_adder_32bit_sub(
  input wire [31:0] a,
  input wire [31:0] b,
  output wire [32:0] s
);

wire [30:0] cout;

full_adder_1bit_sub f0( .a(a[0]), .b(b[0]), .cin(1'b0), .cout(cout[0]), .sum(s[0]) );

full_adder_1bit_sub f1( .a(a[1]), .b(b[1]), .cin(cout[0]), .cout(cout[1]), .sum(s[1]) );

full_adder_1bit_sub f2( .a(a[2]), .b(b[2]), .cin(cout[1]), .cout(cout[2]), .sum(s[2]) );

full_adder_1bit_sub f3( .a(a[3]), .b(b[3]), .cin(cout[2]), .cout(cout[3]), .sum(s[3]) );

full_adder_1bit_sub f4( .a(a[4]), .b(b[4]), .cin(cout[3]), .cout(cout[4]), .sum(s[4]) );

full_adder_1bit_sub f5( .a(a[5]), .b(b[5]), .cin(cout[4]), .cout(cout[5]), .sum(s[5]) );

full_adder_1bit_sub f6( .a(a[6]), .b(b[6]), .cin(cout[5]), .cout(cout[6]), .sum(s[6]) );

full_adder_1bit_sub f7( .a(a[7]), .b(b[7]), .cin(cout[6]), .cout(cout[7]), .sum(s[7]) );

full_adder_1bit_sub f8( .a(a[8]), .b(b[8]), .cin(cout[7]), .cout(cout[8]), .sum(s[8]) );

full_adder_1bit_sub f9( .a(a[9]), .b(b[9]), .cin(cout[8]), .cout(cout[9]), .sum(s[9]) );

full_adder_1bit_sub f10(.a(a[10]),.b(b[10]),.cin(cout[9]),.cout(cout[10]),.sum(s[10]) );

full_adder_1bit_sub f11(.a(a[11]),.b(b[11]),.cin(cout[10]),.cout(cout[11]),.sum(s[11]) );

full_adder_1bit_sub f12(.a(a[12]),.b(b[12]),.cin(cout[11]),.cout(cout[12]),.sum(s[12]) );

full_adder_1bit_sub f13(.a(a[13]),.b(b[13]),.cin(cout[12]),.cout(cout[13]),.sum(s[13]) );

full_adder_1bit_sub f14(.a(a[14]),.b(b[14]),.cin(cout[13]),.cout(cout[14]),.sum(s[14]) );

full_adder_1bit_sub f15(.a(a[15]),.b(b[15]),.cin(cout[14]),.cout(cout[15]),.sum(s[15]) );

full_adder_1bit_sub f16(.a(a[16]),.b(b[16]),.cin(cout[15]),.cout(cout[16]),.sum(s[16]) );

full_adder_1bit_sub f17(.a(a[17]),.b(b[17]),.cin(cout[16]),.cout(cout[17]),.sum(s[17]) );

full_adder_1bit_sub f18(.a(a[18]),.b(b[18]),.cin(cout[17]),.cout(cout[18]),.sum(s[18]) );

full_adder_1bit_sub f19(.a(a[19]),.b(b[19]),.cin(cout[18]),.cout(cout[19]),.sum(s[19]) );

full_adder_1bit_sub f20(.a(a[20]),.b(b[20]),.cin(cout[19]),.cout(cout[20]),.sum(s[20]) );

full_adder_1bit_sub f21(.a(a[21]),.b(b[21]),.cin(cout[20]),.cout(cout[21]),.sum(s[21]) );

full_adder_1bit_sub f22(.a(a[22]),.b(b[22]),.cin(cout[21]),.cout(cout[22]),.sum(s[22]) );

full_adder_1bit_sub f23(.a(a[23]),.b(b[23]),.cin(cout[22]),.cout(cout[23]),.sum(s[23]) );

full_adder_1bit_sub f24(.a(a[24]),.b(b[24]),.cin(cout[23]),.cout(cout[24]),.sum(s[24]) );

full_adder_1bit_sub f25(.a(a[25]),.b(b[25]),.cin(cout[24]),.cout(cout[25]),.sum(s[25]) );

full_adder_1bit_sub f26(.a(a[26]),.b(b[26]),.cin(cout[25]),.cout(cout[26]),.sum(s[26]) );

full_adder_1bit_sub f27(.a(a[27]),.b(b[27]),.cin(cout[26]),.cout(cout[27]),.sum(s[27]) );

full_adder_1bit_sub f28(.a(a[28]),.b(b[28]),.cin(cout[27]),.cout(cout[28]),.sum(s[28]) );

full_adder_1bit_sub f29(.a(a[29]),.b(b[29]),.cin(cout[28]),.cout(cout[29]),.sum(s[29]) );

full_adder_1bit_sub f30(.a(a[30]),.b(b[30]),.cin(cout[29]),.cout(cout[30]),.sum(s[30]) );

full_adder_1bit_sub f31(.a(a[31]),.b(b[31]),.cin(cout[30]),.cout(s[32]),.sum(s[31]) );



endmodule
