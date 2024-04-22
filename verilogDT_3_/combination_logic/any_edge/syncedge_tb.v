`timescale 1ns / 1ps
//****************************************VSCODE PLUG-IN**********************************//
//----------------------------------------------------------------------------------------
// IDE :                   VSCODE plug-in 
// VSCODE plug-in version: Verilog-Hdl-Format-1.9.20240413
// VSCODE plug-in author : Jiang Percy
//----------------------------------------------------------------------------------------
//****************************************Copyright (c)***********************************//
// Copyright(C)            Please Write Company name
// All rights reserved     
// File name:              syncedge_tb.v
// Last modified Date:     2024/04/21 15:03:30
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             Please Write You Name 
// Created date:           2024/04/21 15:03:30
// Version:                V1.0
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module    syncedge_tb();
    reg                                        clk                        ;
    reg                                        rst_n                      ;
    reg                                        sig_a                      ;
    wire                                       sig_a_anyedge              ;

    initial
        begin
            #0                                             
                    rst_n = 0   ;                          
                    clk = 0     ;  
                    sig_a = 0;                        
            #10                                            
                    rst_n = 1   ;
            #10     sig_a = 1;
            #30     sig_a = 0;
            #30     sig_a = 1;
            #30     sig_a = 0;      
            #50 $finish;                
        end                                                
                                                           
    parameter   CLK_FREQ = 100;//Mhz                       
    always # ( 1000/CLK_FREQ/2 ) clk = ~clk ;              
  `ifdef FSDB
  initial begin
      $fsdbDumpfile("test.fsdb");
      $fsdbDumpvars;
      $fsdbDumpMDA;
  end
  `endif                                                         
                                                           
syncedge u_syncedge(
    .clk                                (clk                       ),
    .rst_n                              (rst_n                     ),
    .sig_a                              (sig_a                     ),
    .sig_a_anyedge                      (sig_a_anyedge             )
);



endmodule                                                  