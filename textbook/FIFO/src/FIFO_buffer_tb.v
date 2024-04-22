module fifo_tb();
    reg                    clk     ;
    reg                    rst_n   ;
    reg                    write_en  ;
    reg                    read_en  ;
    reg              [   7: 0]data_in  ;

    wire                   empty   ;
    wire                   full    ;
    wire             [   7: 0]data_out  ;

fifo u1(.clk(clk),
    .rst_n                   (rst_n  ),
    .write_en                (write_en),
    .read_en                 (read_en),
    .data_in                 (data_in),
    .empty                   (empty  ),
    .full                    (full   ),
    .data_out                (data_out) 
);
`ifdef FSDB
initial begin
    $fsdbDumpfile("test.fsdb");
    $fsdbDumpvars;
    $fsdbDumpMDA;
end
`endif
always #5 clk = !clk;
always #10.01 data_in = $random;

initial
begin
clk = 0;
rst_n = 1;

#10
rst_n =0;

#14
rst_n = 1;
write_en = 1;

#200
write_en = 0;
read_en = 1;

#400
$finish;


end


endmodule

