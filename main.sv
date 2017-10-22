module main(
	input go,
	input rst,
	input clk,
	output [7:0] LCD_DATA,
	output LCD_RW,
	output LCD_EN,
	output LCD_RS,
	output LCD_ON
);

logic rw = 0;
//logic [7:0] db;
logic [5:0] pointer;
logic [31:0] rom_data;
logic en_out;

lcd_driver lcd(.clk(clk), .init(go), .rst(rst), .rw_in(rw), .init_done(init_done), .rs(LCD_RS),. en(LCD_EN), .rw(LCD_RW), .on(LCD_ON), .db_out(LCD_DATA), .db(rom_data[7:0]), .en_out(en_out));
rom rom0(.clk(clk), .addr(pointer), .data(rom_data));

always_ff @(posedge en_out) begin
	if(init_done)
		pointer <= pointer + 6'd1;
	else 
		pointer <= 6'd0;
end

endmodule
