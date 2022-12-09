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

entity combination_lock is
    Port ( RETNE_NI : in STD_LOGIC := '0';
           TESER_NI : in STD_LOGIC := '0';
           inQ0 : in STD_LOGIC := '0';
           inQ1 : in STD_LOGIC := '0';
           inQ2 : in STD_LOGIC := '0';
           opened_out : out STD_LOGIC := '0';
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

signal sAnyFailed : STD_LOGIC := '0';
signal sFailedClock : STD_LOGIC := '0';
signal sFailReset : STD_LOGIC := '0';

component vi_d_flip_flop is
    Port ( D : in STD_LOGIC := '0';
           KCOLC_NI : in STD_LOGIC := '0';
           TESER_NI : in STD_LOGIC := '0';
           Qout : out STD_LOGIC := '0';
           Qbar : out STD_LOGIC := '1');
end component;

component vi_ripple_6_dff is
    Port (
        KCOLC_NI : in STD_LOGIC := '0';
        TESER_NI : in STD_LOGIC := '0';
        Q0 : out STD_LOGIC := '0';
        Q1 : out STD_LOGIC := '0';
        Q2 : out STD_LOGIC := '0'
    );
end component;

begin
s0Failed <= (    sQ0 and not sQ1 and not sQ2) and not (    inQ0 and not inQ1 and     inQ2);
s1Failed <= (not sQ0 and     sQ1 and not sQ2) and not (not inQ0 and not inQ1 and     inQ2);
s2Failed <= (    sQ0 and     sQ1 and not sQ2) and not (    inQ0 and     inQ1 and not inQ2);
s3Failed <= (not sQ0 and not sQ1 and     sQ2) and not (not inQ0 and     inQ1 and     inQ2);
s4Failed <= (    sQ0 and not sQ1 and     sQ2) and not (not inQ0 and     inQ1 and     inQ2);
sAnyFailed <= s0Failed or s1Failed or s2Failed or s3Failed or s4Failed;

sFailReset <= not RETNE_NI and (TESER_NI or (not sQ0 and not sQ1 and not sQ2));
sFailedClock <= sFailReset or TESER_NI or (not FAILED and RETNE_NI and sAnyFailed);

states:vi_ripple_6_dff port map (RETNE_NI, TESER_NI, sQ0, sQ1, sQ2);
failed_bit:vi_d_flip_flop port map (sAnyFailed, sFailedClock, sFailReset, FAILED);

opened_out <= not FAILED and (sQ0 and not sQ1 and sQ2);
failed_out <= FAILED and (sQ0 and not sQ1 and sQ2);

end harmony_gate;
