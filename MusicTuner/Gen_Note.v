`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:13:13 11/08/2016 
// Design Name: 
// Module Name:    Gen_Note 
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
module Gen_Note(
	input clk,
	input reset,
	input mode, // play or listen mode
	input [7:0] NoteArray, // this could be larger
	input play, //1, play 0 dont play
	output reg audioOut
    );

	reg [19:0] counter;
	wire [19:0] notePeriod;
	
	parameter clockFrequency = 50_000_000;
	
	always @ (posedge clk) begin
		if(~play) begin counter <=0; audioOut <=1;
		end
		else begin
			counter <= counter + 1; 
			if( counter >= notePeriod) begin
				counter <=0;  
				audioOut <= ~audioOut ; end	//toggle audio output 	
		end
	end	
	
	
	//MusicNote note (Note_array, notePeriod);
	

endmodule
