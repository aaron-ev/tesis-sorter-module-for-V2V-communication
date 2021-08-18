library verilog;
use verilog.vl_types.all;
entity regLoad_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        inba            : in     vl_logic_vector(11 downto 0);
        load            : in     vl_logic_vector(1 downto 0);
        rst             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end regLoad_vlg_sample_tst;
