module alu_32(

  input wire [31:0] a,
  input wire [31:0] b,
  input wire [3:0] alu_control,

  output wire[31:0] out_resultado,
  output wire zero,
  output wire carry_out,
  output wire overflow
);
  wire [31:0] soma_total;

  fulladder_32bits_sum somador (
      .a(a),
      .b(b),
      .s(soma_total)
  );

  always @(*) begin
    case (alu_control)

      4'b0000: out_resultado = a & b;
      4'b0001: out_resultado = a | b;
      4'b0010: out_resultado = soma_total[31:0];
      4'b0110: out_resultado = op_subtracao(a,b);
      4'b0111: out_resultado = a < b ? 32'd1: 32'd0;
      4'b1100: out_resultado = ~(a | b);
    endcase
  end



endmodule
