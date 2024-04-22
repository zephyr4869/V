module multifunction_counter#(   parameter   N      = 8       )
 (
    input                          clk     ,// 时钟信号
    input                          rst_n   ,// 异步复位信号
    input                          enable_cnt_up,// 向上计数使能信号
    input                          enable_cnt_dn,// 向下计数使能信号
    input                          new_cntr_preset,// 新的预设值加载信号
    input          [ N-1: 0]       new_cntr_preset_value,// 新的预设值
    input                          pause_counting,// 暂停计数信号
    output reg     [ N-1: 0]       counter ,// 计数器当前值
    output reg                     ctr_expired // 计数结束标志
);

 
    reg            [ N-1: 0]       max_value  ;// 计数器最大值或预设值

always @(posedge clk or posedge rst_n) begin
    if (!rst_n) begin
        // 异步复位逻辑
        counter <= 0;
        ctr_expired <= 0;
        max_value <= new_cntr_preset_value;
    end else begin
        if (new_cntr_preset) begin
            // 加载新的预设值
            max_value <= new_cntr_preset_value;
            counter <= (enable_cnt_dn) ? new_cntr_preset_value : 0;
        end else if (!pause_counting) begin
            // 当暂停计数信号无效时，进行计数
            if (enable_cnt_up) begin
                // 向上计数
                if (counter == max_value) begin
                    counter <= 0;                                   // 循环计数
                end else begin
                    counter <= counter + 1;
                end
            end else if (enable_cnt_dn) begin
                // 向下计数
                if (counter == 0) begin
                    counter <= max_value;                           // 循环计数
                end else begin
                    counter <= counter - 1;
                end
            end
        end
        // 不需要额外的逻辑来保持当前计数值，因为只有当pause_counting无效时，计数器的值才会改变

        // 更新计数结束标志
        ctr_expired <= (enable_cnt_up && (counter == max_value)) || (enable_cnt_dn && (counter == 0));
    end
end

endmodule