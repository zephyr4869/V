`timescale 1ns / 1ps 
//****************************************VSCODE PLUG-IN**********************************// 
//---------------------------------------------------------------------------------------- 
// IDE :                   VSCODE      
// VSCODE plug-in version: Verilog-Hdl-Format-1.7.20240406
// VSCODE plug-in author : Jiang Percy 
//---------------------------------------------------------------------------------------- 
//****************************************Copyright (c)***********************************// 
// Copyright(C)            COMPANY_NAME
// All rights reserved      
// File name:               
// Last modified Date:     2024/04/08 09:12:45 
// Last Version:           V1.0 
// Descriptions:            
//---------------------------------------------------------------------------------------- 
// Created by:             USER_NAME
// Created date:           2024/04/08 09:12:45 
// Version:                V1.0 
// TEXT NAME:              rom.v 
// PATH:                   D:\Allcodes\v\textbook\ROM\src\rom.v 
// Descriptions:            
//                          
//---------------------------------------------------------------------------------------- 
//****************************************************************************************// 

module rom(
        input clk,
        input cs_n,
        input [2:0] addm,
        output [7:0] dout

);
        reg [7:0]dout;
        reg[7:0]rom[7:0];
        initial begin
            rom[0] = 8'd0;
            rom[1] = 8'd1;
            rom[2] = 8'd2;
            rom[3] = 8'd4;
            rom[4] = 8'd8;
            rom[5] = 8'd16;
            rom[6] = 8'd32;
            rom[7] = 8'd64;
        end                                                           
        always@(posedge clk)
            begin
                if (cs_n) begin
                    dout <= 8'bz;
                end
                else dout <= rom[addm];
            end                                                          
endmodule                                                          
