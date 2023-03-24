library ieee;
use ieee.std_logic_1164.all;
entity D_flipflop is
    port (
        clk : in std_logic;
        rst : in std_logic;
        d   : in std_logic;
        q   : out std_logic
    );
end D_flipflop;
architecture flip of D_flipflop is

    signal tmp:std_logic;

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                tmp <= '0';
                
            else
                tmp <= d;
                
            end if;
        end if;
    end process;
q <= tmp;
end architecture;
-------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity bcd_counter is
    port (
        clk : in std_logic;
        rst : in std_logic;
        x   : in std_logic;
        z   : out std_logic_vector(3 downto 0)
    );
end bcd_counter;

architecture count of bcd_counter is
    component D_flipflop is
        port (
            clk : in std_logic;
            rst : in std_logic;
            d   : in std_logic;
            q   : out std_logic
        );
    end component;
    signal q1,q2,q3,q4: std_logic;
    signal xb,q1b,q2b,q3b,q4b: std_logic;
    signal d1,d2,d3,d4: std_logic;

begin
    xb <= not x;
    q1b <= not q1;
    q2b <= not q2;
    q3b <= not q3;
    q4b <= not q4;
    d1 <= (xb and q1 and q4b)or(x and q1 and q4)or(xb and q2 and q3 and q4)or(x and q1b and q2b and q3b and q4b);
    d2 <= (xb and q2 and q3b)or(q2 and q3 and q4b)or(x and q2 and q4)or(x and q1 and q4b)or(xb and q2b and q3 and q4);
    d3 <= (xb and q3 and q4b)or(x and q3 and q4)or(x and q1 and q4b)or(xb and q1b and q3b and q4)or(x and q2 and q3b and q4b);
    d4 <= q4b;
    f_1: D_flipflop port map(clk,rst,d1,q1);
    f_2: D_flipflop port map(clk,rst,d2,q2);
    f_3: D_flipflop port map(clk,rst,d3,q3);
    f_4: D_flipflop port map(clk,rst,d4,q4);
    z(3) <= q1;
    z(2) <= q2;
    z(1) <= q3;
    z(0) <= q4;

end architecture;