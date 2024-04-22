`timescale 1ns / 1ps
//****************************************VSCODE PLUG-IN**********************************//
//----------------------------------------------------------------------------------------
// IDE :                   VSCODE plug-in 
// VSCODE plug-in version: Verilog-Hdl-Format-1.7.20240406
// VSCODE plug-in author : Jiang Percy
//----------------------------------------------------------------------------------------
//****************************************Copyright (c)***********************************//
// Copyright(C)            XUST_jcdlsys
// All rights reserved     
// File name:              mul_addtree_2state_tb.v
// Last modified Date:     2024/04/07 16:33:17
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             ldy
// Created date:           2024/04/07 16:33:17
// Version:                V1.0
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module    mul_addtree_2state_tb();
    reg                                        clk                        ;
    reg                                        rst_n                      ;
    reg                       [3:0]            mul_a                      ;
    reg                       [3:0]            mul_b                      ;
    wire                      [7:0]            mul_out                    ;

    initial
        begin
            #0                                             
                    rst_n = 0   ;                          
                    clk = 0     ;  mul_a =1;mul_b = 1;                       
            #5                                            
                    rst_n = 1   ;                          
        end                                                
                                                           
    parameter   CLK_FREQ = 100;//Mhz                       
    always # ( 1000/CLK_FREQ ) clk = ~clk ; 
    initial begin
        repeat(5)
         begin
            #20 mul_a = mul_a + 1; mul_b = mul_b + 1;
         end
         #20 $finish;
    end             
 `ifdef FSDB
 initial begin
     $fsdbDumpfile("test.fsdb");
     $fsdbDumpvars;
     $fsdbDumpMDA;
 end
 `endif                                                          
                                                           
mul_addtree_2state u_mul_addtree_2state(
    .clk                                (clk                       ),
    .rst_n                              (rst_n                     ),
    .mul_a                              (mul_a                     ),
    .mul_b                              (mul_b                     ),
    .mul_out                            (mul_out                   )
);



endmodule                                                  