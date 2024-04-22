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
// File name:              rstn_sync_tb.v
// Last modified Date:     2024/03/23 18:01:52
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             ldy
// Created date:           2024/03/23 18:01:52
// Version:                V1.0
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module    rstn_sync_tb();
    reg                        clk       ;
    reg                        rstn      ;
    wire                       rstn_sync  ;


`ifdef FSDB
initial begin
    $fsdbDumpfile("test.fsdb");
    $fsdbDumpvars;
end
`endif
    initial
        begin
            #0
                    rstn = 0   ;
                    clk = 0     ;
            #50
                    rstn = 1   ;
            #48
                    rstn = 0;
            #150
                    rstn = 1;
            #200 $finish;
            
        end
                                                           
    parameter                CLK_FREQ = 100   ;//Mhz                       
    always # ( 1000/CLK_FREQ/2 ) clk = ~clk ;

                                                       
rstn_sync rstn_sync_inst(
    .clk                     (clk      ),
    .rstn                    (rstn     ),
    .rstn_sync               (rstn_sync) 
);



endmodule                                                  