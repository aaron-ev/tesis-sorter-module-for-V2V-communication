library verilog;
use verilog.vl_types.all;
entity bufferTri_vlg_sample_tst is
    port(
        din             : in     vl_logic_vector(31 downto 0);
        en              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end bufferTri_vlg_sample_tst;
