library verilog;
use verilog.vl_types.all;
entity lcd_driver is
    port(
        clk             : in     vl_logic;
        init            : in     vl_logic;
        db              : in     vl_logic_vector(7 downto 0);
        rst             : in     vl_logic;
        rw_in           : in     vl_logic;
        init_done       : out    vl_logic;
        rs              : out    vl_logic;
        en              : out    vl_logic;
        rw              : out    vl_logic;
        \on\            : out    vl_logic;
        en_out          : out    vl_logic;
        db_out          : out    vl_logic_vector(7 downto 0)
    );
end lcd_driver;
