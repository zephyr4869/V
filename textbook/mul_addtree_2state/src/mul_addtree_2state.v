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
// Last modified Date:     2024/04/07 16:28:38 
// Last Version:           V1.0 
// Descriptions:            
//---------------------------------------------------------------------------------------- 
// Created by:             USER_NAME
// Created date:           2024/04/07 16:28:38 
// Version:                V1.0 
// TEXT NAME:              mul_addtree_2state.v 
// PATH:                   D:\Allcodes\v\textbook\mul_addtree_2state\src\mul_addtree_2state.v 
// Descriptions:            
//                          
//---------------------------------------------------------------------------------------- 
//****************************************************************************************// 

module mul_addtree_2state(
    input                               clk                        ,
    input                               rst_n                     ,
    input [3:0]  mul_a,mul_b, 
    output[7:0] mul_out    
        );

    reg [7:0]  add01,add23,mul_out;
    wire [7:0] stored0,stored1,stored2,stored3;
    assign stored0 = mul_b[0]?{4'b0,mul_a}:8'b0;
    assign stored1 = mul_b[1]?{3'b0,mul_a,1'b0}:8'b0;
    assign stored2 = mul_b[2]?{2'b0,mul_a,2'b0}:8'b0;
    assign stored3 = mul_b[3]?{1'b0,mul_a,3'b0}:8'b0;

    always @(posedge clk or negedge rst_n)           
        begin                                        
            if(!rst_n)   begin
                add01 <= 8'b0;
                add23 <= 8'b0;
                mul_out <= 8'b0;
            end                                                         
            else     begin
                add01 <= stored0 + stored1;
                add23 <= stored2 + stored3;
                mul_out <= add01 + add23;
            end                                
        end                                          


endmodule                                                          
