module tb_alu_32;
  reg [31:0] a;
  reg [31:0] b;
  reg [3:0] alu_control;
  wire [31:0] out_resultado;
  wire zero;
  wire carry_out;
  wire overflow;

  // Instancia a ALU
  alu_32 uut (
      .a(a),
      .b(b),
      .alu_control(alu_control),
      .out_resultado(out_resultado),
      .zero(zero),
      .carry_out(carry_out),
      .overflow(overflow)
  );

  initial begin
    // Teste AND
    a = 32'hFFFF0000; b = 32'h0F0F0F0F; alu_control = 4'b0000;
    #10; // espera 10ns

    // Teste OR
    alu_control = 4'b0001;
    #10;

    // Teste ADD
    a = 32'd100; b = 32'd50; alu_control = 4'b0010;
    #10;

    // Teste SUB (precisa ter instanciado o subtrator)
    a = 32'd200; b = 32'd150; alu_control = 4'b0110;
    #10;

    // Teste SLT
    a = 32'd30; b = 32'd50; alu_control = 4'b0111;
    #10;

    // Teste NOR
    a = 32'hAAAA5555; b = 32'h5555AAAA; alu_control = 4'b1100;
    #10;

    $stop; // pausa a simulação
  end
endmodule
