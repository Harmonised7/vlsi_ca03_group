----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/28/2022 12:59:30 PM
-- Design Name: 
-- Module Name: vi_t_flip_flop - harmony_gate
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

entity vi_t_flip_flop is
    Port ( FLIP : in STD_LOGIC := '0';
           RESET : in STD_LOGIC := '0';
           Q : out STD_LOGIC := '0');
end vi_t_flip_flop;

architecture harmony_gate of vi_t_flip_flop is

signal sQ : std_logic := '0';

begin

test : process(FLIP, RESET, sQ) is
begin

if(RESET = '1') then
    sQ <= '0';
    Q <= sQ;
end if;

if(falling_edge(FLIP)) then
    if(RESET = '0') then
        sQ <= not sQ;
        Q <= not sQ;
    else
        sQ <= '0';   
        Q <= '0'; 
    end if;
end if;

end process;

end harmony_gate;
