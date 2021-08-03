library verilog;
use verilog.vl_types.all;
entity dist2_vlg_check_tst is
    port(
        outaDist        : in     vl_logic_vector(15 downto 0);
        outbDist        : in     vl_logic_vector(15 downto 0);
        outcDist        : in     vl_logic_vector(15 downto 0);
        outdDist        : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end dist2_vlg_check_tst;
