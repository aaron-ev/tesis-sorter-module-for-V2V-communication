library verilog;
use verilog.vl_types.all;
entity trueDualPortRam_vlg_check_tst is
    port(
        dout_a          : in     vl_logic_vector(15 downto 0);
        dout_b          : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end trueDualPortRam_vlg_check_tst;
