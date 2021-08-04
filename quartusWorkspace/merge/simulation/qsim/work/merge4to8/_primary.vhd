library verilog;
use verilog.vl_types.all;
entity merge4to8 is
    port(
        a               : in     vl_logic_vector(11 downto 0);
        b               : in     vl_logic_vector(11 downto 0);
        c               : out    vl_logic_vector(23 downto 0)
    );
end merge4to8;
