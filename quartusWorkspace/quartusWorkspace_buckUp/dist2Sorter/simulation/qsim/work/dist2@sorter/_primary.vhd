library verilog;
use verilog.vl_types.all;
entity dist2Sorter is
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
        load            : in     vl_logic_vector(3 downto 0);
        c1              : out    vl_logic_vector(7 downto 0);
        c2              : out    vl_logic_vector(7 downto 0);
        c3              : out    vl_logic_vector(7 downto 0);
        c4              : out    vl_logic_vector(7 downto 0);
        c5              : out    vl_logic_vector(7 downto 0);
        c6              : out    vl_logic_vector(7 downto 0);
        c7              : out    vl_logic_vector(7 downto 0);
        c8              : out    vl_logic_vector(7 downto 0);
        c9              : out    vl_logic_vector(7 downto 0);
        c10             : out    vl_logic_vector(7 downto 0);
        c11             : out    vl_logic_vector(7 downto 0);
        c12             : out    vl_logic_vector(7 downto 0);
        c13             : out    vl_logic_vector(7 downto 0);
        c14             : out    vl_logic_vector(7 downto 0);
        c15             : out    vl_logic_vector(7 downto 0);
        c16             : out    vl_logic_vector(7 downto 0)
    );
end dist2Sorter;
