`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:52:37 11/08/2016 
// Design Name: 
// Module Name:    Play_Graph 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Play_Graph
#(
	parameter DVSR = 123,
				 DVSR_BIT = 234
 )
	(
	input video_on,
	input pix_x,
	input pix_y,
	input graph_rgb
    );
	 
RecHilight #(.SQUARE_X_L(123), .SQUARE_X_R(458), .SQUARE_Y_T(789), .SQUARE_Y_B(890)) A_hi (
    .pix_x(pix_x), 
    .pix_y(pix_y), 
    .square_on(square_on), 
    .square_rgb(square_rgb)
    );
	 
RecHilight #(.SQUARE_X_L(DVSR), .SQUARE_X_R(DVSR_BIT), .SQUARE_Y_T(DVSR), .SQUARE_Y_B(DVSR_BIT)) B_hi (
    .pix_x(pix_x), 
    .pix_y(pix_y), 
    .square_on(square_on), 
    .square_rgb(square_rgb)
    );

SquareGraph #(.SQUARE_X_L(DVSR), .SQUARE_X_R(DVSR_BIT), .SQUARE_Y_T(DVSR), .SQUARE_Y_B(DVSR_BIT)) A (
    .pix_x(pix_x), 
    .pix_y(pix_y), 
    .square_on(square_on), 
    .square_rgb(square_rgb)
    );

SquareGraph #(.SQUARE_X_L(DVSR), .SQUARE_X_R(DVSR_BIT), .SQUARE_Y_T(DVSR), .SQUARE_Y_B(DVSR_BIT)) B (
    .pix_x(pix_x), 
    .pix_y(pix_y), 
    .square_on(square_on), 
    .square_rgb(square_rgb)
    );

Letter_Graph #(.SQUARE_X_L(DVSR), .SQUARE_X_R(DVSR_BIT), .letter (1)) la  (
    .pix_x(pix_x), 
    .pix_y(pix_y), 
    .letter_on(letter_on), 
    .letter_rgb(letter_rgb)
    );
	 
Letter_Graph #(.SQUARE_X_L(DVSR), .SQUARE_X_R(DVSR_BIT), .letter (2)) lb  (
    .pix_x(pix_x), 
    .pix_y(pix_y), 
    .letter_on(letter_on), 
    .letter_rgb(letter_rgb)
    );
//LetterGraph?
	 
	 
 //input x and y
	 //output rgb hsync vsync?

/*
	for play button and all the note boxes
	hilight mode vs not hilight
	note thing for hilight


always @*
begin
      if (~video_on)
         play_rgb = 3'b000; // blank
      else
         if (wall_on)
            graph_rgb = wall_rgb;
         else if (bar_on)
            graph_rgb = bar_rgb;
         else if (rd_ball_on)  //sq_ball_on or rd_ball_on
            graph_rgb = ball_rgb;
			else if (rd_shape_on)  //sq_ball_on or rd_ball_on
            graph_rgb = shape_rgb;
         else
            graph_rgb = 3'b110; // yellow background
*/
endmodule
