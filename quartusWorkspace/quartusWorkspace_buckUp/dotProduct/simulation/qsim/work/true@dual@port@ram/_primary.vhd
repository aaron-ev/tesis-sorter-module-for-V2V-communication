library verilog;
use verilog.vl_types.all;
entity trueDualPortRam is
    port(
        din_a           : in     vl_logic_vector(15 downto 0);
        din_b           : in     vl_logic_vector(15 downto 0);
        we_a            : in     vl_logic;
        we_b            : in     vl_logic;
        clk             : in     vl_logic;
        w_addr_a        : in     vl_logic_vector(6 downto 0);
        r_addr_a        : in     vl_logic_vector(6 downto 0);
        w_addr_b        : in     vl_logic_vector(6 downto 0);
        r_addr_b        : in     vl_logic_vector(6 downto 0);
        dout_a          : out    vl_logic_vector(15 downto 0);
        dout_b          : out    vl_logic_vector(15 downto 0)
    );
end trueDualPortRam;
