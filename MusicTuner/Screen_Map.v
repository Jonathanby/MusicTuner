`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:12:43 11/08/2016 
// Design Name: 
// Module Name:    Screen_Map 
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
module Screen_Map(
	input wire clk, reset,
	input [7:0] note_array,
	input mode, //0 is listen mode, 1 is play mode
	output wire [2:0] rgb,
	output wire hsync, vsync
    );

// instantiate vga sync circuit
vga_sync vsync_unit
      (.clk(clk), .reset(reset), .hsync(hsync), .vsync(vsync),
       .video_on(video_on), .p_tick(pixel_tick),
       .pixel_x(pixel_x), .pixel_y(pixel_y));
//instantiate grapic generator

Play_Graph Play_grph (
    .video_on(video_on), 
    .pix_x(pixel_x), 
    .pix_y(pixel_y), 
    .graph_rgb(graph_rgb)
    );


endmodule
