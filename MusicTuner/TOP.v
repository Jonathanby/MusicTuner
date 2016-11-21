`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:52 11/08/2016 
// Design Name: 
// Module Name:    TOP 
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
module TOP(
    );

Key_Cont Cntrlr (
    .clk(clk), 
    .reset(reset), 
    .ps2d(ps2d), 
    .ps2c(ps2c), 
    .mode(mode), 
    .note_array(note_array)
    );

Screen_Map ScrnMp (
    .clk(clk), 
    .reset(reset), 
    .note_array(note_array), 
    .mode(mode), 
    .rgb(rgb), 
    .hsync(hsync), 
    .vsync(vsync)
    );

Gen_Note GnNt (
    .clk(clk), 
    .reset(reset), 
    .mode(mode), 
    .NoteArray(NoteArray), 
    .play(play), 
    .audioOut(audioOut)
    );



endmodule
