----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2022 12:22:41
-- Design Name: 
-- Module Name: harrys_inverter_gate - harrys_gate
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

entity harrys_inverter_gate is
    Port ( A : in STD_LOGIC;
           Z : out STD_LOGIC);
end harrys_inverter_gate;

architecture harrys_gate of harrys_inverter_gate is

begin

Z <= not A;

end harrys_gate;
