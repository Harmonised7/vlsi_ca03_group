----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2022 10:30:36
-- Design Name: 
-- Module Name: harrys_or_gate_5 - Behavioral
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

entity harrys_or_gate_5 is
    Port ( A, B, C, D, E : in STD_LOGIC;
           Z : out STD_LOGIC);
end harrys_or_gate_5;

architecture harrys_gate of harrys_or_gate_5 is

begin

Z <= A or B or C or D or E;

end harrys_gate;