/**
 * @ Author: PaysonS
 * @ Github: https://github.com/PaysonS
 * @ Create Time: 2023-12-02 12:59:56
 * @ Modified by: PaysonS
 * @ Modified time: 2024-06-23 18:23:10
 * @ Description:
 */
 
//this is our FSM
module controller (
    input logic clk,
    rst,
    full,
    player_win,
    player2win,
    place,
    output logic player2InputEn,
    output logic player_input_en,
    output logic select_player,
    output logic player2Select,
    output logic [3:0] state,
    output logic clr,
    input logic player_done,
    input logic player2Done,
    input logic starter
);
  parameter idle = 2'b00;
  parameter player = 2'b01;
  parameter player2 = 2'b10;
  parameter endgame = 2'b11;



  reg [1:0] cur_state, nxt_state;

  // initial begin
  //   cur_state = idle;
    
  // end

//the working on in sim but not fpga
  always @(posedge rst or negedge rst or negedge place) begin
    if (rst) begin
      cur_state = idle;  //initial state
    end else begin
       cur_state = nxt_state;  //next state
    end
  end

//   initial begin
//     cur_state = idle;
//  end//initial state

 
//   always@(posedge starter) begin
//     cur_state = idle;
//  end

  //  always @(posedge rst or negedge place) begin
  //   if (rst) begin
  //     cur_state = idle;
  //     #10; cur_state = player;  //initial state
  //   end  begin
  //      cur_state = nxt_state;  //next state
  //   end
  // end


  

always@(posedge rst or negedge place or posedge starter)begin
  if(starter) begin 
    cur_state = idle;
  end
  else begin
  cur_state = nxt_state;
  end
end


  always @(posedge clk) begin
    if (cur_state == idle) begin
      state = 4'b0001;
      nxt_state = player;
      player2InputEn = 0;
      player_input_en = 0;
      clr = 1;
    end
    if (cur_state == player) begin
      clr = 0;
      state = 4'b0010;
      player2InputEn = 0;
      player_input_en = 1;
      select_player = 1;
      player2Select = 0;
      if (full == 1 || player_win == 1 || player2win == 1) begin
        nxt_state = endgame;
      end
      if (player_done == 1 && full == 0 && player_win == 0 && player2win == 0) begin
        nxt_state = player2;
      end
      if (player_done == 0 && full == 0 && player_win == 0 && player2win == 0) begin
        nxt_state = player;
      end

    end
    if (cur_state == player2) begin
      clr = 0;
      state = 4'b0100;
      player2InputEn = 1;
      player_input_en = 0;
      select_player = 0;
      player2Select = 1;
      if (full == 1 || player_win == 1 || player2win == 1) begin
        nxt_state = endgame;
      end
      if (player2Done == 1 && full == 0 && player_win == 0 && player2win == 0) begin
        nxt_state = player;
      end
      if (player2Done == 0 && full == 0 && player_win == 0 && player2win == 0) begin
        nxt_state = player2;
      end
    end
    if (cur_state == endgame) begin
      clr = 0;
      state = 4'b1000;
      player2InputEn = 0;
      player_input_en = 0;
    end
   
  end
endmodule


module controllerV2 ( input logic clk,
    rst,
    full,
    player_win,
    player2win,
    place,
    output logic player2InputEn,
    output logic player_input_en,
    output logic select_player,
    output logic player2Select,
    output logic [3:0] state,
    output logic clr,
    input logic player_done,
    input logic player2Done,
    input logic update);


  typedef enum logic [1:0] {idle, player, player2, endgame} state_type;
  state_type cur_state, nxt_state;

  always_ff @(negedge update or posedge rst) begin
    if (rst) begin
      cur_state <= idle;
    end else if(update) begin
      cur_state <= nxt_state;
    end
  end

  always_comb begin
    case(cur_state)
      idle: begin
        state = 4'b0001;
        nxt_state = player;
        player2InputEn = 0;
        player_input_en = 0;
        clr = 1;
      end
      player: begin
        clr = 0;
        state = 4'b0010;
        player2InputEn = 0;
        player_input_en = 1;
        select_player = 1;
        player2Select = 0;
        if (full == 1 || player_win == 1 || player2win == 1) begin
          nxt_state = endgame;
        end
        if (player_done == 1 && full == 0 && player_win == 0 && player2win == 0) begin
          nxt_state = player2;
        end
        if (player_done == 0 && full == 0 && player_win == 0 && player2win == 0) begin
          nxt_state = player;
        end
      end
      player2: begin
        clr = 0;
        state = 4'b0100;
        player2InputEn = 1;
        player_input_en = 0;
        select_player = 0;
        player2Select = 1;
        if (full == 1 || player_win == 1 || player2win == 1) begin
          nxt_state = endgame;
        end
        if (player2Done == 1 && full == 0 && player_win == 0 && player2win == 0) begin
          nxt_state = player;
        end
        if (player2Done == 0 && full == 0 && player_win == 0 && player2win == 0) begin
          nxt_state = player2;
        end
      end
      endgame: begin
        clr = 0;
        state = 4'b1000;
        player2InputEn = 0;
        player_input_en = 0;
      end
    endcase
  end
endmodule