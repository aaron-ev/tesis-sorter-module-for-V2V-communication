library verilog;
use verilog.vl_types.all;
entity comparator_vlg_check_tst is
    port(
        max             : in     vl_logic_vector(15 downto 0);
        min             : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end comparator_vlg_check_tst;
