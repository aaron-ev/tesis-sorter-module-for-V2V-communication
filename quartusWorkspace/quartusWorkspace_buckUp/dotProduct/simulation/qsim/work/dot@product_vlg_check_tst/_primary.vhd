library verilog;
use verilog.vl_types.all;
entity dotProduct_vlg_check_tst is
    port(
        done            : in     vl_logic;
        outaImag        : in     vl_logic_vector(15 downto 0);
        outaReal        : in     vl_logic_vector(15 downto 0);
        outbImag        : in     vl_logic_vector(15 downto 0);
        outbReal        : in     vl_logic_vector(15 downto 0);
        outcImag        : in     vl_logic_vector(15 downto 0);
        outcReal        : in     vl_logic_vector(15 downto 0);
        outdImag        : in     vl_logic_vector(15 downto 0);
        outdReal        : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end dotProduct_vlg_check_tst;
