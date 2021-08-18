library verilog;
use verilog.vl_types.all;
entity merge8to16_vlg_sample_tst is
    port(
        a               : in     vl_logic_vector(23 downto 0);
        b               : in     vl_logic_vector(23 downto 0);
        sampler_tx      : out    vl_logic
    );
end merge8to16_vlg_sample_tst;
