`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:13:23 11/08/2016 
// Design Name: 
// Module Name:    Key_Cont 
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
module Key_Cont(
	input clk,
	input reset,
	input ps2d,
	input ps2c,
	output mode, //0 is listen mode, 1 is play mode
	output [7:0] note_array
    );
	
	//from the keyboard
	/*
		Keyboard inputs
		L - switch to listen mode (8'h4B)
		P - switch to play mode (8'h4D)
		keys to navigate the note section
			up - (16'hE0_75)
			down - (16'hE0_72)
			left - (16'hE0_6B) figure out how to deal with this
			right - (16'hE0_74)
		spacebar - plays indicated note (8'h29)
		
	*/
	
	
	ps2_rx recieve_ps2 (
    .clk(clk), 
    .reset(reset), 
    .ps2d(ps2d), 
    .ps2c(ps2c), 
    .rx_en(rx_en), 
    .rx_done_tick(rx_done_tick), 
    .dout(dout)
    );
	
	wire [7:0] scan_data;
	reg [15:0] scan_queue;
	
	always @ (posedge scan_done_tick) 
		scan_queue = {scan_queue[7:0], scan_data } ;	
	
	
	always @ * //just whenever this is on
		begin
			if (scan_queue [15:8] != 8'hF0) //avoids release key errors
				begin
				if (scan_data == 8'h1C)
					btn = 2'b01;
				else if (scan_data == 8'h1B)
					btn = 2'b10;
				end	
			else
				btn = 2'b00;
		end


endmodule
