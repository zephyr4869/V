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
// Last modified Date:     2024/04/07 18:06:06 
// Last Version:           V1.0 
// Descriptions:            
//---------------------------------------------------------------------------------------- 
// Created by:             USER_NAME
// Created date:           2024/04/07 18:06:06 
// Version:                V1.0 
// TEXT NAME:              ram_single.v 
// PATH:                   D:\Allcodes\v\textbook\RAM\src\ram_single.v 
// Descriptions:            
//                          
//---------------------------------------------------------------------------------------- 
//****************************************************************************************// 

module ram_single(
    input                               clk                        ,
    input [2:0] addm,
    input cs_n,
    input we_n,
    input [7:0] din,
    output [7:0] dout         

    );

reg [7:0] dout ;
reg [7:0]raml[7:0] ;    //8 ge 8bits regesiters
    always @(posedge clk )           
        begin                                        
            if(cs_n)
                dout <= 8'bz;                               
                                                     
            else if(we_n) 
            begin
                dout <= raml[addm];
            end                               
                                                     
            else                   
            raml[addm] <=   din;                   
        end                                                                                                 
                                                                   
endmodule                                                          
