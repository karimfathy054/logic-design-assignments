library IEEE;
use IEEE.std_logic_1164.all;

entity D_flip_flop is
	port(
    	D:in std_logic;
        clk:in std_logic;
        Q:out std_logic);
end D_flip_flop;

architecture flipflop of D_flip_flop is
    begin
        process (clk) is
            begin
                if rising_edge(clk) then
                    Q <= D;
                end if;
        end process;
end architecture;
-------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity ripple_counter is
    port (
        clk : in std_logic;
        rst : in std_logic;
        z   : out std_logic_vector(3 downto 0)

    );
end ripple_counter;
architecture arch of ripple_counter is
component D_flip_flop is
    port(
    	D:in std_logic;
        clk:in std_logic;
        Q:out std_logic);
end component;
    signal q0,q1,q2,q3:std_logic;

begin

end architecture;