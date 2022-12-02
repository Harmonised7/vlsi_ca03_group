----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/28/2022 01:07:55 PM
-- Design Name: 
-- Module Name: vi_ripple_5 - harmony_gate
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vi_ripple_5 is
    Port (
        CLOCK : in STD_LOGIC := '0';
        Q0 : out STD_LOGIC := '0';
        Q1 : out STD_LOGIC := '0';
        Q2 : out STD_LOGIC := '0'
    );
end vi_ripple_5;

architecture harmony_gate of vi_ripple_5 is

signal RESET : std_logic := '0';
signal sQ0 : std_logic := '0';
signal sQ1 : std_logic := '0';
signal sQ2 : std_logic := '0';

component vi_t_flip_flop is
    Port ( FLIP, RESET : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

begin
flip0:vi_t_flip_flop port map (CLOCK, RESET, sQ0);
flip1:vi_t_flip_flop port map (sQ0, RESET, sQ1);
flip2:vi_t_flip_flop port map (sQ1, RESET, sQ2);

RESET <= not sQ0 and sQ1 and sQ2;

Q0 <= sQ0;
Q1 <= sQ1;
Q2 <= sQ2;

end harmony_gate;
