library verilog;
use verilog.vl_types.all;
entity ctrlUnitDotProduct is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        start           : in     vl_logic;
        M               : in     vl_logic_vector(1 downto 0);
        we              : out    vl_logic;
        outAddrReal     : out    vl_logic_vector(6 downto 0);
        outAddrImag     : out    vl_logic_vector(6 downto 0);
        done            : out    vl_logic
    );
end ctrlUnitDotProduct;
