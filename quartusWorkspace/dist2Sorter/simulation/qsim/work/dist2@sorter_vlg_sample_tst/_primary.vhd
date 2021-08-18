library verilog;
use verilog.vl_types.all;
entity dist2Sorter_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        inaImag         : in     vl_logic_vector(7 downto 0);
        inaReal         : in     vl_logic_vector(7 downto 0);
        inbImag         : in     vl_logic_vector(7 downto 0);
        inbReal         : in     vl_logic_vector(7 downto 0);
        incImag         : in     vl_logic_vector(7 downto 0);
        incReal         : in     vl_logic_vector(7 downto 0);
        indImag         : in     vl_logic_vector(7 downto 0);
        indReal         : in     vl_logic_vector(7 downto 0);
        rst             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end dist2Sorter_vlg_sample_tst;
