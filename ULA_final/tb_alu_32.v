`timescale 1ns/1ps

module alu_32_tb_advanced;

  reg  signed [31:0] a, b;
  reg  [3:0]  alu_control;
  wire [31:0] out_resultado;
  wire        zero;
  wire        carry_out;
  wire        overflow;

  integer tests_total   = 0;
  integer tests_passed  = 0;
  integer tests_failed  = 0;
  integer i;

  localparam OP_AND = 4'b0000;
  localparam OP_OR  = 4'b0001;
  localparam OP_ADD = 4'b0010;
  localparam OP_SUB = 4'b0110;
  localparam OP_SLT = 4'b0111;
  localparam OP_NOR = 4'b1100;

  alu_32 dut (
    .a(a),
    .b(b),
    .alu_control(alu_control),
    .out_resultado(out_resultado),
    .zero(zero),
    .carry_out(carry_out),
    .overflow(overflow)
  );

  initial begin
    $dumpfile("alu_32_tb.vcd");
    $dumpvars(0, alu_32_tb_advanced);
  end

  task automatic verify_alu;
    input [31:0] in_a;
    input [31:0] in_b;
    input [3:0]  in_ctrl;
    input [255:0] nome;

    reg [31:0] exp_res;
    reg exp_z, exp_c, exp_v;
    reg [32:0] wide_calc;

    begin
      a = in_a; b = in_b; alu_control = in_ctrl;
      #5;

      exp_res = 0; exp_c = 0; exp_v = 0;
      case (in_ctrl)
        OP_AND: exp_res = in_a & in_b;
        OP_OR:  exp_res = in_a | in_b;
        OP_NOR: exp_res = ~(in_a | in_b);
        OP_ADD: begin
          wide_calc = {1'b0, in_a} + {1'b0, in_b};
          exp_res = wide_calc[31:0];
          exp_c   = wide_calc[32];
          exp_v   = (in_a[31] == in_b[31]) && (exp_res[31] != in_a[31]);
        end
        OP_SUB: begin
          wide_calc = {1'b0, in_a} + {1'b0, ~in_b} + 33'b1;
          exp_res = wide_calc[31:0];
          exp_c   = wide_calc[32];
          exp_v   = (in_a[31] != in_b[31]) && (exp_res[31] != in_a[31]);
        end
        OP_SLT: exp_res = ($signed(in_a) < $signed(in_b)) ? 32'd1 : 32'd0;
      endcase
      exp_z = (exp_res == 0);

      tests_total = tests_total + 1;

      if (out_resultado !== exp_res || zero !== exp_z || 
         ((in_ctrl == OP_ADD || in_ctrl == OP_SUB) && (carry_out !== exp_c || overflow !== exp_v))) begin
        
        tests_failed = tests_failed + 1;
        $display(">>> ERRORR (%s): A=%h B=%h Op=%b", nome, in_a, in_b, in_ctrl);
        $display("    Esperado: Res=%h Z=%b C=%b V=%b", exp_res, exp_z, exp_c, exp_v);
        $display("    Obtido:   Res=%h Z=%b C=%b V=%b", out_resultado, zero, carry_out, overflow);
      
      end else begin
        tests_passed = tests_passed + 1;
        // AGORA VAI IMPRIMIR TUDO SEM FILTRO
        $display("OK (%s): A=%h B=%h -> Res=%h | Flags: Z=%b C=%b V=%b", 
                 nome, in_a, in_b, out_resultado, zero, carry_out, overflow);
      end
    end
  endtask

  initial begin
    $display("\n=== Meus testes ===\n");

    verify_alu(32'd5,  32'd3,  OP_ADD, "ADD Simples");
    verify_alu(32'd20, 32'd30, OP_SUB, "SUB Neg");
    verify_alu(32'hFFFFFFFF, 32'd1, OP_ADD, "ADD Carry");
    verify_alu(32'h7FFFFFFF, 32'd1, OP_ADD, "ADD Overflow");
    verify_alu(-32'd10, 32'd5, OP_SLT, "SLT Neg < Pos");

    $display("\n--- Iniciando 1000 Testes Aleatorios de SOMA ---");
    for (i=0; i<1000; i=i+1) verify_alu($random, $random, OP_ADD, "Rand ADD");

    $display("\n--- Iniciando 1000 Testes Aleatorios de SUBTRACAO ---");
    for (i=0; i<1000; i=i+1) verify_alu($random, $random, OP_SUB, "Rand SUB");

    $display("\n--- Iniciando 1500 Testes de LOGICA ---");
    for (i=0; i<500; i=i+1) verify_alu($random, $random, OP_AND, "Rand AND");
    for (i=0; i<500; i=i+1) verify_alu($random, $random, OP_OR,  "Rand OR");
    for (i=0; i<500; i=i+1) verify_alu($random, $random, OP_NOR, "Rand NOR");

    $display("\n--- Iniciando 1000 Testes de SLT ---");
    for (i=0; i<1000; i=i+1) verify_alu($random, $random, OP_SLT, "Rand SLT");

    $display("\n=======================================");
    $display("RESULTADO FINAL: %0d Passaram | %0d Falharam", tests_passed, tests_failed);
    $display("Total de testes executados: %0d", tests_total);
    $display("=======================================\n");
    $finish;
  end
endmodule