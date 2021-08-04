library verilog;
use verilog.vl_types.all;
entity sortingNetwork4 is
    port(
        a0              : in     vl_logic_vector(15 downto 0);
        a1              : in     vl_logic_vector(15 downto 0);
        a2              : in     vl_logic_vector(15 downto 0);
        a3              : in     vl_logic_vector(15 downto 0);
        y0              : out    vl_logic_vector(15 downto 0);
        y1              : out    vl_logic_vector(15 downto 0);
        y2              : out    vl_logic_vector(15 downto 0);
        y3              : out    vl_logic_vector(15 downto 0)
    );
end sortingNetwork4;
