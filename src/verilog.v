module led(
input sys_clk,
input sys_rst_n,
output reg [2:0] led    //110>greeen, 101>red, 011>blue
);

reg [31:0] counter;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        counter <= 32'd0;
    else if (counter < 32'd72900_0000)
        counter <= counter + 1;
    else
        counter <= 32'd0;
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        led <= 3'b101;
    else if (counter == 32'd1)          //red
        led <= 3'b101;
    else if (counter == 32'd54000_0000) //green
        led <= 3'b110;
    else if (counter == 32'd67500_0000)//blue
        led <= 3'b011;
    else
        led <= led;
end
endmodule