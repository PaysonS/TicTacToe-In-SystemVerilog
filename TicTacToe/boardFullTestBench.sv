/**
 * @ Author: PaysonS
 * @ Github: https://github.com/PaysonS
 * @ Create Time: 2023-12-02 12:59:56
 * @ Modified by: PaysonS
 * @ Modified time: 2024-06-23 18:23:43
 * @ Description: Module to check for full board in TicTacToe
 */
module board_fullTestBench;
logic clk;
logic [1:0] board1;
logic [1:0] board2;
logic [1:0] board3;
logic [1:0] board4;
logic [1:0] board5;
logic [1:0] board6;
logic [1:0] board7;
logic [1:0] board8;
logic [1:0] board9;
logic [1:0] board10;
logic [1:0] board11;
logic [1:0] board12;
logic [1:0] board13;
logic [1:0] board14;
logic [1:0] board15;
logic [1:0] board16;
logic [1:0] board17;
logic [1:0] board18;
logic [1:0] board19;
logic [1:0] board20;
logic [1:0] board21;
logic [1:0] board22;
logic [1:0] board23;
logic [1:0] board24;
logic [1:0] board25;
logic is_full;

board_full dut (
    .clk(clk),
  .board1(board1),
  .board2(board2),
  .board3(board3),
  .board4(board4),
  .board5(board5),
  .board6(board6),
  .board7(board7),
  .board8(board8),
  .board9(board9),
  .board10(board10),
  .board11(board11),
  .board12(board12),
  .board13(board13),
  .board14(board14),
  .board15(board15),
  .board16(board16),
  .board17(board17),
  .board18(board18),
  .board19(board19),
  .board20(board20),
  .board21(board21),
  .board22(board22),
  .board23(board23),
  .board24(board24),
  .board25(board25),
  .is_full(is_full)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    board1 = 0;
    board2 = 0;
    board3 = 0;
    board4 = 0;
    board5 = 0;
    board6 = 0;
    board7 = 0;
    board8 = 0;
    board9 = 0;
    board10 = 0;
    board11 = 0;
    board12 = 0;
    board13 = 0;
    board14 = 0;
    board15 = 0;
    board16 = 0;
    board17 = 0;
    board18 = 0;
    board19 = 0;
    board20 = 0;
    board21 = 0;
    board22 = 0;
    board23 = 0;
    board24 = 0;
    board25 = 0;
    is_full = 0;
    #10;
    board1 = 1;
    board2 = 1;
    board3 = 1;
    board4 = 1;
    board5 = 1;
    board6 = 1;
    board7 = 1;
    board8 = 1;
    board9 = 1;
    board10 = 1;
    board11 = 1;
    board12 = 1;
    board13 = 1;
    board14 = 1;
    board15 = 1;
    board16 = 1;
    board17 = 1;
    board18 = 1;
    board19 = 1;
    board20 = 1;
    board21 = 1;
    board22 = 1;
    board23 = 1;
    #20;board24 = 1;
    board25 = 1;
end

endmodule