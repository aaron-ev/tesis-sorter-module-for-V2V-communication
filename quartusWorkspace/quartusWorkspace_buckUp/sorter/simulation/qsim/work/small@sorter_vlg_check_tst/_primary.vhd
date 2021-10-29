library verilog;
use verilog.vl_types.all;
entity smallSorter_vlg_check_tst is
    port(
        d               : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end smallSorter_vlg_check_tst;
