library verilog;
use verilog.vl_types.all;
entity ctrlUnitDotProduct_vlg_check_tst is
    port(
        done            : in     vl_logic;
        outAddrImag     : in     vl_logic_vector(6 downto 0);
        outAddrReal     : in     vl_logic_vector(6 downto 0);
        we              : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ctrlUnitDotProduct_vlg_check_tst;
