module mbs_teste;
    reg clock;
    reg start;
    wire [7:0] multiplicando;
    wire [7:0] multiplicador;
    wire [15:0] produto;

    mbs mult(.clock(clock), .start(start), .multiplicando(multiplicando), .multiplicador(multiplicador), .produto(produto));

    always #10 clock = ~clock;
  
    assign multiplicando = 120;
    assign multiplicador = 96;

    initial begin
        $dumpfile("dump.vcd"); $dumpvars;

        clock = 1;
        start = 1;

        #10 start = 0;

        $display("A = 120, B = 96","\n");
	    $display("ESTADO = ", mult.estado_atual, " A = ", mult.registrador_a, ", B = ", mult.registrador_b, ", P = ", mult.produto);
	    #20 $display("ESTADO = ", mult.estado_atual, " A = ", mult.registrador_a, ", B = ", mult.registrador_b, ", P = ", mult.produto);
	    #20 $display("ESTADO = ", mult.estado_atual, " A = ", mult.registrador_a, ", B = ", mult.registrador_b, ", P = ", mult.produto);
	    #20 $display("ESTADO = ", mult.estado_atual, " A = ", mult.registrador_a, ", B = ", mult.registrador_b, ", P = ", mult.produto);
      	#20 $display("ESTADO = ", mult.estado_atual, " A = ", mult.registrador_a, ", B = ", mult.registrador_b, ", P = ", mult.produto);
	    #20 $display("ESTADO = ", mult.estado_atual, " A = ", mult.registrador_a, ", B = ", mult.registrador_b, ", P = ", mult.produto);
	    #20 $display("ESTADO = ", mult.estado_atual, " A = ", mult.registrador_a, ", B = ", mult.registrador_b, ", P = ", mult.produto);
      	#20 $display("ESTADO = ", mult.estado_atual, " A = ", mult.registrador_a, ", B = ", mult.registrador_b, ", P = ", mult.produto);
	    #20 $display("ESTADO = ", mult.estado_atual, " A = ", mult.registrador_a, ", B = ", mult.registrador_b, ", P = ", mult.produto);

        #200 $finish;
    end
endmodule
