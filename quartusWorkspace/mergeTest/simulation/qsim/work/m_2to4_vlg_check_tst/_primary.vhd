library verilog;
use verilog.vl_types.all;
entity m_2to4_vlg_check_tst is
    port(
        a1_t            : in     vl_logic_vector(3 downto 0);
        a2_t            : in     vl_logic_vector(3 downto 0);
        b1_t            : in     vl_logic_vector(3 downto 0);
        b2_t            : in     vl_logic_vector(3 downto 0);
        c               : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end m_2to4_vlg_check_tst;
