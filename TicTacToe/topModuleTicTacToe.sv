/**
 * @ Author: PaysonS
 * @ Github: https://github.com/PaysonS
 * @ Create Time: 2023-12-02 12:59:56
 * @ Modified by: PaysonS
 * @ Modified time: 2024-06-23 18:21:04
 * @ Description: Top module for TicTacToe Includes all modules this is the one you will run
 
 */


module top_module (
    
    input logic [17:0] SW,
    input logic [3:0] KEY,
    input logic CLOCK_50,
    output logic VGA_CLK,
    output logic VGA_HS,
    output logic VGA_VS,
    output logic VGA_SYNC_N,
    output logic VGA_BLANK_N,
    output logic [7:0] VGA_R,
    output logic [7:0] VGA_G,
    output logic [7:0] VGA_B,
    output logic [17:0] LEDR
);
 

  logic clk;
  logic rst;
  logic clr;
  logic select_player;
  logic player2Select;
  logic enable_player;
  logic player2Enable;
  logic [17:0] playerLocation;
  logic place;
  logic is_full;
  reg [1:0] board1;
  reg [1:0] board2;
  reg [1:0] board3;
  reg [1:0] board4;
  reg [1:0] board5;
  reg [1:0] board6;
  reg [1:0] board7;
  reg [1:0] board8;
  reg [1:0] board9;
  reg [1:0] board10;
  reg [1:0] board11;
  reg [1:0] board12;
  reg [1:0] board13;
  reg [1:0] board14;
  reg [1:0] board15;
  reg [1:0] board16;
  reg [1:0] board17;
  reg [1:0] board18;
  reg [1:0] board19;
  reg [1:0] board20;
  reg [1:0] board21;
  reg [1:0] board22;
  reg [1:0] board23;
  reg [1:0] board24;
  reg [1:0] board25;
  logic [3:0] state;
  logic player_done;
  logic player2Done;
  logic player_win;
  logic player2win;

   //assign playerLocation = SW[17:0];
  //  assign place = KEY[0:0];

   //USE THIS ONLY FOR TESTING NOT FOR PRODUCTION
  always begin
    #5 clk = ~clk;
  end

  initial begin
     clk = 0;
    rst = 0;
    clr = 0;
    select_player = 0;
    player2Select = 0;
    enable_player = 0;
    player2Enable = 0;
    // playerLocation = 18'b000000000000000000;
    // place = 0;
    is_full = 0;
    board1 = 2'b00;
    board2 = 2'b00;
    board3 = 2'b00;
    board4 = 2'b00;
    board5 = 2'b00;
    board6 = 2'b00;
    board7 = 2'b00;
    board8 = 2'b00;
    board9 = 2'b00;
    board10 = 2'b00;
    board11 = 2'b00;
    board12 = 2'b00;
    board13 = 2'b00;
    board14 = 2'b00;
    board15 = 2'b00;
    board16 = 2'b00;
    board17 = 2'b00;
    board18 = 2'b00;
    board19 = 2'b00;
    board20 = 2'b00;
    board21 = 2'b00;
    board22 = 2'b00;
    board23 = 2'b00;
    board24 = 2'b00;
    board25 = 2'b00;
    state = 4'b0000;
    player_done = 0;
    player2Done = 0;
    player_win = 0;
    player2win = 0;

  end

  //key1 is reset
  //key1 is clear
  //key0 is place
  //sw17->0 is location
  boardy board (
      clk,
      KEY[1],  //reset
      clr,
      select_player,
      player2Select,
      enable_player,
      player2Enable,
      SW[17:0],  //location
      KEY[0:0],  //plAce
      board1,
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
      player_done,
      player2Done
  );
  board_full board_full (
      board1,
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
      is_full
  );


  vga vga (
      CLOCK_50,
      KEY[1],
      VGA_CLK,
      VGA_HS,
      VGA_VS,
      VGA_SYNC_N,
      VGA_BLANK_N,
      VGA_R,
      VGA_G,
      VGA_B,
      is_full,
      player_win,
      player2win,
      board1,
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
      KEY[0:0]
  );

  controller controller (
      clk,
      KEY[1],
      is_full,
      player_win,
      player2win,
      KEY[0:0],
      player2Enable,
      enable_player,
      select_player,
      player2Select,
      state,
      clr,
      player_done,
      player2Done,
      KEY[3]
  );

  win_declarer win_declarer (
      board1,
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
      player_win,
      player2win
  );

ledTest ledTest(
  board1,
  board2,
  CLOCK_50,
  KEY[0:0],
  enable_player,
  player2Enable,
  LEDR[1],
  LEDR[2],
  LEDR[3],
  LEDR[4],
  LEDR[5],
  LEDR[16],
  LEDR[17]
);



endmodule
