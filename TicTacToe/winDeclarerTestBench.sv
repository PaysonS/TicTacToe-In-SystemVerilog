/**
 * @ Author: PaysonS
 * @ Github: https://github.com/PaysonS
 * @ Create Time: 2023-12-02 12:59:56
 * @ Modified by: PaysonS
 * @ Modified time: 2024-06-23 18:21:10
 * @ Description: Test bench for win condition checker
 */
module win_declarer_tb; 

  reg [1:0] board1, board2, board3, board4, board5, board6, board7, board8, board9, board10;
  reg [1:0]
      board11, board12, board13, board14, board15, board16, board17, board18, board19, board20;
  reg [1:0] board21, board22, board23, board24, board25;

  logic playerwin, player2win;

  win_declarer dut (
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
      .playerwin(playerwin),
      .player2win(player2win)
  );

  initial begin

    board5 = 2'd3;  //change to decimal 2 for player 2 to win// decimal 3 for player 1 to win
    #10;
    board10 = 2'd3;
    #20;
    board15 = 2'd3;
    // board2  = 2'b00;  //other board spots
    // board1  = 2'b00;

  end

  initial begin
    $monitor("playerwin=%b, player2win=%b", playerwin,
             player2win);  //prints in terminal who won for simplicity 
  end

endmodule