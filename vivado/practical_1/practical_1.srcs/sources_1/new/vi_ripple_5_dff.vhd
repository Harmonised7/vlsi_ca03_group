library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vi_ripple_6_dff is
    Port (
        CLOCK : in STD_LOGIC := '0';
        RESET_IN : in STD_LOGIC := '0';
        Q0 : out STD_LOGIC := '0';
        Q1 : out STD_LOGIC := '0';
        Q2 : out STD_LOGIC := '0'
    );
end vi_ripple_6_dff;

architecture harmony_gate of vi_ripple_6_dff is

signal RESET : std_logic := '0';
signal sQ0 : std_logic := '0';
signal sQ0bar : std_logic := '0';
signal sQ1 : std_logic := '0';
signal sQ1bar : std_logic := '0';
signal sQ2 : std_logic := '0';
signal sQ2bar : std_logic := '0';

component vi_d_flip_flop_rise is
    Port ( D : in STD_LOGIC := '0';
           CLOCK : in STD_LOGIC := '0';
           RESET : in STD_LOGIC := '0';
           Qout : out STD_LOGIC := '0';
           Qbar : out STD_LOGIC := '1');
end component;

--D CLOCK RESET Q Qbar
begin
flip0:vi_d_flip_flop_rise port map (sQ0bar, CLOCK, RESET, sQ0, sQ0bar);
flip1:vi_d_flip_flop_rise port map (sQ1bar, sQ0bar, RESET, sQ1, sQ1bar);
flip2:vi_d_flip_flop_rise port map (sQ2bar, sQ1bar, RESET, sQ2, sQ2bar);

RESET <= RESET_IN or (not sQ0 and sQ1 and sQ2);

Q0 <= sQ0;
Q1 <= sQ1;
Q2 <= sQ2;

end harmony_gate;


