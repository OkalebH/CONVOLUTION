library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity md_union is
Port ( s : in  STD_LOGIC;
           exp : in  STD_LOGIC_VECTOR (7 downto 0);
           frac : in  STD_LOGIC_VECTOR (14 downto 0);
           num : out  STD_LOGIC_VECTOR (23 downto 0));
end md_union;

architecture Behavioral of md_union is

begin
num <= s&exp&frac;

end Behavioral;

