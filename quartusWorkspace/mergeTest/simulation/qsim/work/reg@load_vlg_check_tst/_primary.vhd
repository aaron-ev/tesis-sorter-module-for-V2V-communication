library verilog;
use verilog.vl_types.all;
entity regLoad_vlg_check_tst is
    port(
        y               : in     vl_logic_vector(11 downto 0);
        sampler_rx      : in     vl_logic
    );
end regLoad_vlg_check_tst;
