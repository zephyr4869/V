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
// File name:              ram_single_tb.v
// Last modified Date:     2024/04/07 18:11:02
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             ldy
// Created date:           2024/04/07 18:11:02
// Version:                V1.0
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module    ram_single_tb();
    reg                                        clk                        ;
    reg                       [2:0]            addm                       ;
    reg                                        cs_n                       ;
    reg                                        we_n                       ;
    reg                       [7:0]            din                        ;
    wire                      [7:0]            dout                       ;

    initial
        begin
            clk=0; addm=0; cs_n=1; we_n =0;din=0;
            #5 cs_n = 0;
            #315 we_n =1 ;                       
        end                                                
                                                           
    parameter   CLK_FREQ = 100;//Mhz                       
    always # ( 1000/CLK_FREQ/2 *2) clk = ~clk ; 

    initial begin
        repeat(7)
            begin
                #40 addm = addm + 1;
                din = din + 1;
            end
            #40 
                repeat(7)
                    #40 addm = addm -1;
                    #100 $finish;
    end


`ifdef FSDB
initial begin
    $fsdbDumpfile("test.fsdb");
    $fsdbDumpvars;
    $fsdbDumpMDA;
end
`endif                                                           
                                                           
ram_single u_ram_single(
    .clk                                (clk                       ),
    .addm                               (addm                      ),
    .cs_n                               (cs_n                      ),
    .we_n                               (we_n                      ),
    .din                                (din                       ),
    .dout                               (dout                      )
);



endmodule                                                  