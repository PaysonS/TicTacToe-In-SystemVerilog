/**
 * @ Author: PaysonS
 * @ Github: https://github.com/PaysonS
 * @ Create Time: 2023-12-02 12:59:56
 * @ Modified by: PaysonS
 * @ Modified time: 2024-06-23 18:21:52
 * @ Description: VGA module
 */

module vga (
    input  logic       clk,
    reset,
    output logic       vgaclk,     // 25.175 MHz VGA clock 
    output logic       hsync,
    vsync,
    output logic       sync_b,
    blank_b,  // to monitor & DAC 
    output logic [7:0] r,
    g,
    b,
    input  logic       is_full,
    input  logic       playerwin,
    player2win,
    input  logic [1:0] board1,
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
    input  logic       place
);  // to video DAC 

  logic [9:0] x, y;

  // Use a clock divider to create the 25 MHz VGA pixel clock 
  // 25 MHz clk period = 40 ns 
  // Screen is 800 clocks wide by 525 tall, but only 640 x 480 used for display 
  // HSync = 1/(40 ns * 800) = 31.25 kHz 
  // Vsync = 31.25 KHz / 525 = 59.52 Hz (~60 Hz refresh rate) 

  // divide 50 MHz input clock by 2 to get 25 MHz clock
  always_ff @(posedge clk, posedge reset)
    if (reset) vgaclk = 1'b0;

    else vgaclk = ~vgaclk;

  // generate monitor timing signals 
  vgaController vgaCont (
      vgaclk,
      reset,
      hsync,
      vsync,
      sync_b,
      blank_b,
      x,
      y
  );

  // user-defined module to determine pixel color 
  videoGen videoGen (
      x,
      y,
      clk,
      r,
      g,
      b,
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
      place
  );


endmodule


module vgaController #(
    parameter HBP = 10'd48,  // horizontal back porch
    HACTIVE = 10'd640,  // number of pixels per line
    HFP = 10'd16,  // horizontal front porch
    HSYN = 10'd96,  // horizontal sync pulse = 60 to move electron gun back to left
    HMAX    = HBP + HACTIVE + HFP + HSYN, //48+640+16+96=800: number of horizontal pixels (i.e., clock cycles)
    VBP = 10'd32,  // vertical back porch
    VACTIVE = 10'd480,  // number of lines
    VFP = 10'd11,  // vertical front porch
    VSYN = 10'd2,  // vertical sync pulse = 2 to move electron gun back to top
    VMAX = VBP + VACTIVE + VFP + VSYN
)  //32+480+11+2=525: number of vertical pixels (i.e., clock cycles)                      

(
    input logic vgaclk,
    reset,
    output logic hsync,
    vsync,
    sync_b,
    blank_b,
    output logic [9:0] hcnt,
    vcnt
);

  // counters for horizontal and vertical positions 
  always @(posedge vgaclk, posedge reset) begin
    if (reset) begin
      hcnt <= 0;
      vcnt <= 0;
    end else begin
      hcnt++;
      if (hcnt == HMAX) begin
        hcnt <= 0;
        vcnt++;
        if (vcnt == VMAX) vcnt <= 0;
      end
    end
  end


  // compute sync signals (active low) 
  assign hsync   = ~((hcnt >= (HACTIVE + HFP)) & (hcnt < (HACTIVE + HFP + HSYN)));
  assign vsync   = ~((vcnt >= (VACTIVE + VFP)) & (vcnt < (VACTIVE + VFP + VSYN)));
  // assign sync_b = hsync & vsync; 
  assign sync_b  = 1'b0;  // this should be 0 for newer monitors

  // force outputs to black when not writing pixels
  // The following also works: assign blank_b = hsync & vsync; 
  assign blank_b = (hcnt < HACTIVE) & (vcnt < VACTIVE);
endmodule


module videoGen (
    input logic [9:0] x,
    y,
    input logic clk,
    output logic [7:0] r,
    g,
    b,
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
    input logic place
);

  logic inrect, pixel;
  logic vert1, vert2, vert3, vert4, hor1, hor2, hor3, hor4;
  logic
      boardPlaceVert1, boardPlaceHorz1, boardPlace1, boardPlaceVert2, boardPlaceHorz2, boardPlace2, boardPlaceVert3, boardPlaceHorz3, boardPlace3, boardPlaceVert4, boardPlaceHorz4, boardPlace4, boardPlaceVert5, boardPlaceHorz5, boardPlace5;
  logic test;
  // Create a bar in the middle of the screen
  logic
      boardOne = 1'b0,
      boardTwo = 1'b0,
      boardThree = 1'b0,
      boardFour = 1'b0,
      boardFive = 1'b0,
      boardSix = 1'b0,
      boardSeven = 1'b0,
      boardEight = 1'b0,
      boardNine = 1'b0,
      boardTen = 1'b0,
      boardEleven = 1'b0,
      boardTwelve = 1'b0,
      boardThirteen = 1'b0,
      boardFourteen = 1'b0,
      boardFifteen = 1'b0,
      boardSixteen = 1'b0,
      boardSeventeen = 1'b0,
      boardEighteen = 1'b0,
      boardNineteen = 1'b0,
      boardTwenty = 1'b0,
      boardTwentyOne = 1'b0,
      boardTwentyTwo = 1'b0,
      boardTwentyThree = 1'b0,
      boardTwentyFour = 1'b0,
      boardTwentyFive = 1'b0;

  // chargenrom firstgen (
  //     y[8:3] + 8'd65,
  //     x,
  //     y,
  //     100,
  //     50,
  //     100,
  //     50,
  //     pixel
  // );
  assign board = vert1 | vert2 | vert3 | vert4 | hor1 | hor2 | hor3 | hor4;
  assign inrect = board | boardPlaceVert1 | boardPlaceHorz1 | boardPlace1 | boardPlaceVert2 | boardPlaceHorz2 | boardPlace2 | boardPlaceVert3 | boardPlaceHorz3 | boardPlace3 | boardPlaceVert4 | boardPlaceHorz4 | boardPlace4 | boardPlaceVert5 | boardPlaceHorz5 | boardPlace5;



  // assign test = (x >= 250) & (x < 260) & (y >= 25) & (y < 450) || (x >= 175) & (x < 185) & (y >= 25) & (y < 450) || (x >= 325) & (x < 335) & (y >= 25) & (y < 450) || (x >= 400) & (x < 410) & (y >= 25) & (y < 450)||
  //               (x >= 130) & (x < 460) & (y >= 180) & (y < 190) || (x >= 130) & (x < 460) & (y >= 80) & (y < 90) || (x >= 130) & (x < 460) & (y >= 280) & (y < 290) || (x >= 130) & (x < 460) & (y >= 380) & (y < 390); 
  assign vert1 = (x >= 175) & (x < 185) & (y >= 25) & (y < 450);
  assign vert2 = (x >= 250) & (x < 260) & (y >= 25) & (y < 450);
  assign vert3 = (x >= 325) & (x < 335) & (y >= 25) & (y < 450);
  assign vert4 = (x >= 400) & (x < 410) & (y >= 25) & (y < 450);
  assign hor1 = (x >= 130) & (x < 460) & (y >= 80) & (y < 90);
  assign hor2 = (x >= 130) & (x < 460) & (y >= 180) & (y < 190);
  assign hor3 = (x >= 130) & (x < 460) & (y >= 280) & (y < 290);
  assign hor4 = (x >= 130) & (x < 460) & (y >= 380) & (y < 390);



   always @(*) begin
    if (board1 == 2'b01) begin
      boardPlaceVert1 = (x >= 150) & (x < 160) & (y >= 25) & (y < 75); //top left + bottom is -20 from 80 and -20 from 175 +20 from 25(the top)
      boardPlaceHorz1 = (x >= 140) & (x < 170) & (y >= 45) & (y < 55);
    end else if (board1 == 2'b10) begin
      boardPlace1 = (x >= 120) & (x < 170) & (y >= 25) & (y < 75); //places 0 on board1
    end else begin
      boardPlaceVert1 = 0;
      boardPlaceHorz1 = 0;
      boardPlace1 = 0;
    end

    if (board2 == 2'b01) begin
      boardPlaceVert2 = (x >= 250) & (x < 260) & (y >= 25) & (y < 75);
      boardPlaceHorz2 = (x >= 240) & (x < 270) & (y >= 145) & (y < 155);
    end else if (board2 == 2'b10) begin
      boardPlace2 = (x >= 195) & (x < 240) & (y >= 100) & (y < 170);
    end else begin
      boardPlaceVert2 = 0;
      boardPlaceHorz2 = 0;
      boardPlace2 = 0;
    end

    if (board3 == 2'b01) begin
      boardPlaceVert3 = (x >= 250) & (x < 260) & (y >= 25) & (y < 75); //top left + bottom is -20 from 80 and -20 from 175 +20 from 25(the top)
      boardPlaceHorz3 = (x >= 140) & (x < 170) & (y >= 45) & (y < 55);
    end else if (board3 == 2'b10) begin
      boardPlace3 = (x >= 120) & (x < 170) & (y >= 25) & (y < 75); //places 0 on board1
    end else begin
      boardPlaceVert3 = 0;
      boardPlaceHorz3 = 0;
      boardPlace3 = 0;
    end

    if(board4 == 2'b01) begin
      boardPlaceVert4 = (x >= 370) & (x < 415) & (y >= 200) & (y < 280);
      boardPlaceHorz4 = (x >= 270) & (x < 315) & (y >= 200) & (y < 280);
    end else if (board4 == 2'b10) begin
      boardPlace4 = (x >= 195) & (x < 240) & (y >= 100) & (y < 170);
    end else begin
      boardPlaceVert4 = 0;
      boardPlaceHorz4 = 0;
      boardPlace4 = 0;
    end

   end



  // assign r = inrect ? 8'd255 : 8'h00;
  // assign g = inrect ? 8'd255 : 8'h00;
  // assign b = inrect ? 8'd255 : 8'h00;

  assign {r, b} = (y[3] == 0) ? {{8{pixel}}, 8'h00} : {8'h00, {8{pixel}}};
  assign g      = inrect ? 8'hFF : 8'h00;


endmodule


module chargenrom (
    input  logic [7:0] ch,
    input  logic [2:0] x,
    y,
    left,
    top,
    right,
    bot,
    output logic       pixel
);
  //5 is the far left bit 0 is far right bit
  //original was 5:0
  logic [5:0] charrom                            [2047:0];  // character generator ROM 
  //original was 7:0
  logic [7:0] line;  // a line read from the ROM 
  logic letter, outChar;

  // initialize ROM with characters from text file 
  initial $readmemb("charrom.txt", charrom);

  // index into ROM to find line of character 
  //og == 3'b000
  assign line  = charrom[y+{ch-65, 3'b000}];  // subtract 65 because A 1
  // is entry 0 
  // reverse order of bits 
  assign pixel = line[3'd7-x];


endmodule

module rectgen (
    input logic [9:0] x,
    y,
    left,
    top,
    right,
    bot,
    output logic inrect
);

  assign inrect = (x >= left & x < right & y >= top & y < bot);

endmodule


