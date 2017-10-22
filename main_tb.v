`timescale 1ns/1ps

module main_tb;

reg clk;
reg rst;
reg go;
wire [7:0] LCD_DATA;
wire LCD_RW;
wire LCD_EN;
wire LCD_RS;
wire LCD_ON;

 main myMain(
	.go(go),
	.rst(rst),
	.clk(clk),
	.LCD_DATA(LCD_DATA),
	.LCD_RW(LCD_RW),
	.LCD_EN(LCD_EN),
	.LCD_RS(LCD_RS),
	.LCD_ON(LCD_ON)
);

initial begin
	clk = 0;
	go = 0;
	rst = 1;
	#20;
	
	go = 1;
	rst = 0;
end

initial begin
    forever #18 clk=~clk;		//Every 18ns invert, Clock cycle of 36ns -> 28MHZ
end

endmodule
