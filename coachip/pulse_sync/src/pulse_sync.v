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
// Last modified Date:     2024/03/24 10:23:01 
// Last Version:           V1.0 
// Descriptions:            
//---------------------------------------------------------------------------------------- 
// Created by:             USER_NAME
// Created date:           2024/03/24 10:23:01 
// Version:                V1.0 
// TEXT NAME:              pulse_sync.v 
// PATH:                   D:\Allcodes\v\pulse_sync\src\pulse_sync.v 
// Descriptions:            
//                          
//---------------------------------------------------------------------------------------- 
//****************************************************************************************// 

module pulse_sync(
    input                               clk1                        ,
    input clk2,
    input                               rst_n  ,
    input pulse,
    output dout                    
);
    reg din,d1,d2,d3;
        always @(posedge clk1 or negedge rst_n)           
            begin                                        
                if(!rst_n)                               
                    din <= 0;                                                                
                else if (pulse) begin
                    din <= ~din;
                end
                else
                    din <= din;
                                                          
            end                                                                                              
    always @(posedge clk2 or negedge rst_n)           
        begin                                        
            if(!rst_n)  begin
                d1 <= 0;
            end                             
                                                     
            else begin
                d1 <= din;
            end                                                                
        end          
     always @(posedge clk2 or negedge rst_n)           
         begin                                        
             if(!rst_n)                               
                 d2 <= 0;                                                                  
             else      
                d2 <= d1;                               
         end      
     always @(posedge clk2 or negedge rst_n)           
         begin                                        
             if(!rst_n)                               
                 d3 <= 0;                                                                  
             else      
                d3 <= d2;                               
         end   
    assign dout = d2 ^ d3 ;                                                                                                                                          
endmodule                                                          
