/**
 * @ Author: PaysonS
 * @ Github: https://github.com/PaysonS
 * @ Create Time: 2023-12-02 12:59:56
 * @ Modified by: PaysonS
 * @ Modified time: 2024-06-23 18:24:48
 * @ Description: Changes bit for each spot player places their piece
 */
module boardy (
    input logic clk,
    rst,
    clr,
    select_player,
    player2Select,
    enable_player,
    player2Enable,
    input logic [17:0] playerLocation,
    input logic  place,
    output logic [1:0] board1,
    output logic [1:0]board2,
    output logic [1:0]board3,
    output logic [1:0]board4,
    output logic [1:0]board5,
    output logic [1:0]board6,
    output logic [1:0]board7,
    output logic [1:0]board8,
    output logic [1:0]board9,
    output logic [1:0]board10,
    output logic [1:0]board11,
    output logic [1:0]board12,
    output logic [1:0]board13,
    output logic [1:0]board14,
    output logic [1:0]board15,
    output logic [1:0]board16,
    output logic [1:0]board17,
    output logic [1:0]board18,
    output logic [1:0]board19,
    output logic [1:0]board20,
    output logic [1:0]board21,
    output logic [1:0]board22,
    output logic [1:0]board23,
    output logic [1:0]board24,
    output logic [1:0]board25,
    player_done,
    player2Done
);


  // player_done = 0;
  // player2Done = 1;
  // output reg [4:0] turns = 0;  //turns go up to 25 but 2^5 = 18 so 5 bits
  always @(posedge clk) begin
    if (clr) begin  //initializes a board i could make this a for loop for optimization
      board1  = 2'b00;
      board2  = 2'b00;
      board3  = 2'b00;
      board4  = 2'b00;
      board5  = 2'b00;
      board6  = 2'b00;
      board7  = 2'b00;
      board8  = 2'b00;
      board9  = 2'b00;
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
      // turns = 0;
      player_done = 0;
      player2Done = 1;

    end else begin //this is checking the spot on the board and if its empty then it will place the player or player2 piece
      if(playerLocation == 17'd1 && select_player == 1 && enable_player == 1 && board1 == 2'b0 && place == 1)begin
        board1 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd2 && select_player == 1 && enable_player == 1 && board2 == 2'b0 && place == 1) begin
        board2 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd3 && select_player == 1 && enable_player == 1 && board3 == 2'b0 && place == 1) begin
        board3 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd4 && select_player == 1 && enable_player == 1 && board4 == 2'b0 && place == 1) begin
        board4 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd5 && select_player == 1 && enable_player == 1 && board5 == 2'b0 && place == 1) begin
        board5 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd6 && select_player == 1 && enable_player == 1 && board6 == 2'b0 && place == 1) begin
        board6 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd7 && select_player == 1 && enable_player == 1 && board7 == 2'b0 && place == 1) begin
        board7 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd8 && select_player == 1 && enable_player == 1 && board8 == 2'b0 && place == 1) begin
        board8 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd9 && select_player == 1 && enable_player == 1 && board9 == 2'b0 && place == 1) begin
        board9 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd10 && select_player == 1 && enable_player == 1 && board10 == 2'b0 && place == 1) begin 
        board10 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd11 && select_player == 1 && enable_player == 1 && board11 == 2'b00 && place == 1)begin
        board11 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd12 && select_player == 1 && enable_player == 1 && board12 == 2'b00 && place == 1) begin
        board12 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd13 && select_player == 1 && enable_player == 1 && board13 == 2'b00 && place == 1) begin
        board13 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd14 && select_player == 1 && enable_player == 1 && board14 == 2'b00 && place == 1) begin
        board14 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd15 && select_player == 1 && enable_player == 1 && board15 == 2'b00 && place == 1) begin
        board15 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd16 && select_player == 1 && enable_player == 1 && board16 == 2'b00 && place == 1) begin
        board16 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd17 && select_player == 1 && enable_player == 1 && board17 == 2'b00 && place == 1) begin
        board17 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd18 && select_player == 1 && enable_player == 1 && board18 == 2'b00 && place == 1) begin
        board18 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd19 && select_player == 1 && enable_player == 1 && board19 == 2'b00 && place == 1) begin
        board19 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd20 && select_player == 1 && enable_player == 1 && board20 == 2'b00 && place == 1) begin
        board20 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd21 && select_player == 1 && enable_player == 1 && board21 == 2'b00 && place == 1) begin
        board21 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd22 && select_player == 1 && enable_player == 1 && board22 == 2'b00 && place == 1) begin
        board22 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd23 && select_player == 1 && enable_player == 1 && board23 == 2'b00 && place == 1) begin
        board23 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd24 && select_player == 1 && enable_player == 1 && board24 == 2'b00 && place == 1) begin
        board24 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if (playerLocation == 17'd25 && select_player == 1 && enable_player == 1 && board25 == 2'b00 && place == 1) begin
        board25 = 2'b01;
        player_done = 1;
        player2Done = 0;
      end
      else if(playerLocation == 17'd1 && player2Select == 1 && player2Enable == 1 && board1 == 2'b00 && place == 1)  begin
        board1 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd2 && player2Select == 1 && player2Enable == 1 && board2 == 2'b00 && place == 1) begin 
        board2 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd3 && player2Select == 1 && player2Enable == 1 && board3 == 2'b00 && place == 1) begin 
        board3 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd4 && player2Select == 1 && player2Enable == 1 && board4 == 2'b00 && place == 1) begin 
        board4 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd5 && player2Select == 1 && player2Enable == 1 && board5 == 2'b00 && place == 1) begin 
        board5 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd6 && player2Select == 1 && player2Enable == 1 && board6 == 2'b00 && place == 1) begin 
        board6 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd7 && player2Select == 1 && player2Enable == 1 && board7 == 2'b00 && place == 1) begin 
        board7 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd8 && player2Select == 1 && player2Enable == 1 && board8 == 2'b00 && place == 1) begin 
        board8 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd9 && player2Select == 1 && player2Enable == 1 && board9 == 2'b00 && place == 1) begin 
        board9 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd10 && player2Select == 1 && player2Enable == 1 && board10 == 2'b00 && place == 1) begin 
        board10 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd11 && player2Select == 1 && player2Enable == 1 && board11 == 2'b00 && place == 1) begin 
        board11 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd12 && player2Select == 1 && player2Enable == 1 && board12 == 2'b00 && place == 1) begin 
        board12 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd13 && player2Select == 1 && player2Enable == 1 && board13 == 2'b00 && place == 1) begin 
        board13 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd14 && player2Select == 1 && player2Enable == 1 && board14 == 2'b00 && place == 1) begin 
        board14 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd15 && player2Select == 1 && player2Enable == 1 && board15 == 2'b00 && place == 1) begin 
        board15 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd16 && player2Select == 1 && player2Enable == 1 && board16 == 2'b00 && place == 1) begin 
        board16 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd17 && player2Select == 1 && player2Enable == 1 && board17 == 2'b00 && place == 1) begin 
        board17 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd18 && player2Select == 1 && player2Enable == 1 && board18 == 2'b00 && place == 1) begin 
        board18 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd19 && player2Select == 1 && player2Enable == 1 && board19 == 2'b00 && place == 1) begin 
        board19 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd20 && player2Select == 1 && player2Enable == 1 && board20 == 2'b00 && place == 1) begin 
        board20 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd21 && player2Select == 1 && player2Enable == 1 && board21 == 2'b00 && place == 1) begin 
        board21 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd22 && player2Select == 1 && player2Enable == 1 && board22 == 2'b00 && place == 1) begin 
        board22 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd23 && player2Select == 1 && player2Enable == 1 && board23 == 2'b00 && place == 1) begin 
        board23 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd24 && player2Select == 1 && player2Enable == 1 && board24 == 2'b00 && place == 1) begin 
        board24 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
      else if(playerLocation == 17'd25 && player2Select == 1 && player2Enable == 1 && board25 == 2'b00 && place == 1) begin 
        board25 = 2'b10;
        player_done = 0;
        player2Done = 1;
      end
    else begin 
      board1  = board1;
        board2  = board2;
        board3  = board3;
        board4  = board4;
        board5  = board5;
        board6  = board6;
        board7  = board7;
        board8  = board8;
        board9  = board9;
        board10 = board10;
        board11 = board11;
        board12 = board12;
        board13 = board13;
        board14 = board14;
        board15 = board15;
        board16 = board16;
        board17 = board17;
        board18 = board18;
        board19 = board19;
        board20 = board20;
        board21 = board21;
        board22 = board22;
        board23 = board23;
        board24 = board24;
        board25 = board25;
    end
  end
  end
endmodule
