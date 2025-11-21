module alu_32(

  input wire [31:0] a,
  input wire [31:0] b,
  input wire [3:0] alu_control,

  output reg [31:0] out_resultado,
  output wire zero,
  output wire carry_out,
  output wire overflow
);
  wire [32:0] soma_total;
  wire [32:0] subtrator_total;

  fulladder_32bits_sum somador (
      .a(a),
      .b(b),
      .s(soma_total)
  );

  full_adder_32bit_sub subtrator(
    .a(a),
      .b(b),
      .s(subtrator_total)
  );

  always @(*) begin
    case (alu_control)

      4'b0000: out_resultado = a & b;
      4'b0001: out_resultado = a | b;
      4'b0010: out_resultado = soma_total[32:0];
      4'b0110: out_resultado = subtrator_total[32:0];
      4'b0111: out_resultado = a < b ? 32'd1: 32'd0;
      4'b1100: out_resultado = ~(a | b);
    endcase
  end

  assign zero = (out_resultado == 32'd0);



endmodule
