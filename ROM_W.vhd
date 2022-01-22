library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ROM_W is
    Port ( w00 : out  STD_LOGIC_VECTOR (23 downto 0);
           w01 : out  STD_LOGIC_VECTOR (23 downto 0);
           w02 : out  STD_LOGIC_VECTOR (23 downto 0);
           w10 : out  STD_LOGIC_VECTOR (23 downto 0);
           w11 : out  STD_LOGIC_VECTOR (23 downto 0);
           w12 : out  STD_LOGIC_VECTOR (23 downto 0);
           w20 : out  STD_LOGIC_VECTOR (23 downto 0);
           w21 : out  STD_LOGIC_VECTOR (23 downto 0);
           w22 : out  STD_LOGIC_VECTOR (23 downto 0));
end ROM_W;

architecture Behavioral of ROM_W is
type ROM is array(natural range <>) of std_logic_vector(23 downto 0); 

constant ws : ROM(0 to 8) := (x"3de38e",
										x"3de38e",
										x"3de38e",
										x"3de38e",
										x"3de38e",
										x"3de38e",
										x"3de38e",
										x"3de38e",
										x"3de38e"
										);  
begin

w00 <= ws(0);w01 <= ws(1);w02 <= ws(2);
w10 <= ws(3);w11 <= ws(4);w12 <= ws(5);
w20 <= ws(6);w21 <= ws(7);w22 <= ws(8);

end Behavioral;

