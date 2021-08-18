library verilog;
use verilog.vl_types.all;
entity bufferTri is
    port(
        din             : in     vl_logic_vector(31 downto 0);
        en              : in     vl_logic;
        dout1           : out    vl_logic_vector(31 downto 0);
        dout2           : out    vl_logic_vector(31 downto 0)
    );
end bufferTri;
