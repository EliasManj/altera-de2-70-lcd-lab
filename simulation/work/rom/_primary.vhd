library verilog;
use verilog.vl_types.all;
entity rom is
    port(
        clk             : in     vl_logic;
        addr            : in     vl_logic_vector(5 downto 0);
        data            : out    vl_logic_vector(31 downto 0)
    );
end rom;
