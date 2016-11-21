`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:09:13 11/10/2016 
// Design Name: 
// Module Name:    Letter_Graph 
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
module Letter_Graph
	#(
	parameter SQUARE_X_L = 550,
				 SQUARE_Y_T = 200,
			   letter = 1
	)
	(
	input [7:0] pix_x,
	input [7:0] pix_y,
	output letter_on,
	output [2:0] letter_rgb
   );
	
	localparam SQUARE_X_R = SQUARE_X_L + 5;
  
   localparam SQUARE_Y_B = SQUARE_Y_T + 5; //0,0 is top left corner

	wire [2:0] letter_addr;
	reg  [4:0] letter_data = 0;
	wire [2:0] letter_col; //column
	wire letter_bit;
	
	always @*
		if (letter == 1)
		begin
			case (letter_addr) //A
			3'h0: letter_data = 5'b01100; 
			3'h1: letter_data = 5'b10010; 
			3'h2: letter_data = 5'b11110; 
			3'h3: letter_data = 5'b10010; 
			3'h4: letter_data = 5'b10010; 
			endcase
		end
		else if (letter == 2)
		begin
			case (letter_addr) //B
			3'h0: letter_data = 5'b11100; 
			3'h1: letter_data = 5'b10010; 
			3'h2: letter_data = 5'b11100; 
			3'h3: letter_data = 5'b10010; 
			3'h4: letter_data = 5'b11100; 
			endcase
		end
	
	assign square_on =
             (SQUARE_X_L<=pix_x) && (pix_x<=SQUARE_X_R) &&
             (SQUARE_Y_T<=pix_y) && (pix_y<=SQUARE_Y_B);
	assign letter_addr = pix_y [2:0] - SQUARE_Y_T[2:0];
	assign letter_col = pix_x [2:0] - SQUARE_X_L[2:0];
	assign letter_bit = letter_data [letter_col];
	
	assign letter_on = square_on & letter_bit;
	
	assign letter_rgb = 3'b111;

endmodule
