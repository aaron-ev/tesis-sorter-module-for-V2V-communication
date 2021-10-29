library verilog;
use verilog.vl_types.all;
entity dist2 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        inaReal         : in     vl_logic_vector(15 downto 0);
        inaImag         : in     vl_logic_vector(15 downto 0);
        inbReal         : in     vl_logic_vector(15 downto 0);
        inbImag         : in     vl_logic_vector(15 downto 0);
        incReal         : in     vl_logic_vector(15 downto 0);
        incImag         : in     vl_logic_vector(15 downto 0);
        indReal         : in     vl_logic_vector(15 downto 0);
        indImag         : in     vl_logic_vector(15 downto 0);
        outaDist        : out    vl_logic_vector(15 downto 0);
        outbDist        : out    vl_logic_vector(15 downto 0);
        outcDist        : out    vl_logic_vector(15 downto 0);
        outdDist        : out    vl_logic_vector(15 downto 0)
    );
end dist2;
