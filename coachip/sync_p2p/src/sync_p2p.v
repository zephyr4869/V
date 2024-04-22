`timescale 1ns / 1ps 
//****************************************VSCODE PLUG-IN**********************************// 
//---------------------------------------------------------------------------------------- 
// IDE :                   VSCODE      
// VSCODE plug-in version: Verilog-Hdl-Format-1.5.20240322
// VSCODE plug-in author : Jiang Percy 
//---------------------------------------------------------------------------------------- 
//****************************************Copyright (c)***********************************// 
// Copyright(C)            COMPANY_NAME
// All rights reserved      
// File name:               
// Last modified Date:     2024/03/24 14:39:51 
// Last Version:           V1.0 
// Descriptions:            
//---------------------------------------------------------------------------------------- 
// Created by:             USER_NAME
// Created date:           2024/03/24 14:39:51 
// Version:                V1.0 
// TEXT NAME:              sync_p2p.v 
// PATH:                   D:\Allcodes\v\sync_p2p\src\sync_p2p.v 
// Descriptions:            
//                          
//---------------------------------------------------------------------------------------- 
//****************************************************************************************// 

module sync_p2p(
    input                               clka                        ,
    input clkb,
    input                               rst_n                      
    input a_pulse,
    output rsp_from_clk_b,
    output b_pulse,
    output b_level_d2,
    output b_level_d

);
    reg a_level_r;
        always @(posedge clk or negedge rst_n)           
            begin                                        
                if(!rst_n)                               
                     a_level_r <=    0;                                 
                else if(a_pulse)                                
                      a_level_r <= ~a_level_r;                                   
                else
                     a_level_r <= a_level_r;
    always @(posedge clk or negedge rst_n)           
        begin                                        
            if(!rst_n)                               
                                                     
            else if()                                
                                                     
            else                                     
        end                                                                               
            end                                          
                                                                   
                                                                   
endmodule                                                          
