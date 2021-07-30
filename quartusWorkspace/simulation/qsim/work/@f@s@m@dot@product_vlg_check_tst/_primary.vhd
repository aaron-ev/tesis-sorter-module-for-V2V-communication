library verilog;
use verilog.vl_types.all;
entity FSMDotProduct_vlg_check_tst is
    port(
        addr            : in     vl_logic_vector(2 downto 0);
        we              : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end FSMDotProduct_vlg_check_tst;
