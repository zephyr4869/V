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
// File name:              ram_dual_tb.v
// Last modified Date:     2024/04/07 19:14:08
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             ldy
// Created date:           2024/04/07 19:14:08
// Version:                V1.0
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module    ram_dual_tb();
    wire                      [7:0]            q                          ;
    reg                       [7:0]            d                          ;
    reg                       [2:0]            addr_in                    ;
    reg                       [2:0]            addr_out                   ;
    reg                                        we                         ;
    reg                                        rd                         ;
    reg                                        clk1                       ;
    reg                                        clk2                       ;

`ifdef FSDB
initial begin
    $fsdbDumpfile("test.fsdb");
    $fsdbDumpvars;
    $fsdbDumpMDA;
end
`endif

    initial
        begin
            clk1 = 0;clk2 = 0;we =1 ;rd = 0;addr_in = 0;addr_out = 0;d=0;
            #320 we = 0;
            rd = 1;                     
        end                                                
                                                           
    parameter   CLK_FREQ = 100;//Mhz                       
    always # ( 1000/CLK_FREQ/2 *2 ) clk1 = ~clk1 ;
    always # ( 1000/CLK_FREQ/2 *2 ) clk2 = ~clk2 ;                 
    initial begin
        repeat(7)
            begin
                #40 addr_in = addr_in +1;
                d = d+1;
            end
                #40 
                repeat(7)
                    #40 addr_out = addr_out + 1;
                #100 $finish;
    end                                                      
                                                           
ram_dual u_ram_dual(
    .q                                  (q                         ),
    .d                                  (d                         ),
    .addr_in                            (addr_in                   ),
    .addr_out                           (addr_out                  ),
    .we                                 (we                        ),
    .rd                                 (rd                        ),
    .clk1                               (clk1                      ),
    .clk2                               (clk2                      )
);



endmodule                                                  