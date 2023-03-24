library ieee;
use ieee.std_logic_1164.all;

entity tb_bcd_counter is
end tb_bcd_counter;

architecture tb of tb_bcd_counter is

    component bcd_counter
        port (clk : in std_logic;
              rst : in std_logic;
              x   : in std_logic;
              z   : out std_logic_vector (3 downto 0));
    end component;

    signal clk : std_logic;
    signal rst : std_logic;
    signal x   : std_logic;
    signal z   : std_logic_vector (3 downto 0);

    constant TbPeriod : time := 1000 ns; 
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : bcd_counter
    port map (clk => clk,
              rst => rst,
              x   => x,
              z   => z);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    clk <= TbClock;

    stimuli : process
    begin
        x <= '0';

        -- Reset generation
        rst <= '1';
        wait for TbPeriod;
        rst <= '0';
        wait for TbPeriod;

        x <='0';
        wait for 100 * TbPeriod;
        x <='1';
        wait for 100 * TbPeriod;
        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;