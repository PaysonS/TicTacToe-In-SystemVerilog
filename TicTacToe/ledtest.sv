/**
 * @ Author: PaysonS
 * @ Github: https://github.com/PaysonS
 * @ Create Time: 2023-12-02 12:59:56
 * @ Modified by: PaysonS
 * @ Modified time: 2024-06-23 18:22:23
 * @ Description: Module to test the LEDS pretty sure you dont use this
 */
module ledTest (
    input logic [1:0] board1,
    input logic [1:0] board2,
    input logic clk,
    input logic place,
    input logic player1,
    input logic player2,
    output logic led1,
    output logic led2,
    output logic led3,
    output logic led4,
    output logic led5,
    output logic led6,
    output logic led7
);
logic test, test2, test3, test4, test5, test6, test7;
  assign led1 = test;
  assign led2 = test2;
  assign led3 = test3;
  assign led4 = test4;
  assign led5 = test5;
  assign led6 = test6;
  assign led7 = test7;

  always @(posedge clk) begin
    if (board1 == 2'b01) begin
      test = 1;
    end else begin
      test = 0;
    end

    if(board1 == 2'b10) begin
      test5 = 1;
    end else begin
      test5 = 0;
    end

    if(board2 == 2'b01) begin
      test6 = 1;
    end else begin
      test6 = 0;
    end

    if(board2 == 2'b10) begin
      test7 = 1;
    end else begin
      test7 = 0;
    end




    if(place == 1) begin
      test2 = 1;
    end else begin
      test2 = 0;
    end

    if(player1 ==1) begin
      test3 = 1;
    end else begin
      test3 = 0;
    end
    if(player2 ==1) begin
      test4 = 1;
    end else begin
      test4 = 0;
    end
  end
endmodule
