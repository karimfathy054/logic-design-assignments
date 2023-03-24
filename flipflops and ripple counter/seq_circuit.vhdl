

library IEEE;
use IEEE.std_logic_1164.all;
entity seq_circuit is
  port (
    x,reset:in std_logic;
    clk_1:in std_logic;
    z:out std_logic
  ) ;
end seq_circuit;

architecture work of seq_circuit is
component D_flip_flop is
    port(
    	D:in std_logic;
        clk:in std_logic;
        Q:out std_logic);
end component;
    signal q1 :std_logic:='0';
    signal q2 :std_logic:='0';
    signal d1,d2 :std_logic;

begin
d1 <= (x xor q1) and (not reset);
d2 <= (x xnor q2) and (not reset);
F_1:D_flip_flop  port map(d1,clk_1,q1);
F_2:D_flip_flop  port map(d2,clk_1,q2);

z <= (not q1) or (not q2);

end work ; -- work
----------------------------------------------------------------
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
--------------------------------------------------------------

---------------------------------------------------------------------