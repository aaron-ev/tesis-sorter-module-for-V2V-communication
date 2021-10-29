library verilog;
use verilog.vl_types.all;
entity sortingNetwork4_vlg_check_tst is
    port(
        y0              : in     vl_logic_vector(15 downto 0);
        y1              : in     vl_logic_vector(15 downto 0);
        y2              : in     vl_logic_vector(15 downto 0);
        y3              : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end sortingNetwork4_vlg_check_tst;
