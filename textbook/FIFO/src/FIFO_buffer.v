module fifo(clk,rst_n,write_en,read_en,data_in,empty,full,data_out);

input clk;
input rst_n;
input write_en;
input read_en;

input [7:0] data_in;

output empty;
output full;
output  reg [7:0] data_out;

reg [7:0] data  [0:15];


reg [4:0] wr_point;
reg [4:0] rd_point;

wire [4:0] wr_gray_point;
wire [4:0] rd_gray_point;

assign wr_gray_point = wr_point ^ (wr_point>>1);
assign rd_gray_point = rd_point ^ (rd_point>>1);

assign empty = (wr_gray_point == rd_gray_point) ? 1 : 0;
assign full =  (wr_gray_point[2:0] == rd_gray_point[2:0]
                && wr_gray_point[4] == !rd_gray_point[4]
                && wr_gray_point[3] == !rd_gray_point[3] ) ? 1 : 0 ;

always@(posedge clk or negedge rst_n)
if(!rst_n)
        wr_point <= 5'b0_0000;
else if (write_en && !full)
        begin
        if(wr_point < 5'b1_1111)
        wr_point <= wr_point + 1'b1;
        else
        wr_point <= 5'b0_0000;
        end
else
        wr_point <= wr_point;

always@(posedge clk or negedge rst_n)
if(!rst_n)
        rd_point <= 5'd0;
else if (read_en && !empty)
        begin
        if(rd_point <5'b1_1111)
        rd_point <= rd_point + 1'b1;
        else
        rd_point <= 5'b0_0000;
        end
else
        rd_point <= rd_point;


always@(posedge clk)
if(write_en && !full)
data[wr_point] <= data_in;
else
data[wr_point] <= data[wr_point];

always@(posedge clk or negedge rst_n)
if(!rst_n)
data_out <= 8'h00;
else if(read_en && !empty)
data_out <= data[rd_point];
else
data_out <= 8'h00;
endmodule


