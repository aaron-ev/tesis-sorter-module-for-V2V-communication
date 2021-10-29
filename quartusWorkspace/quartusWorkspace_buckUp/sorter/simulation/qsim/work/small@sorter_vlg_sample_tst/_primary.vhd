library verilog;
use verilog.vl_types.all;
entity smallSorter_vlg_sample_tst is
    port(
        d1              : in     vl_logic_vector(7 downto 0);
        d2              : in     vl_logic_vector(7 downto 0);
        d3              : in     vl_logic_vector(7 downto 0);
        d4              : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end smallSorter_vlg_sample_tst;
