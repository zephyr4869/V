`timescale 1ns / 1ps
//****************************************VSCODE PLUG-IN**********************************//
//----------------------------------------------------------------------------------------
// IDE :                   VSCODE     
// VSCODE plug-in version: Verilog-Hdl-Format-1.9.20240413
// VSCODE plug-in author : Jiang Percy
//----------------------------------------------------------------------------------------
//****************************************Copyright (c)***********************************//
// Copyright(C)            Please Write Company name
// All rights reserved     
// File name:              
// Last modified Date:     2024/04/21 13:28:59
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             Please Write You Name 
// Created date:           2024/04/21 13:28:59
// Version:                V1.0
// TEXT NAME:              posedge.v
// PATH:                   D:\Allcodes\v\verilogDT_3_\combination_logic\posedge\posedge.v
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module syncedge(
    input                               clk                        ,
    input                               rst_n                     ,
    input sig_a,
    output sig_a_anyedge
);
    reg sig_a_d1;
             always @(posedge clk or negedge rst_n)           
                 begin                                        
                     if(!rst_n)                               
                           sig_a_d1 <= 1'b0;                                   
                             
                     else    
                        sig_a_d1 <= sig_a   ;                               
                 end                                                                                                    
            assign sig_a_anyedge  = (sig_a & ~sig_a_d1) |
                                    (~sig_a & sig_a_d1);                                                   
endmodule