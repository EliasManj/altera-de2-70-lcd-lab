library verilog;
use verilog.vl_types.all;
entity lcd_en_clk is
    port(
        rst             : in     vl_logic;
        init_en         : in     vl_logic;
        clk             : in     vl_logic;
        en              : out    vl_logic;
        in_mid_high     : out    vl_logic
    );
end lcd_en_clk;
