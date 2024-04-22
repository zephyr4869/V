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
// Last modified Date:     2024/03/24 08:07:08 
// Last Version:           V1.0 
// Descriptions:            
//---------------------------------------------------------------------------------------- 
// Created by:             USER_NAME
// Created date:           2024/03/24 08:07:08 
// Version:                V1.0 
// TEXT NAME:              level_sync.v 
// PATH:                   D:\Allcodes\v\level_syncer\src\level_sync.v 
// Descriptions:            
//                          
//---------------------------------------------------------------------------------------- 
//****************************************************************************************// 

module level_sync(
    input                  clk1    ,
    input                  clk2    ,
    input                  data    ,
    input                  rst_n1  , 
    input                  rst_n2  ,
    output                 dout     
);  //two clocks
    reg                    din,d2,d3  ;
    assign                   dout   = d3;
    always @(posedge clk1 or negedge rst_n1)           
        begin                                        
            if(!rst_n1)                               
                din <= 0 ;                  
            else         
                din <= data;                            
        end                                          
    always @(posedge clk2 or negedge rst_n2)           
        begin                                        
            if(!rst_n2)    begin                           
                d2 <= 0; 
                d3 <= 0;        
            end         
            else   begin       
                d2 <= din;   
                d3 <= d2; 
            end
                                     
        end                                          
                                                                                  
                                                                   
endmodule                                                          
