module tb_alu_32;
  reg [31:0] a, b;
  reg [3:0] alu_control;
  wire [31:0] out_resultado;
  wire zero, carry_out, overflow;

  // Instancia a ALU
  alu_32 uut(
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
    a = 32'hFFFF0000; b = 32'h0F0F0F0F; alu_control = 4'b0000; #10;
    $display("AND: a=%h b=%h out=%h zero=%b carry=%b overflow=%b", a, b, out_resultado, zero, carry_out, overflow);

    // Teste OR
    alu_control = 4'b0001; #10;
    $display("OR: a=%h b=%h out=%h zero=%b carry=%b overflow=%b", a, b, out_resultado, zero, carry_out, overflow);

    // Teste SUB
a = 32'd200; b = 32'd150; alu_control = 4'b0110; #10;
$display("SUB: a=%d b=%d out=%d zero=%b carry=%b overflow=%b", a, b, out_resultado, zero, carry_out, overflow);

a = 32'd50; b = 32'd100; alu_control = 4'b0110; #10;
$display("SUB: a=%d b=%d out=%d zero=%b carry=%b overflow=%b", a, b, out_resultado, zero, carry_out, overflow);


    // Teste ADD
    a = 32'd100; b = 32'd50; alu_control = 4'b0010; #10;
    $display("ADD: a=%d b=%d out=%d zero=%b carry=%b overflow=%b", a, b, out_resultado, zero, carry_out, overflow);

    // Teste SLT
    a = 32'd30; b = 32'd50; alu_control = 4'b0111; #10;
    $display("SLT: a=%d b=%d out=%d zero=%b carry=%b overflow=%b", a, b, out_resultado, zero, carry_out, overflow);

    // Teste NOR
    a = 32'hAAAA5555; b = 32'h5555AAAA; alu_control = 4'b1100; #10;
    $display("NOR: a=%h b=%h out=%h zero=%b carry=%b overflow=%b", a, b, out_resultado, zero, carry_out, overflow);

    $stop;
  end
endmodule
