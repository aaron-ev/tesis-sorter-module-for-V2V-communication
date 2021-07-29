library verilog;
use verilog.vl_types.all;
entity complexMul_vlg_sample_tst is
    port(
        aImag           : in     vl_logic_vector(7 downto 0);
        aReal           : in     vl_logic_vector(7 downto 0);
        bImag           : in     vl_logic_vector(7 downto 0);
        bReal           : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end complexMul_vlg_sample_tst;
