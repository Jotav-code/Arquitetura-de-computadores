module alu_32(
  input wire [31:0] a,
  input wire [31:0] b,
  input wire [3:0] alu_control,

  // Mudei para REG para poder atribuir dentro do always
  output reg [31:0] out_resultado,
  output reg zero,       // Mudei para reg para evitar latches fora de controle
  output reg carry_out,  // Mudei para reg
  output reg overflow    // Mudei para reg
);

  // 1. Fios internos separados para não dar curto-circuito
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

  // 3. Lógica de Seleção (Multiplexador)
  always @(*) begin
    carry_out = 1'b0;
    overflow = 1'b0;
    out_resultado = 32'd0;

    case (alu_control)
      // AND
      4'b0000: begin
        out_resultado = a & b;
      end

      // OR
      4'b0001: begin
        out_resultado = a | b;
      end

      // ADD
      4'b0010: begin
        out_resultado = soma_total;
        carry_out = cout_soma;     // Seleciona as flags da soma
        overflow = over_soma;
      end

      // SUB
      4'b0110: begin
        out_resultado = subtrator_total;
        carry_out = cout_sub;      // Seleciona as flags da subtração
        overflow = over_sub;
      end

      // Lógica: A < B é verdade se (ResultadoNegativo XOR Overflow) for 1
      4'b0111: begin
         // O bit 31 é o sinal (1 = negativo)
         if (subtrator_total[31] ^ over_sub) 
             out_resultado = 32'd1;
         else 
             out_resultado = 32'd0;
             
         // Opcional: manter as flags da subtração no SLT para debug
         carry_out = cout_sub;
         overflow = over_sub;
      end

      // NOR
      4'b1100: begin
        out_resultado = ~(a | b);
      end

      default: out_resultado = 32'd0;
    endcase
    
    // Atualiza flag Zero baseado no resultado final escolhido
    zero = (out_resultado == 32'd0);
  end

endmodule