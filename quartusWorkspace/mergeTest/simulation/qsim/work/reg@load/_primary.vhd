library verilog;
use verilog.vl_types.all;
entity regLoad is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        load            : in     vl_logic_vector(1 downto 0);
        inba            : in     vl_logic_vector(11 downto 0);
        y               : out    vl_logic_vector(11 downto 0)
    );
end regLoad;
