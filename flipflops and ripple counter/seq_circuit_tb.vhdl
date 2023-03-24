library ieee;
use ieee.std_logic_1164.all;

entity tb_seq_circuit is
end tb_seq_circuit;

architecture tb of tb_seq_circuit is

    component seq_circuit
        port (x     : in std_logic;
        	  reset : in std_logic;
              clk_1 : in std_logic;
              z     : out std_logic);
    end component;

    signal x     : std_logic;
    signal reset : std_logic;
    signal clk_1 : std_logic;
    signal z     : std_logic;

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : seq_circuit
    port map (x     => x,
    		  reset => reset,
              clk_1 => clk_1,
              z     => z);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk_1 is really your main clock signal
    clk_1 <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        reset <= '1';
        wait for TbPeriod;
        x <= '0';
        reset <='0';
        wait for TbPeriod;
        x <= '1';
        wait for TbPeriod;
        x <= '0';
        wait for TbPeriod;
        x <= '1';
        wait for TbPeriod;
        x <= '1';
        wait for TbPeriod;
        x <= '0';
        wait for TbPeriod;
        x <= '1';
        wait for TbPeriod;
        x <= '0';
        wait for TbPeriod;
        x <= '1';
        wait for TbPeriod;
        x <= '0';
        reset <='0';
        wait for TbPeriod;
        x <= '1';
        wait for TbPeriod;
        
        reset <= '1';
        wait for TbPeriod;
        x <= '1';
        reset <='0';
        wait for TbPeriod;
        x <= '0';
        wait for TbPeriod;
        x <= '1';
        wait for TbPeriod;
        x <= '1';
        wait for TbPeriod;
        x <= '0';
        wait for TbPeriod;
        x <= '1';
        wait for TbPeriod;
        x <= '0';
        wait for TbPeriod;
        x <= '1';
        wait for TbPeriod;
        x <= '0';
        wait for TbPeriod;
        x <= '1';
        reset <='0';
        wait for TbPeriod;
        x <= '0';
        wait for TbPeriod;
        
        reset <= '1';
        wait for TbPeriod;
        x <= '1';
        reset <='0';
        wait for TbPeriod;
        x <= '0';
        wait for TbPeriod;
        x <= '1';
        wait for TbPeriod;
        x <= '1';
        wait for TbPeriod;
        x <= '1';
        wait for TbPeriod;
        x <= '0';
        wait for TbPeriod;
        x <= '1';
        wait for TbPeriod;
        x <= '0';
        wait for TbPeriod;
        x <= '0';
        wait for TbPeriod;
        x <= '1';
        reset <='0';
        wait for TbPeriod;
        x <= '0';
        wait for TbPeriod;
        

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;