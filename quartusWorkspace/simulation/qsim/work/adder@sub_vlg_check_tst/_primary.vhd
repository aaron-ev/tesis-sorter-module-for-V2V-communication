library verilog;
use verilog.vl_types.all;
entity adderSub_vlg_check_tst is
    port(
        carry           : in     vl_logic;
        sum             : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end adderSub_vlg_check_tst;
