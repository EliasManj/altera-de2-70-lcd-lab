module lcd_driver(
	input clk,
	input init,
	input [7:0] db,
	input rst,
	input rw_in,
	output logic init_done,
	output logic rs,
	output logic en,
	output logic rw,
	output logic on,
	output logic en_out,
	output logic [7:0] db_out
);

logic [8:0] counter;
logic counter_rst;
logic counter_ld;
logic in_mid_high1;
//logic en_out;
logic entmp;
logic enf, enff;

lcd_en_clk en_clk(.rst(rst), .init_en(init), .clk(clk), .en(en_out), .in_mid_high(in_mid_high1));

enum logic [3:0] {IDLE, PASS, START_EN, WAIT, DISPLAY_OFF, DISPLAY_CLR, DISPLAY_ON, SET_WRITE, FIRST_LINE, CHANGE0, SECOND_LINE, CHANGE1, DONE} state, nxt_state;

always_comb counter_rst = ((state == IDLE | state == SET_WRITE | state == CHANGE0 | state == CHANGE1 | state == START_EN));
always_comb counter_ld = ((state == FIRST_LINE) | (state == SECOND_LINE) | (state == WAIT)|(state == START_EN)|(state == PASS));
always_comb entmp = (state == IDLE|state == PASS|state == START_EN)? 1'b0 : (state == DONE)? 1'b0 : en_out;
always_comb rw = rw_in;
always_comb on =(state != IDLE);

//data bus
logic db_ld;
logic db_rst;

always_comb db_rst = (state == IDLE);
always_comb db_ld = (state != IDLE);

//initial
always_ff @(posedge clk) begin
	enf  <= entmp;
	enff <= enf;
	en   <= enff;
end

//State
always_comb begin
	case (state)
		IDLE 	 	: nxt_state = (init)? PASS : IDLE;
		PASS 	 	: nxt_state = (counter == 6)? START_EN : PASS;
		START_EN 	: nxt_state = WAIT;
		WAIT 	 	: nxt_state = (counter==3)? DISPLAY_OFF : WAIT;
		DISPLAY_OFF : nxt_state = DISPLAY_CLR;
		DISPLAY_CLR	: nxt_state = DISPLAY_ON;
		DISPLAY_ON  : nxt_state = SET_WRITE;
		SET_WRITE	: nxt_state = FIRST_LINE;
		FIRST_LINE	: nxt_state = (counter==15)? CHANGE0 : FIRST_LINE;
		CHANGE0		: nxt_state = SECOND_LINE;
		SECOND_LINE : nxt_state = (counter==15)? CHANGE1 : SECOND_LINE;
		CHANGE1		: nxt_state = DONE;
		DONE		: nxt_state = DONE;
	endcase
end

//State
always_ff @(posedge en_out or posedge rst)
	state <= (rst)? IDLE : nxt_state;

//data bus
always_comb begin
 case (state)
		IDLE 	 	: db_out = 8'h38;
		PASS 	 	: db_out = 8'h38;
		START_EN 	: db_out = 8'h38;
		WAIT 	 	: db_out = 8'h38;
		DISPLAY_OFF : db_out = 8'h08;
		DISPLAY_CLR	: db_out = 8'h01;
		DISPLAY_ON  : db_out = 8'h0E;
		SET_WRITE	: db_out = 8'h06;
		FIRST_LINE	: db_out = db;
		CHANGE0		: db_out = 8'hC0;
		SECOND_LINE : db_out = db;
		CHANGE1		: db_out = 8'h02;
		DONE		: db_out = 8'h02;
	endcase
end
	
//counter
always_ff @(posedge en_out or posedge rst) begin
	if (rst)
		counter <= 0;
	else if (counter_rst)
		counter <= 0;
	else if (counter_ld)
		counter <= counter + 9'd1;
end


always_comb init_done = (state == FIRST_LINE)|(state == CHANGE0)|(state == SECOND_LINE)|(state == CHANGE1);
	

always_comb rs = (state == FIRST_LINE)|(state == SECOND_LINE);
	
endmodule
