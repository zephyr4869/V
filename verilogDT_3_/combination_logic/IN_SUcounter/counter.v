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
// Last modified Date:     2024/04/21 15:27:04
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             Please Write You Name 
// Created date:           2024/04/21 15:27:04
// Version:                V1.0
// TEXT NAME:              counter.v
// PATH:                   D:\Allcodes\v\verilogDT_3_\combination_logic\IN_SUcounter\counter.v
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module counter#(parameter WIDETH = 8)
(
    input                          clk     ,
    input                          rst_n   ,
    input                          enable_cnt_up,
    input                          enable_cnt_dn,
    input                          new_cntr_preset,
    input          [WIDETH-1: 0]   new_cntr_preset_value,
    input                          pause_counting,

    output reg     [WIDETH-1: 0]   count_value 
);
    
assign    enable_cnt_dn= ~enable_cnt_up;
always @(posedge clk or negedge rst_n)
        begin
            if(!rst_n)
    count_value <= 8'b0;
            else if(enable_cnt_up)
    count_value <= count_value + 1;
            else if(enable_cnt_dn)
    count_value <= count_value - 1;
            else if(new_cntr_preset)
    count_value <= new_cntr_preset_value;
            else if(pause_counting)
    count_value <= count_value;
    
            else count_value <= count_value ;
        end
                                                      
        endmodule
