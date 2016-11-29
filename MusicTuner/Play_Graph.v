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
	output reg [3:0] graph_rgb
    );
	 
	 wire hilight_on1;
	 wire hilight_on2;
	 wire square_on1;
	 wire square_on2;
	 wire letter_on1;
	 wire letter_on2;
	 
	 
	 
	 wire [3:0] hilight_rgb1;
	 wire [3:0] hilight_rgb2;
	 
	 wire [3:0] square_rgb1;
	 wire [3:0] square_rgb2;
	 
	 wire [3:0] letter_rgb1;
	 wire [3:0] letter_rgb2;
	
	 
	 
RecHilight #(.SQUARE_X_L(123), .SQUARE_X_R(458), .SQUARE_Y_T(789), .SQUARE_Y_B(890)) A_hi (
    .pix_x(pix_x), 
    .pix_y(pix_y), 
    .square_on(hilight_on1), 
    .square_rgb(hilight_rgb1)
    );
	 
RecHilight #(.SQUARE_X_L(DVSR), .SQUARE_X_R(DVSR_BIT), .SQUARE_Y_T(DVSR), .SQUARE_Y_B(DVSR_BIT)) B_hi (
    .pix_x(pix_x), 
    .pix_y(pix_y), 
    .square_on(hilight_on2), 
    .square_rgb(hilight_rgb2)
    );

SquareGraph #(.SQUARE_X_L(DVSR), .SQUARE_X_R(DVSR_BIT), .SQUARE_Y_T(DVSR), .SQUARE_Y_B(DVSR_BIT)) A (
    .pix_x(pix_x), 
    .pix_y(pix_y), 
    .square_on(square_on1), 
    .square_rgb(square_rgb1)
    );

SquareGraph #(.SQUARE_X_L(DVSR), .SQUARE_X_R(DVSR_BIT), .SQUARE_Y_T(DVSR), .SQUARE_Y_B(DVSR_BIT)) B (
    .pix_x(pix_x), 
    .pix_y(pix_y), 
    .square_on(square_on2), 
    .square_rgb(square_rgb2)
    );

Letter_Graph #(.SQUARE_X_L(DVSR), .SQUARE_X_R(DVSR_BIT), .letter (1)) la  (
    .pix_x(pix_x), 
    .pix_y(pix_y), 
    .letter_on(letter_on1), 
    .letter_rgb(letter_rgb1)
    );
	 
Letter_Graph #(.SQUARE_X_L(DVSR), .SQUARE_X_R(DVSR_BIT), .letter (2)) lb  (
    .pix_x(pix_x), 
    .pix_y(pix_y), 
    .letter_on(letter_on2), 
    .letter_rgb(letter_rgb2)
    );
	 
 //input x and y
	 //output rgb hsync vsync?

/*
	for play button and all the note boxes
	hilight mode vs not hilight
	note thing for hilight

*/

	always @*
	begin
			if (~video_on)
				graph_rgb = 3'b000; // blank
			else
				if (letter_on1)
					graph_rgb = letter_rgb1;
				else if (letter_on2)
					graph_rgb = letter_rgb2;
				else if (hilight_on1)
					graph_rgb = hilight_rgb1;
				else if (square_on1)
					graph_rgb = square_rgb1;
				else if (square_on2)
					graph_rgb = square_rgb2;
				else if (hilight_on2)
					graph_rgb = hilight_rgb2;
				else
					graph_rgb = 3'b110; // yellow background\
	end
					
	
endmodule
