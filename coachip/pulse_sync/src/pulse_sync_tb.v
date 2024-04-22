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
// File name:              pulse_sync_tb.v
// Last modified Date:     2024/03/24 10:28:33
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             ldy
// Created date:           2024/03/24 10:28:33
// Version:                V1.0
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module    pulse_sync_tb();
    reg                                        clk1                       ;
    reg                                        clk2                       ;
    reg                                        rst_n                      ;
    reg                                        pulse                      ;
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
                    rst_n = 0   ;                          
                    clk1 = 0     ; 
                    clk2 = 0 ;                         
            #20                                            
                    rst_n = 1   ;                          
        end         
    initial begin
        #0 pulse = 0;
        #20
        #10 pulse = 1;
        #50 pulse = 0;
        #100 pulse = 1;
        #50 pulse = 0;
        #400 $finish;
        end                                       
                                                           
    parameter   CLK_FREQ = 100;//Mhz                       
    always # ( 1000/CLK_FREQ/2 *2 ) clk1 = ~clk1 ;    
    always # ( 1000/CLK_FREQ/2  +13 ) clk2 = ~clk2 ;   

                                                           
                                                           
pulse_sync u_pulse_sync(
    .clk1                               (clk1                      ),
    .clk2                               (clk2                      ),
    .rst_n                              (rst_n                     ),
    .pulse                              (pulse                     ),
    .dout                               (dout                      )
);



endmodule                                                  