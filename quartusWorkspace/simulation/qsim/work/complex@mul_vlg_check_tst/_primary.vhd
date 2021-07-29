library verilog;
use verilog.vl_types.all;
entity complexMul_vlg_check_tst is
    port(
        outImag         : in     vl_logic_vector(7 downto 0);
        outReal         : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end complexMul_vlg_check_tst;
