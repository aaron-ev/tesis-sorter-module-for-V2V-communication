library verilog;
use verilog.vl_types.all;
entity complex2In4 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        inaReal         : in     vl_logic_vector(7 downto 0);
        inaImag         : in     vl_logic_vector(7 downto 0);
        inbReal         : in     vl_logic_vector(7 downto 0);
        inbImag         : in     vl_logic_vector(7 downto 0);
        incReal         : in     vl_logic_vector(7 downto 0);
        incImag         : in     vl_logic_vector(7 downto 0);
        indReal         : in     vl_logic_vector(7 downto 0);
        indImag         : in     vl_logic_vector(7 downto 0);
        outaReal        : out    vl_logic_vector(15 downto 0);
        outaImag        : out    vl_logic_vector(15 downto 0);
        outbReal        : out    vl_logic_vector(15 downto 0);
        outbImag        : out    vl_logic_vector(15 downto 0);
        outcReal        : out    vl_logic_vector(15 downto 0);
        outcImag        : out    vl_logic_vector(15 downto 0);
        outdReal        : out    vl_logic_vector(15 downto 0);
        outdImag        : out    vl_logic_vector(15 downto 0)
    );
end complex2In4;
