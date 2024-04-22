`timescale 1ns / 1ps
//****************************************VSCODE PLUG-IN**********************************//
//----------------------------------------------------------------------------------------
// IDE :                   VSCODE plug-in 
// VSCODE plug-in version: Verilog-Hdl-Format-1.5.20240322
// VSCODE plug-in author : Jiang Percy
//----------------------------------------------------------------------------------------
//****************************************Copyright (c)***********************************//
// Copyright(C)            XUST_jcdlsys
// All rights reserved     
// File name:              edge_sync_tb.v
// Last modified Date:     2024/03/24 09:40:49
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             ldy
// Created date:           2024/03/24 09:40:49
// Version:                V1.0
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module    edge_sync_tb();
    reg                                        clk1                       ;
    reg                                        clk2                       ;
    reg                                        rst_n1                     ;
    reg                                        rst_n2                     ;
    reg                                        data                       ;
    wire                                       dout                       ;
    `ifdef FSDB
    initial begin
        $fsdbDumpfile("test.fsdb");
        $fsdbDumpvars;
    end
    `endif
    initial
        begin
            #0                                             
                    rst_n1 = 0   ;                          
                    clk1 = 0     ;   
                    rst_n2 = 0   ;    
                    clk2 = 0     ;                           
            #10                                            
                    rst_n1 = 1   ;    
                    rst_n2 = 1   ;     
            #1000
                    $finish      ;                 
        end                                                
                                                           
    parameter   CLK_FREQ = 100;//Mhz                       
    always # ( 1000/CLK_FREQ/2 +15 ) clk1 = ~clk1 ;   
    always # ( 1000/CLK_FREQ/2 +8.2 ) clk2 = ~clk2 ;             
    always @(posedge clk1 or negedge rst_n1)           
        begin                                        
            if(!rst_n1)                               
               data <= 1;                                                                   
            else   
               data <= {$random}%2;                                  
        end                                                                                                
                                                           
edge_sync u_edge_sync(
    .clk1                               (clk1                      ),
    .clk2                               (clk2                      ),
    .rst_n1                             (rst_n1                    ),
    .rst_n2                             (rst_n2                    ),
    .data                               (data                      ),
    .dout                               (dout                      )
);



endmodule                                                  