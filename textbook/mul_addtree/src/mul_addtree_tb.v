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
// File name:              mul_addtree_tb.v
// Last modified Date:     2024/04/07 15:52:51
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             ldy
// Created date:           2024/04/07 15:52:51
// Version:                V1.0
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module    mul_addtree_tb();
    reg              [   3: 0]mul_a,mul_b  ;
    wire             [   7: 0]mul_out  ;

    initial
        begin
            #0
                mul_a=0;     mul_b=0;
                      ;
            repeat(9)
                begin
                    #20 mul_a = mul_a + 1;
                    mul_b = mul_b + 1;
                end
            #100 $finish;
        end
                                                           
    parameter                CLK_FREQ= 100   ;//Mhz                       
    // always # ( 1000/CLK_FREQ/2 ) clk = ~clk ;
                                                           
 `ifdef FSDB
 initial begin
     $fsdbDumpfile("test.fsdb");
     $fsdbDumpvars;
     $fsdbDumpMDA;
 end
 `endif
mul_addtree u_mul_addtree(
    .mul_a                   (mul_a  ),
    .mul_b                   (mul_b  ),
    .mul_out                 (mul_out) 
);



endmodule