`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:29 11/10/2016 
// Design Name: 
// Module Name:    RecHilight 
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
module RecHilight
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

endmodule
