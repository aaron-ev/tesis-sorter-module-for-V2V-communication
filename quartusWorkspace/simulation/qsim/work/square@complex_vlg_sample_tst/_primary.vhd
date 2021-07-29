library verilog;
use verilog.vl_types.all;
entity squareComplex_vlg_sample_tst is
    port(
        aImag           : in     vl_logic_vector(7 downto 0);
        aReal           : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end squareComplex_vlg_sample_tst;
