/**
 * @ Author: PaysonS
 * @ Github: https://github.com/PaysonS
 * @ Create Time: 2023-12-02 12:59:56
 * @ Modified by: PaysonS
 * @ Modified time: 2024-06-23 18:21:37
 * @ Description: Module to check for win conditions in TicTacToe
 */
module win_declarer (
    input logic [1:0] board1,
    board2,
    board3,
    board4,
    board5,
    board6,
    board7,
    board8,
    board9,
    board10,
    board11,
    board12,
    board13,
    board14,
    board15,
    board16,
    board17,
    board18,
    board19,
    board20,
    board21,
    board22,
    board23,
    board24,
    board25,
    output logic playerwin,
    player2win
);



  always @(*) begin  //this checks for win condition on rows
    if ((board1[1] == 1 && board2[1] == 1 && board3[1] == 1) || (board2[1] == 1 && board3[1] == 1 && board4[1] == 1) || (board3[1] == 1 && board4[1] == 1 && board5[1] == 1)) begin
      playerwin  = 0;
      player2win = 1;
    end
    if ((board6[1] == 1 && board7[1] == 1 && board8[1] == 1) || (board7[1] == 1 && board8[1] == 1 && board9[1] == 1) || (board8[1] == 1 && board9[1] == 1 && board10[1] == 1)) begin
      playerwin  = 0;
      player2win = 1;
    end
    if ((board11[1] == 1 && board12[1] == 1 && board13[1] == 1) || (board12[1] == 1 && board13[1] == 1 && board14[1] == 1) || (board13[1] == 1 && board14[1] == 1 && board15[1] == 1)) begin
      playerwin  = 0;
      player2win = 1;
    end
    if ((board16[1] == 1 && board17[1] == 1 && board18[1] == 1) || (board17[1] == 1 && board18[1] == 1 && board19[1] == 1) || (board18[1] == 1 && board19[1] == 1 && board20[1] == 1)) begin
      playerwin  = 0;
      player2win = 1;
    end
    if ((board21[1] == 1 && board22[1] == 1 && board23[1] == 1) || (board22[1] == 1 && board23[1] == 1 && board24[1] == 1) || (board23[1] == 1 && board24[1] == 1 && board25[1] == 1)) begin
      playerwin  = 0;
      player2win = 1;
    end  // this checks column win condition for player 2
    if ((board1[1] == 1 && board6[1] == 1 && board11[1] == 1) || (board6[1] == 1 && board11[1] == 1 && board16[1] == 1) || (board11[1] == 1 && board16[1] == 1 && board21[1] == 1)) begin
      playerwin  = 0;
      player2win = 1;
    end
    if ((board2[1] == 1 && board7[1] == 1 && board12[1] == 1) || (board7[1] == 1 && board12[1] == 1 && board17[1] == 1) || (board12[1] == 1 && board17[1] == 1 && board22[1] == 1)) begin
      playerwin  = 0;
      player2win = 1;
    end
    if ((board3[1] == 1 && board8[1] == 1 && board13[1] == 1) || (board8[1] == 1 && board13[1] == 1 && board18[1] == 1) || (board13[1] == 1 && board18[1] == 1 && board23[1] == 1)) begin
      playerwin  = 0;
      player2win = 1;
    end
    if ((board4[1] == 1 && board9[1] == 1 && board14[1] == 1) || (board9[1] == 1 && board14[1] == 1 && board19[1] == 1) || (board14[1] == 1 && board19[1] == 1 && board24[1] == 1)) begin
      playerwin  = 0;
      player2win = 1;
    end
    if ((board5[1] == 1 && board10[1] == 1 && board15[1] == 1) || (board10[1] == 1 && board15[1] == 1 && board20[1] == 1) || (board15[1] == 1 && board20[1] == 1 && board25[1] == 1)) begin
      playerwin  = 0;
      player2win = 1;
    end  //insert diagonal win condition later on
    //this checks win conditions for player 1
    if ((board1[0] == 1 && board2[0] == 1 && board3[0] == 1) || (board2[0] == 1 && board3[0] == 1 && board4[0] == 1) || (board3[0] == 1 && board4[0] == 1 && board5[0] == 1)) begin
      playerwin  = 1;
      player2win = 0;
    end
    if ((board6[0] == 1 && board7[0] == 1 && board8[0] == 1) || (board7[0] == 1 && board8[0] == 1 && board9[0] == 1) || (board8[0] == 1 && board9[0] == 1 && board10[0] == 1)) begin
      playerwin  = 1;
      player2win = 0;
    end
    if ((board11[0] == 1 && board12[0] == 1 && board13[0] == 1) || (board12[0] == 1 && board13[0] == 1 && board14[0] == 1) || (board13[0] == 1 && board14[0] == 1 && board15[0] == 1)) begin
      playerwin  = 1;
      player2win = 0;
    end
    if ((board16[0] == 1 && board17[0] == 1 && board18[0] == 1) || (board17[0] == 1 && board18[0] == 1 && board19[0] == 1) || (board18[0] == 1 && board19[0] == 1 && board20[0] == 1)) begin
      playerwin  = 1;
      player2win = 0;
    end
    if ((board21[0] == 1 && board22[0] == 1 && board23[0] == 1) || (board22[0] == 1 && board23[0] == 1 && board24[0] == 1) || (board23[0] == 1 && board24[0] == 1 && board25[0] == 1)) begin
      playerwin  = 1;
      player2win = 0;
    end  // this checks column win condition for player 1
    if ((board1[0] == 1 && board6[0] == 1 && board11[0] == 1) || (board6[0] == 1 && board11[0] == 1 && board16[0] == 1) || (board11[0] == 1 && board16[0] == 1 && board21[0] == 1)) begin
      playerwin  = 1;
      player2win = 0;
    end
    if ((board2[0] == 1 && board7[0] == 1 && board12[0] == 1) || (board7[0] == 1 && board12[0] == 1 && board17[0] == 1) || (board12[0] == 1 && board17[0] == 1 && board22[0] == 1)) begin
      playerwin  = 1;
      player2win = 0;
    end
    if ((board3[0] == 1 && board8[0] == 1 && board13[0] == 1) || (board8[0] == 1 && board13[0] == 1 && board18[0] == 1) || (board13[0] == 1 && board18[0] == 1 && board23[0] == 1)) begin
      playerwin  = 1;
      player2win = 0;
    end
    if ((board4[0] == 1 && board9[0] == 1 && board14[0] == 1) || (board9[0] == 1 && board14[0] == 1 && board19[0] == 1) || (board14[0] == 1 && board19[0] == 1 && board24[0] == 1)) begin
      playerwin  = 1;
      player2win = 0;
    end
    if ((board5[0] == 1 && board10[0] == 1 && board15[0] == 1) || (board10[0] == 1 && board15[0] == 1 && board20[0] == 1) || (board15[0] == 1 && board20[0] == 1 && board25[0] == 1)) begin
      playerwin  = 1;
      player2win = 0;
    end
  end

endmodule  //a bug i had was the locations of begin and end which would cause the win checking to not operate properly

