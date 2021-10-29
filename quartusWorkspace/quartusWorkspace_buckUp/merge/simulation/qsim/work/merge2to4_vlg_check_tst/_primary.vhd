library verilog;
use verilog.vl_types.all;
entity merge2to4_vlg_check_tst is
    port(
        c               : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end merge2to4_vlg_check_tst;
