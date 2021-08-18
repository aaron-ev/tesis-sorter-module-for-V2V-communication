library verilog;
use verilog.vl_types.all;
entity merge8to16 is
    port(
        a               : in     vl_logic_vector(23 downto 0);
        b               : in     vl_logic_vector(23 downto 0);
        c               : out    vl_logic_vector(47 downto 0)
    );
end merge8to16;
