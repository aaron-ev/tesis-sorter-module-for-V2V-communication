library verilog;
use verilog.vl_types.all;
entity smallSorter is
    port(
        d1              : in     vl_logic_vector(7 downto 0);
        d2              : in     vl_logic_vector(7 downto 0);
        d3              : in     vl_logic_vector(7 downto 0);
        d4              : in     vl_logic_vector(7 downto 0);
        d               : out    vl_logic_vector(31 downto 0)
    );
end smallSorter;
