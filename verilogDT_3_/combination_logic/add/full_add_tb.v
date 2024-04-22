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
// File name:              full_add_tb.v
// Last modified Date:     2024/04/21 10:18:04
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             Please Write You Name 
// Created date:           2024/04/21 10:18:04
// Version:                V1.0
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module    full_add_tb();
    parameter  WIDETH = 4;
    reg                       [WIDETH - 1:0]   a                          ;
    reg                       [WIDETH - 1:0]   b                          ;
    reg                                        cin                        ;
    wire                      [WIDETH - 1:0]   sum                        ;
    wire                                       cout                       ;

                                      
                                                           
    parameter   CLK_FREQ = 100;//Mhz                       
    always # ( 1000/CLK_FREQ/2 ) clk = ~clk ;              
                                                           
                                                           
full_add#(
   .WIDETH         (WIDETH)            )
 u_full_add(
    .a                                  (a                         ),
    .b                                  (b                         ),
    .cin                                (cin                       ),
    .sum                                (sum                       ),
    .cout                               (cout                      )
);

`ifdef FSDB
initial begin
    $fsdbDumpfile("test.fsdb");
    $fsdbDumpvars;
    $fsdbDumpMDA;
end
`endif
initial begin
    a=3'b000;b=3'b0;cin=1'b0;           ///{0 0}
    #20;                                
    a=3'b1;b=3'b0;cin=1'b0;             //
    #20;
    a=3'b1;b=3'b1;cin=1'b0;
    #20;
    a=3'b1;b=3'b1;cin=1'b1;
        #20;
    a=3'b111;b=3'b111;cin=1'b1;
    #20;
    a=4'b1111;b=4'b1111;cin=1'b1;
#100 ; $finish;
end

endmodule                                                  