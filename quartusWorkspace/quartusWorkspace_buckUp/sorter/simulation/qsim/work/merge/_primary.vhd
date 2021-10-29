library verilog;
use verilog.vl_types.all;
entity merge is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        d1              : in     vl_logic_vector(7 downto 0);
        d2              : in     vl_logic_vector(7 downto 0);
        d3              : in     vl_logic_vector(7 downto 0);
        d4              : in     vl_logic_vector(7 downto 0);
        load            : in     vl_logic_vector(3 downto 0);
        enQPSK          : in     vl_logic;
        enQAM16         : in     vl_logic;
        c               : out    vl_logic_vector(127 downto 0)
    );
end merge;
