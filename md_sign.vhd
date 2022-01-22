library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity md_sign is
Port ( s1 : in  STD_LOGIC;
           s2 : in  STD_LOGIC;
           s : out  STD_LOGIC);
end md_sign;

architecture Behavioral of md_sign is

begin
s <= s1 xor s2;
end Behavioral;

