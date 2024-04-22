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
// Last modified Date:     2024/03/24 21:45:31 
// Last Version:           V1.0 
// Descriptions:            
//---------------------------------------------------------------------------------------- 
// Created by:             USER_NAME
// Created date:           2024/03/24 21:45:31 
// Version:                V1.0 
// TEXT NAME:              apb_uart.v 
// PATH:                   D:\Allcodes\v\apb_uart\src\apb_uart.v 
// Descriptions:            
//                          
//---------------------------------------------------------------------------------------- 
//****************************************************************************************// 

module apb_uart(
    //apb interface
    input                  pclk    ,
    input                  prst_n  ,
    input                  psel    ,
    input                  penable ,
    input                  pwrite  ,
    input            [  31: 0]paddr,
    input            [  31: 0]pwdata,
    output reg       [  31: 0]prdata,
    output                 pready  ,
    //uart interface
    input                  rx      ,
    output                 tx       
);
    reg                    start_reg  ;
    reg              [  15: 0]sbuf_reg  ;
    reg                    uint_reg  ;

    wire                   apb_wr  ;
    wire                   apb_rd  ;
    reg              [  15: 0]cmd_in  ;
    reg                    cmd_vld  ;
    reg                    txrx_flag  ;
    wire             [  15: 0]read_data  ;
    wire                   read_vld  ;
    parameter                START_REG_ADDR= 32'H0 ; //only write
    parameter                SBUF_REG_ADDR= 32'H4 ; // wirte/read
    parameter                UINT_REG_ADDR= 32'H8 ; //only read
    //apb write/read enable //
    assign                   apb_wr = psel & penable & pwrite;
    assign                   apb_rd = psel & penable & !pwrite;

    //register//
        always @(posedge pclk or negedge prst_n)
            begin
                if(!prst_n)
                    start_reg <= 0;
                else if(apb_wr && (paddr == START_REG_ADDR))
                    start_reg <= 1'b1;                              //pwdata=32'b1;                                     
                else
                    start_reg <= 0;
            end
    always @(posedge pclk or negedge prst_n)
        begin
            if(!prst_n)
                sbuf_reg <= 16'b0;
            else if(apb_wr && (paddr == SBUF_REG_ADDR))
                sbuf_reg <= pwdata[15:0];                           //tx data                              
            else if (read_vld) begin
                sbuf_reg <= {8'b0,read_data}                        //rx data
            end
        end

    // cmd interface
    always @(posedge pclk or negedge prst_n)
        begin
            if(!prst_n)
                begin
                    cmd_in <= 16'b0;
                    cmd_vld <= 0;
                end
            else if(start_reg == 1)
                begin
                    cmd_in <= sbuf_reg;
                    cmd_vld <= 1;
                end

        end
    //interrupt register //
    always @(posedge pclk or negedge prst_n)
        begin
            if(!prst_n)  begin
                uint_reg <= 0;
            end
                                                     
            else if(cmd_vld)
                uint_reg <= 0;
                                                 
            else if (cmd_rdy & txrx_flag) begin
                uint_reg <= 1;
            end
            else if(apb_rd && (paddr == UINT_REG_ADDR))
                uint_reg <= 0;
        end

    always @(posedge pclk or negedge prst_n)
        begin
            if(!prst_n)
                txrx_flag <= 0;
            else if(cmd_rdy)
                txrx_flag <=1;
            else if (cmd_rdy) begin
                txrx_flag <= 0;
            end
        end
    // apb buf read//
    always@(*)
        begin
            if (apb_rd) begin
                case (paddr)
                   SBUF_REG_ADDR : prdata = {16'b0,sbuf_reg};
                   UINT_REG_ADDR : prdata = {31'b0,uint_reg};
                    default:      prdata = 32'b0;  
                endcase
            end
        end
    assign pready = psel & penable;
    // uart instance //
    uart_master



endmodule
