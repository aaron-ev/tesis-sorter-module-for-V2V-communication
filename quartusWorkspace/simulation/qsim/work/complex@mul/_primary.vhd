library verilog;
use verilog.vl_types.all;
entity complexMul is
    port(
        aReal           : in     vl_logic_vector(7 downto 0);
        aImag           : in     vl_logic_vector(7 downto 0);
        bReal           : in     vl_logic_vector(7 downto 0);
        bImag           : in     vl_logic_vector(7 downto 0);
        outReal         : out    vl_logic_vector(7 downto 0);
        outImag         : out    vl_logic_vector(7 downto 0)
    );
end complexMul;
