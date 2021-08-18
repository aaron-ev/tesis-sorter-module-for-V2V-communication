library verilog;
use verilog.vl_types.all;
entity bufferTri_vlg_check_tst is
    port(
        dout1           : in     vl_logic_vector(31 downto 0);
        dout2           : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end bufferTri_vlg_check_tst;
