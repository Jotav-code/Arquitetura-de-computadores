module alu_32(

  input wire [31:0] a,
  input wire [31:0] b,
  input wire [3:0] alu_control,

  output reg [31:0] out_resultado,
  output wire zero,
  output reg carry_out,
  output reg overflow
);
wire [31:0] soma_total;
  wire cout_soma, over_soma;

  wire [31:0] subtrator_total;
  wire cout_sub, over_sub;

  // 2. Instâncias ligadas aos fios internos
  fulladder_32bits_sum somador (
    .a(a),
    .b(b),
    .s(soma_total),
    .carry_out(cout_soma), // Liga no fio interno
    .overflow(over_soma)   // Liga no fio interno
  );

  // Certifique-se que você tem o módulo full_adder_32bit_sub definido no seu projeto
  full_adder_32bit_sub subtrator(
    .a(a),
    .b(b),
    .s(subtrator_total),
    .carry_out(cout_sub),  // Liga no fio interno
    .overflow(over_sub)    // Liga no fio interno
  );

  always @(*) begin
    case (alu_control)

      4'b0000: out_resultado = a & b;
      4'b0001: out_resultado = a | b;
      4'b0010: out_resultado = soma_total[31:0];
      4'b0110: out_resultado = subtrator_total[31:0];
      4'b0111: out_resultado = a < b ? 32'd1: 32'd0;
      4'b1100: out_resultado = ~(a | b);
    endcase
  end

  assign zero = (out_resultado == 32'd0);



endmodule
