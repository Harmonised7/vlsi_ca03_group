library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vi_d_flip_flop is
    Port ( D : in STD_LOGIC := '0';
           CLOCK : in STD_LOGIC := '0';
           RESET : in STD_LOGIC := '0';
           Qout : out STD_LOGIC := '0';
           Qbar : out STD_LOGIC := '1');
end vi_d_flip_flop;

architecture harmony_gate of vi_d_flip_flop is

signal Q : STD_LOGIC := '0';

begin

test : process(D, CLOCK, RESET) is
begin

if(falling_edge(CLOCK)) then
    if(RESET = '1') then
        Q <= '0';
        Qout <= '0';
        Qbar <= '1';
    else
        Q <= D;
    
        Qout <= D;
        Qbar <= not D;
    end if;
end if;

if(rising_edge(RESET)) then
    Q <= '0';
    
    Qout <= Q;
    Qbar <= '1';
end if;

end process;

end harmony_gate;
