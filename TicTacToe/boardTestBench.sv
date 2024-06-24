/**
 * @ Author: PaysonS
 * @ Github: https://github.com/PaysonS
 * @ Create Time: 2023-12-02 12:59:56
 * @ Modified by: PaysonS
 * @ Modified time: 2024-06-23 18:23:48
 * @ Description: Testbench for the board module
 */
module board_tb;
  // Inputs
  logic clk;
  logic rst;
  logic clr;
  logic select_player;
  logic player2Select;
  logic enable_player;
  logic player2Enable;
  logic [17:0] playerLocation;
  logic place;

  // Outputs
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
  logic player_done;
  logic player2Done;
  logic [4:0] turns;

  // Instantiate the DUT
  board dut (
      .clk(clk),
      .rst(rst),
      .clr(clr),
      .select_player(select_player),
      .player2Select(player2Select),
      .enable_player(enable_player),
      .player2Enable(player2Enable),
      .playerLocation(playerLocation),
      .place(place),
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
      .player_done(player_done),
      .player2Done(player2Done)

  );

  // Clock generation
  always #5 clk = ~clk;
  always #10 place = ~place;

  // Initialize inputs
  initial begin
    clk = 0;
    rst = 0;
    clr = 1;
    select_player = 0;
    player2Select = 0;
    enable_player = 0;
    player2Enable = 0;
    select_player = 0;
    player2Select = 0;
    playerLocation = 0;
    place = 0;
    player_done = 0;
    player2Done = 1;
   #10;
    clr = 0;
  end
  // Add your test cases here
  initial begin
    #10;
    select_player  = 1'b1;
    player2Select  = 1'b0;
    enable_player  = 1'b1;
    player2Enable  = 1'b0;
    playerLocation = 32'd2;
    // #10;
    // place = 1'b1;
    // #10;
    // place = 1'b0;
    #30;
    select_player  = 1'b0;
    player2Select  = 1'b1;
    enable_player  = 1'b0;
    player2Enable  = 1'b1;
    playerLocation = 32'd1;
    // #10;
    // place = 1'b1;
    // #10;
    // place = 1'b0;\
    #30;
    select_player  = 1'b1;
    player2Select  = 1'b0;
    enable_player  = 1'b1;
    player2Enable  = 1'b0;
    playerLocation = 32'd3;

    #30;
    select_player  = 1'b0;
    player2Select  = 1'b1;
    enable_player  = 1'b0;
    player2Enable  = 1'b1;
    playerLocation = 32'd4;

    #50;
    clr = 1'b1;
    #10;
    clr = 1'b0;
  end


endmodule
