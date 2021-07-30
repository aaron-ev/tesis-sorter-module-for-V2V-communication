library verilog;
use verilog.vl_types.all;
entity ctrlUnitDotProduct_vlg_check_tst is
    port(
        addr            : in     vl_logic_vector(2 downto 0);
        done            : in     vl_logic;
        we              : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ctrlUnitDotProduct_vlg_check_tst;
