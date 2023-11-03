//Para facilitar a visualização e legibilidade, foi criada uma macro
`define A 3
`define B 2
`define C 1
`define D 0

//Cada coluna da saída foi transformada em uma função na forma SoP
//R2 é função que corresponde ao bit mais significativo
//R1 será o bit do meio
//R0 será para o bit menos significativo

module r2_calculate (
  input [3:0] input_data,
    output reg R2
);
    always @ (*) begin
      // R2 = BC´ +  A´BD´+ AB´CD
      R2 = (input_data[`B] & ~input_data[`C]) //BC
      | (~input_data[`A] & input_data[`B] & ~input_data[`D]) //A`BD`
      | (input_data[`A] & ~input_data[`B] & input_data[`C] & input_data[`D]); //AB`CD
    end

endmodule

module r1_calculate (
   input [3:0] input_data,
    output reg R1
);
    always @ (*) begin
      //R1 = AC`D + B`CD` + A`CD` + `AB`C
      R1 = (input_data[`A] & ~input_data[`C] & input_data[`D]) //AC`D
      | (~input_data[`B] & input_data[`C] & ~input_data[`D]) //B`CD`
      | (~input_data[`A] & input_data[`C] & ~input_data[`D]) //A`CD`
      | (~input_data[`A] & ~input_data[`B] & input_data[`C]); //A`B`C
    end

endmodule

module r0_calculate (
  input [3:0] input_data,
    output reg R0
);
    always @ (*) begin
      //R0 = AC`D` + A`C`D + A`B`D + AB`D` + ABCD
      R0 = (input_data[`A] & ~input_data[`C] & ~input_data[`D]) //AC`D`
      | (~input_data[`A] & ~input_data[`C] & input_data[`D]) //A`C`D
      | (~input_data[`A] & ~input_data[`B] & input_data[`D]) //A`B`D
      | (input_data[`A] & ~input_data[`B] & ~input_data[`D]) //AB`D`
      | (input_data[`A] & input_data[`B] & input_data[`C] & input_data[`D]); //ABCD
    end

endmodule
