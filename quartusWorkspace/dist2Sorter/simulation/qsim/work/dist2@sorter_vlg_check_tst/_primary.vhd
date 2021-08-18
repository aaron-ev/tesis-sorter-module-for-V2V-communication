library verilog;
use verilog.vl_types.all;
entity dist2Sorter_vlg_check_tst is
    port(
        y0              : in     vl_logic_vector(7 downto 0);
        y1              : in     vl_logic_vector(7 downto 0);
        y2              : in     vl_logic_vector(7 downto 0);
        y3              : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end dist2Sorter_vlg_check_tst;
