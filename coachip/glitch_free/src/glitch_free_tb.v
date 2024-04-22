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
// File name:              glitch_free_tb.v
// Last modified Date:     2024/03/23 21:36:59
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             ldy
// Created date:           2024/03/23 21:36:59
// Version:                V1.0
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module    glitch_free_tb();
    reg                                        clk0                       ;
    reg                                        clk1                       ;
    reg                                        rst_n                      ;
    reg                                        sel                        ;
    wire                                       clk_out                    ;





    glitch_free u_glitch_free(
    .clk0                               (clk0                      ),
    .clk1                               (clk1                      ),
    .rst_n                              (rst_n                     ),
    .sel                                (sel                       ),
    .clk_out                            (clk_out                   )
    );

`ifdef FSDB
initial begin
    $fsdbDumpfile("test.fsdb");
    $fsdbDumpvars;
end
`endif

    initial
        begin
            #2                                             
                    rst_n = 0   ;                          
                    clk0 = 0     ;
                    clk1 = 0;                          
            #10                                            
                    rst_n = 1   ;                          
        end                 
    initial begin
            #0 
                sel = 1;
                rst_n = 0;
                #40 rst_n = 1;
            #460   
            $finish;
    end                               
                                                           
    parameter   CLK_FREQ = 100;//Mhz                       
    always # ( 1000/CLK_FREQ/2 + 3 ) clk0 = ~clk0 ;
    always # ( 1000/CLK_FREQ/2 ) clk1 = ~clk1 ;      
    always #117 sel = ~sel;         
                                                       
                                                           




endmodule                                                  