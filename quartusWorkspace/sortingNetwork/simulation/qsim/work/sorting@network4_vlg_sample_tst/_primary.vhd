library verilog;
use verilog.vl_types.all;
entity sortingNetwork4_vlg_sample_tst is
    port(
        a0              : in     vl_logic_vector(15 downto 0);
        a1              : in     vl_logic_vector(15 downto 0);
        a2              : in     vl_logic_vector(15 downto 0);
        a3              : in     vl_logic_vector(15 downto 0);
        sampler_tx      : out    vl_logic
    );
end sortingNetwork4_vlg_sample_tst;
