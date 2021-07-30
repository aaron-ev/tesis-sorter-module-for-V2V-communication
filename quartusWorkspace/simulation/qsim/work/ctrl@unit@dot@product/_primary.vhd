library verilog;
use verilog.vl_types.all;
entity ctrlUnitDotProduct is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        start           : in     vl_logic;
        we              : out    vl_logic;
        addr            : out    vl_logic_vector(2 downto 0);
        done            : out    vl_logic
    );
end ctrlUnitDotProduct;
