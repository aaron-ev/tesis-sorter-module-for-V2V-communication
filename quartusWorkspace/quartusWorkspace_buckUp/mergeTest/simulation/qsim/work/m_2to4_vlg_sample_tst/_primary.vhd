library verilog;
use verilog.vl_types.all;
entity m_2to4_vlg_sample_tst is
    port(
        inba            : in     vl_logic_vector(15 downto 0);
        sampler_tx      : out    vl_logic
    );
end m_2to4_vlg_sample_tst;
