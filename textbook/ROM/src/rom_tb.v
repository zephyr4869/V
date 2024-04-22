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
// File name:              rom_tb.v
// Last modified Date:     2024/04/08 09:24:50
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             ldy
// Created date:           2024/04/08 09:24:50
// Version:                V1.0
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module    rom_tb();
    reg                                        clk                        ;
    reg                                        cs_n                       ;
    reg                       [2:0]            addm                       ;
    wire                      [7:0]            dout                       ;
`ifdef FSDB
initial begin
    $fsdbDumpfile("test.fsdb");
    $fsdbDumpvars;
    $fsdbDumpMDA;
end
`endif
    initial
        begin
            clk = 0;addm=0;cs_n = 0;                    
        end                                                
                                                           
    parameter   CLK_FREQ = 100;//Mhz                       
    always # ( 1000/CLK_FREQ/2 *2) clk = ~clk ;              
     initial
        begin
            repeat(7)
            #20 addm = addm + 1;
            #100 $finish;
        end                                                      
                                                           
rom u_rom(
    .clk                                (clk                       ),
    .cs_n                               (cs_n                      ),
    .addm                               (addm                      ),
    .dout                               (dout                      )
);



endmodule                                                  