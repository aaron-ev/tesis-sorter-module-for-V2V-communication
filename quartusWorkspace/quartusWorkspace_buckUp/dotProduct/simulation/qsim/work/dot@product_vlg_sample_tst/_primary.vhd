library verilog;
use verilog.vl_types.all;
entity dotProduct_vlg_sample_tst is
    port(
        M               : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        inReadAddr      : in     vl_logic_vector(6 downto 0);
        inaImag         : in     vl_logic_vector(15 downto 0);
        inaReal         : in     vl_logic_vector(15 downto 0);
        inbImag         : in     vl_logic_vector(15 downto 0);
        inbReal         : in     vl_logic_vector(15 downto 0);
        incImag         : in     vl_logic_vector(15 downto 0);
        incReal         : in     vl_logic_vector(15 downto 0);
        indImag         : in     vl_logic_vector(15 downto 0);
        indReal         : in     vl_logic_vector(15 downto 0);
        rst             : in     vl_logic;
        start           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end dotProduct_vlg_sample_tst;
