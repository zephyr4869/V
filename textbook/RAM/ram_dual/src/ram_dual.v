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
// Last modified Date:     2024/04/07 19:07:15 
// Last Version:           V1.0 
// Descriptions:            
//---------------------------------------------------------------------------------------- 
// Created by:             USER_NAME
// Created date:           2024/04/07 19:07:15 
// Version:                V1.0 
// TEXT NAME:              ram_dual.v 
// PATH:                   D:\Allcodes\v\textbook\RAM\ram_dual\src\ram_dual.v 
// Descriptions:            
//                          
//---------------------------------------------------------------------------------------- 
//****************************************************************************************// 

module ram_dual(
        output[7:0] q,
        input [7:0]d,
        input [2:0]addr_in,
        input [2:0] addr_out,
        input we,
        input rd,
        input clk1,
        input clk2
);
        reg[7:0]  q;
        reg[7:0]mem[7:0];
            always @(posedge clk1 )           
                begin                                        
                    if(we)                               
                       mem[addr_in] <= d;                                                                        
                end                                                                                                    
        always@(posedge clk2)
            begin
                if (rd) begin
                    q <= mem[addr_out];
                end
            end                                        
endmodule                                                          
