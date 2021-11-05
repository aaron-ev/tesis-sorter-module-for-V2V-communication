library verilog;
use verilog.vl_types.all;
entity m_2to4 is
    port(
        inba            : in     vl_logic_vector(15 downto 0);
        c               : out    vl_logic_vector(15 downto 0);
        a1_t            : out    vl_logic_vector(3 downto 0);
        b1_t            : out    vl_logic_vector(3 downto 0);
        a2_t            : out    vl_logic_vector(3 downto 0);
        b2_t            : out    vl_logic_vector(3 downto 0)
    );
end m_2to4;
