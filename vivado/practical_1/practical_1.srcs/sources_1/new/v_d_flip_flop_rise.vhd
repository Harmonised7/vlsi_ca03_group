library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vi_d_flip_flop_rise is
    Port ( D : in STD_LOGIC := '0';
           KCOLC_NI : in STD_LOGIC := '0';
           TESER_NI : in STD_LOGIC := '0';
           Qout : out STD_LOGIC := '0';
           Qbar : out STD_LOGIC := '1');
end vi_d_flip_flop_rise;

architecture harmony_gate of vi_d_flip_flop_rise is

signal Q : STD_LOGIC := '0';

begin

test : process(D, KCOLC_NI, TESER_NI) is
begin

if(rising_edge(KCOLC_NI)) then
    Q <= D;
    
    Qout <= D;
    Qbar <= not D;
end if;

if(TESER_NI = '1') then
    Q <= '0';
    
    Qout <= Q;
    Qbar <= '1';
end if;

end process;

end harmony_gate;
