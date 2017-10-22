library verilog;
use verilog.vl_types.all;
entity main is
    port(
        go              : in     vl_logic;
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        LCD_DATA        : out    vl_logic_vector(7 downto 0);
        LCD_RW          : out    vl_logic;
        LCD_EN          : out    vl_logic;
        LCD_RS          : out    vl_logic;
        LCD_ON          : out    vl_logic
    );
end main;
