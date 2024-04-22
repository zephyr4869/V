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
// Last modified Date:     2024/04/21 10:07:44
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             Please Write You Name 
// Created date:           2024/04/21 10:07:44
// Version:                V1.0
// TEXT NAME:              full_add.v
// PATH:                   D:\Allcodes\v\verilogDT_3_\combination_logic\full_add.v
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module full_add#(parameter WIDETH = 4)
(
    input              [WIDETH - 1:0]   a                          ,
    input              [WIDETH - 1:0]   b                          ,
    input                               cin                        ,
    output             [WIDETH - 1:0]   sum                        ,
    output                              cout                        
);
    assign             {cout,sum}     = a + b + cin;
                                                                   
endmodule