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
// Last modified Date:     2024/03/23 17:36:31 
// Last Version:           V1.0 
// Descriptions:            
//---------------------------------------------------------------------------------------- 
// Created by:             USER_NAME
// Created date:           2024/03/23 17:36:31 
// Version:                V1.0 
// TEXT NAME:              rstn_sync.v 
// PATH:                   D:\Allcodes\v\rstn_sync\src\rstn_sync.v 
// Descriptions:           异步复位，同步释放 
//                          
//---------------------------------------------------------------------------------------- 
//****************************************************************************************// 

module rstn_sync(
    input                      clk       ,
    input                      rstn      ,
    output                     rstn_sync 
);
    reg                        rstn_d1,rstn_d2  ;

    assign                   rstn_sync= rstn_d2;
        //rstn_d1
    always @(posedge clk or negedge rstn)
        begin
            if(!rstn)
                rstn_d1 <= 0;
              
            else
                rstn_d1 <= 1;                                          //vcc                                   
        end
    always @(posedge clk or negedge rstn)
        begin
            if(!rstn)
                rstn_d2 <= 0;
                                                     
            else
                rstn_d2 <= rstn_d1;                                    //vcc
        end
                                                                   
endmodule
