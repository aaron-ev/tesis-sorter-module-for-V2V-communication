library verilog;
use verilog.vl_types.all;
entity merge8to16_vlg_check_tst is
    port(
        c               : in     vl_logic_vector(47 downto 0);
        sampler_rx      : in     vl_logic
    );
end merge8to16_vlg_check_tst;
