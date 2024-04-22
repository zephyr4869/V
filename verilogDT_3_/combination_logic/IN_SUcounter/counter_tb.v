`timescale 1ns / 1ps
//****************************************VSCODE PLUG-IN**********************************//
//----------------------------------------------------------------------------------------
// IDE :                   VSCODE plug-in 
// VSCODE plug-in version: Verilog-Hdl-Format-1.9.20240413
// VSCODE plug-in author : Jiang Percy
//----------------------------------------------------------------------------------------
//****************************************Copyright (c)***********************************//
// Copyright(C)            Xust_ASICsys
// All rights reserved     
// File name:              counter_tb.v
// Last modified Date:     2024/04/21 17:04:12
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             ldy
// Created date:           2024/04/21 17:04:12
// Version:                V1.0
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module    counter_tb();
    parameter WIDETH = 8;
    reg                                        clk                        ;
    reg                                        rst_n                      ;
    reg                                        enable_cnt_up              ;
    wire                                        enable_cnt_dn              ;
    reg                                        new_cntr_preset            ;
    reg                       [WIDETH-1: 0]    new_cntr_preset_value      ;
    reg                                        pause_counting             ;
    wire                      [WIDETH-1: 0]    count_value                ;

    initial
        begin
            #0                                            
                    rst_n = 0   ;                          
                    clk = 0     ; 
                    new_cntr_preset = 0;    
                    enable_cnt_up = 0;
                     new_cntr_preset_value = 8'd255;   
                       pause_counting  =0;               
            #10                                            
                    rst_n = 1   ;                
            #10 enable_cnt_up = 1;          
            #2600 enable_cnt_up = 0;
            #2600 new_cntr_preset = 1;
            #50 new_cntr_preset = 0;
            #100 pause_counting  =1;
            #100 $finish;
        end                                                
    assign    enable_cnt_dn= ~enable_cnt_up;                                                       
    parameter   CLK_FREQ = 100;//Mhz                       
    always # ( 1000/CLK_FREQ/2 ) clk = ~clk ;              
    `ifdef FSDB
    initial begin
        $fsdbDumpfile("test.fsdb");
        $fsdbDumpvars;
        $fsdbDumpMDA;
    end
    `endif                                                       
                                                           
counter#(
   .WIDETH         (WIDETH)             )

 u_counter(
    .clk                                (clk                       ),
    .rst_n                              (rst_n                     ),
    .enable_cnt_up                      (enable_cnt_up             ),
    .enable_cnt_dn                      (enable_cnt_dn             ),
    .new_cntr_preset                    (new_cntr_preset           ),
    .new_cntr_preset_value              (new_cntr_preset_value     ),
    .pause_counting                     (pause_counting            ),
    .count_value                        (count_value               )
);



endmodule                                                  