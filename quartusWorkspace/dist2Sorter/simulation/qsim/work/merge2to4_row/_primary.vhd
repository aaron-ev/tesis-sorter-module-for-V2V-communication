library verilog;
use verilog.vl_types.all;
entity merge2to4_row is
    port(
        c               : out    vl_logic_vector(31 downto 0);
        a               : in     vl_logic_vector(3 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        load            : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0)
    );
end merge2to4_row;
