library verilog;
use verilog.vl_types.all;
entity trueDualPortRam_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        din_a           : in     vl_logic_vector(15 downto 0);
        din_b           : in     vl_logic_vector(15 downto 0);
        r_addr_a        : in     vl_logic_vector(6 downto 0);
        r_addr_b        : in     vl_logic_vector(6 downto 0);
        w_addr_a        : in     vl_logic_vector(6 downto 0);
        w_addr_b        : in     vl_logic_vector(6 downto 0);
        we_a            : in     vl_logic;
        we_b            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end trueDualPortRam_vlg_sample_tst;
