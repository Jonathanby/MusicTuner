`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:37:02 11/08/2016 
// Design Name: 
// Module Name:    SquareGraph 
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
module SquareGraph //need to figure out how to add letters inside easily... bitmap for just the top right corner
	#(
	parameter SQUARE_X_L = 550,
				 SQUARE_X_R = 560,
				 SQUARE_Y_T = 200,
				 SQUARE_Y_B = 250
	)
	(
	input pix_x,
	input pix_y,
	output square_on,
	output [2:0] square_rgb
   );

	assign square_on =
             (SQUARE_X_L<=pix_x) && (pix_x<=SQUARE_X_R) &&
             (SQUARE_Y_T<=pix_y) && (pix_y<=SQUARE_Y_B);
				 
   assign square_rgb = 3'b100;   // red
	
//generates a square with the parameters indicated
//square location x and y
//square size height and width
//letter? or will i have another layer for all of the text

//have a module for each element
//each hilight elemnt is also another module


endmodule
