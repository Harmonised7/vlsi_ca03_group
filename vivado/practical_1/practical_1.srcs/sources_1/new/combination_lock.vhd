----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2022 12:44:53 PM
-- Design Name: 
-- Module Name: combination_lock - harmony_gate
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity combination_lock is
    Port ( ENTER : in STD_LOGIC := '0';
           RESET : in STD_LOGIC := '0';
           inQ0 : in STD_LOGIC := '0';
           inQ1 : in STD_LOGIC := '0';
           inQ2 : in STD_LOGIC := '0';
           opened : out STD_LOGIC := '0';
           failed_out : out STD_LOGIC := '0'
    );
end combination_lock;

architecture harmony_gate of combination_lock is

signal FAILED : STD_LOGIC := '0';
signal sQ0 : STD_LOGIC := '0';
signal sQ1 : STD_LOGIC := '0';
signal sQ2 : STD_LOGIC := '0';

signal s0Failed : STD_LOGIC := '0';
signal s1Failed : STD_LOGIC := '0';
signal s2Failed : STD_LOGIC := '0';
signal s3Failed : STD_LOGIC := '0';
signal s4Failed : STD_LOGIC := '0';

component harrys_or_gate_5 is
    Port ( A, B, C, D, E : in STD_LOGIC;
           Z : out STD_LOGIC);
end component;

begin
states:vi_ripple_5 port map (ENTER, sQ0, sQ1, sQ2);

s0Failed <= (sQ0 and not sQ1 and not sQ2) and not (inQ0 and not inQ1 and inQ2);
s1Failed <= (not sQ0 and sQ1 and not sQ2) and not (not inQ0 and inQ1 and inQ2);
s2Failed <= (sQ0 and sQ1 and not sQ2) and not (inQ0 and inQ1 and not inQ2);
s3Failed <= (not sQ0 and not sQ1 and sQ2) and not (not inQ0 and inQ1 and inQ2);
s4Failed <= (sQ0 and not sQ1 and sQ2) and not (not inQ0 and inQ1 and inQ2);

anyFailed:harrys_or_gate_5 port map (s0Failed, s1Failed, s2Failed, s3Failed, s4Failed);

opened <= not FAILED and not ENTER and (sQ0 and not sQ1 and sQ2);
failed_out <= FAILED and not ENTER and (sQ0 and not sQ1 and sQ2);

end harmony_gate;