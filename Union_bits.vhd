library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Union_bits is
    Port ( s : in  STD_LOGIC;
           exp : in  STD_LOGIC_VECTOR (7 downto 0);
           frac : in  STD_LOGIC_VECTOR (14 downto 0);
           num : out  STD_LOGIC_VECTOR (23 downto 0));
end Union_bits;

architecture Behavioral of Union_bits is

begin
num <= s&exp&frac;

end Behavioral;

