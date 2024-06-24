/**
 * @ Author: PaysonS
 * @ Github: https://github.com/PaysonS
 * @ Create Time: 2023-12-02 12:59:56
 * @ Modified by: PaysonS
 * @ Modified time: 2024-06-23 18:23:55
 * @ Description: Module to check for full board in TicTacToe
 */
module board_full (
    input logic clk,
    input logic [1:0] board1,
    input logic [1:0] board2,
    input logic [1:0] board3,
    input logic [1:0] board4,
    input logic [1:0] board5,
    input logic [1:0] board6,
    input logic [1:0] board7,
    input logic [1:0] board8,
    input logic [1:0] board9,
    input logic [1:0] board10,
    input logic [1:0] board11,
    input logic [1:0] board12,
    input logic [1:0] board13,
    input logic [1:0] board14,
    input logic [1:0] board15,
    input logic [1:0] board16,
    input logic [1:0] board17,
    input logic [1:0] board18,
    input logic [1:0] board19,
    input logic [1:0] board20,
    input logic [1:0] board21,
    input logic [1:0] board22,
    input logic [1:0] board23,
    input logic [1:0] board24,
    input logic [1:0] board25,
    output logic is_full
);

  //this checks each bit if its either x or o and if all are filled then its full else if one not filled then its all not filled
  always @(posedge clk) begin
    if(board1 == 1 && board2 == 1 && board3 == 1 && board4 == 1 && board5 == 1 && board6 == 1 && board7 == 1 && board8 == 1 && board9 == 1 && board10 == 1 && board11 == 1 && board12 == 1 && board13 == 1 && board14 == 1 && board15 == 1 && board16 == 1 && board17 == 1 && board18 == 1 && board19 == 1 && board20 == 1 && board21 == 1 && board22 == 1 && board23 == 1 && board24 == 1 && board25 == 1)
      is_full <= 1;
    else
      is_full <= 0;
    // assign is_full = (board1 == 1 && board2 == 1 && board3 == 1 && board4 == 1 && board5 == 1 && board6 == 1 && board7 == 1 && board8 == 1 && board9 == 1 && board10 == 1 && board11 == 1 && board12 == 1 && board13 == 1 && board14 == 1 && board15 == 1 && board16 == 1 && board17 == 1 && board18 == 1 && board19 == 1 && board20 == 1 && board21 == 1 && board22 == 1 && board23 == 1 && board24 == 1 && board25 == 1) ? 1 : 0;
  end
endmodule
