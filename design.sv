module mbs (
    input clock,
    input start, 
    input [7:0] multiplicando,
    input [7:0] multiplicador,
    output reg [15:0] produto
);

/* Estados: 
 * REPOUSO refere ao estado de repouso, na qual os registradores sao carregados
 * S<n <= 8> refere a enesima subida do clock, lidando com o bit menos significativo do multiplicando
*/
parameter [3:0] REPOUSO=4'b0000, S1=4'b0001, S2=4'b0010, S3=4'b0011, S4=4'b0100, S5=4'b0101, S6=4'b0110, S7=4'b0111, S8=4'b1000;

reg [3:0] estado_atual;
reg [7:0] registrador_a;
reg [15:0] registrador_b;

initial begin
    estado_atual <= REPOUSO;
    registrador_a <= 0;
    registrador_b <= 0;
    produto <= 0;
end

always @(estado_atual) begin
    /* se o estado atual eh diferente de REPOUSO, ele esta em algum S<numero>, que realiza sempre a mesma operacao
     * de verificar se o bit menos significativo eh 1 para realizar a soma, alem de realizar os devidos deslocamentos
    */
    if(estado_atual != REPOUSO) begin
        if(registrador_a[0]) begin
           	produto = produto + registrador_b;
        end
    
        registrador_a = registrador_a >> 1;
        registrador_b = registrador_b << 1;
    end
end

always @(posedge clock or posedge start)
begin
    if(start)begin
        // Reseta os valores guardados nos registradores
        estado_atual <= REPOUSO;
        registrador_a <= 0;
        registrador_b <= 0;
        produto <= 0;
    end
    else begin
        case(estado_atual)
            REPOUSO: begin 
              // Carrega os registradores com os valores de multiplicando e multiplicador
              registrador_a <= multiplicando;
        	  registrador_b <= multiplicador;
              estado_atual <= S1;
            end
            S1: estado_atual <= S2;
            S2: estado_atual <= S3;
            S3: estado_atual <= S4;
            S4: estado_atual <= S5;
            S5: estado_atual <= S6;
            S6: estado_atual <= S7;
            S7: estado_atual <= S8;
            S8: estado_atual <= REPOUSO;
        endcase
    end 
end 

endmodule