library verilog;
use verilog.vl_types.all;
entity ctrlUnitDotProduct_vlg_sample_tst is
    port(
        M               : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        start           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end ctrlUnitDotProduct_vlg_sample_tst;
