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
// Last modified Date:     2024/03/23 21:29:11 
// Last Version:           V1.0 
// Descriptions:            
//---------------------------------------------------------------------------------------- 
// Created by:             USER_NAME
// Created date:           2024/03/23 21:29:11 
// Version:                V1.0 
// TEXT NAME:              glitch_free.v 
// PATH:                   D:\Allcodes\v\glitch_free\src\glitch_free.v 
// Descriptions:            
//                          
//---------------------------------------------------------------------------------------- 
//****************************************************************************************// 

module glitch_free(
    input                  clk0     ,
    input clk1;
    input                  rst_n   ,
    input                  sel,  
    output clk_out
);
    reg                    d0,d1,d2,d3  ;
   //d0
       always @(posedge clk1 or negedge rst_n)
           begin
               if(!rst_n)
                    d0 <=  0;
                                                        
               else
                    d0 <= sel & !d3;
           end
    //d1                                                                                                       
        always @(posedge clk1 or negedge rst_n)
                begin
                    if(!rst_n)
                         d1 <= 0;
                                                             
                    else
                        d1 <= d0;
                end
    //d2
        always @(posedge clk0 or negedge rst_n)
                begin
                    if(!rst_n)
                         d2 <= 0;
                                                             
                    else
                        d2 <= !sel & !d1;
                end    
    //d3
         always @(posedge clk1 or negedge rst_n)
                begin
                    if(!rst_n)
                      d3 <= 0;

                    else
                        d3< = d2;
                end     
    assign clk_out  = (clk1 & d1) | (clk0 & d3);
endmodule
