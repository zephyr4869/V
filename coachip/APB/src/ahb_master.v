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
// Last modified Date:     2024/04/01 19:51:18 
// Last Version:           V1.0 
// Descriptions:            
//---------------------------------------------------------------------------------------- 
// Created by:             USER_NAME
// Created date:           2024/04/01 19:51:18 
// Version:                V1.0 
// TEXT NAME:              ahb_master.v 
// PATH:                   D:\Allcodes\v\APB\src\ahb_master.v 
// Descriptions:            
//                          
//---------------------------------------------------------------------------------------- 
//****************************************************************************************// 

module ahb_master #(parameter DATA_WIDTH = 32;)
(
    //system interface
    input            [  31: 0]sysaddr,
    input                  syswrite,
    input            [DATA_WIDTH-1: 0]sysdata,
    input            [   2: 0]syssize,
    input            [   2: 0]sysidle,
    input                  sysbusy ,
    output           [DATA_WIDTH-1: 0]sysrdata,
    //ahb_master interface 
    input                  hclk    ,
    input                  hrst_n  ,
    input            [DATA_WIDTH-1: 0]hrdata,
    input                  hready  ,
    input                  hresp   ,
    output           [  31: 0]haddr,
    output                 hwrite  ,
    output           [DATA_WIDTH-1: 0]hwdata,
    output           [   2: 0]hsize,
    output           [   2: 0]hburst,
    output           [   1: 0]htrans 
);
    parameter                HTRANS_IDLE= 2'B00 ;
    parameter                HTRANS_BUSY= 2'B01 ;
    parameter                HTRANS_NONSEQ= 2'B10 ;
    parameter                HTRANS_SEQ= 2'B11 ;

    parameter                SINGLE = 3'B000;
    parameter                INCT   = 3'B001;
    parameter                WRAP4  = 3'B010;
    parameter                INCR4  = 3'B011;
    parameter                WAAP8  = 3'B100;   
    parameter                INCR8  = 3'B101;
    parameter                WRAP16 = 3'B110;
    parameter                INCR16 = 3'B111;

    parameter                BYTE   = 3'B000;
    parameter                BYTE_2 = 3'B001;
    parameter                BYTE_4 = 3'B010;
    parameter                BYTE_8 = 3'B011;
    parameter                BYTE_16= 3'B100;
    parameter                BYTE_32= 3'B101;
    parameter                BYTE_64= 3'B110;
    parameter                BYTE_128= 3'B111;


    //SYSTEM   interface to ahb interface
    assign haddr = addr;
    assign hwrite = write;
    assign hsize =size ;
    assign hburst = ( )?INCR:burst;
        always @(posedge hclk or negedge hrst_n)           
            begin                                        
                if(!hrst_n)      begin
                    write <= 1'b0;
                    size <= 3'b0;
                    burst <= 3'b0;
                end                                       
                else if(hready)
                    begin
                        write <= syswrite;
                        size <= syssize;
                        burst <= sysburst;
                    end                                
                                                         
                else                                     
            end                                          








endmodule
