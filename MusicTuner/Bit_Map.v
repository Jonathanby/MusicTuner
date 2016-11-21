`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:02:37 11/08/2016 
// Design Name: 
// Module Name:    Bit_Map 
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
module Bit_Map(
	input wire clk, reset,
	input video_on,
	input wire [9:0] pix_x, pix_y,
	output reg [2:0] graph_rgb
    );

	 // constant and signal declaration
   // x, y coordinates (0,0) to (639,479)
   localparam MAX_X = 480;
   localparam MAX_Y = 640;
   wire refr_tick;
	
	//rectangle sizes
	//small
	localparam SMALL = 32; //32x32
	wire [9:0] sml_sqr_x_l, sml_sqr_x_r;
	wire [9:0] sml_sqr_y_t, sml_sqr_y_b;
	
	//small highlight
	localparam SMALL_hi = 37;
	wire [9:0] sml_sqrhi_x_l, sml_sqrhi_x_r;
	wire [9:0] sml_sqrhi_y_t, sml_sqrhi_y_b;
	
	//medium 
	localparam MEDIUM_W = 200;
	localparam MEDIUM_H = 105;
	wire [9:0] med_x_l, med_x_r;
	wire [9:0] med_y_t, med_y_b;
	
	
	//medium highlight
	localparam MEDIUMhi_W = 220;
	localparam MEDIUMhi_H = 125;
	wire [9:0] medhi_x_l, medhi_x_r;
	wire [9:0] medhi_y_t, medhi_y_b;
	
	//large


	//Play_Graph
		//Square_Graph x8 or this could be used in many places
	//Listen_Graph
	//Directions_Graph
	
	always @*
      if (~video_on)
         graph_rgb = 3'b000; // blank
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
	
endmodule
