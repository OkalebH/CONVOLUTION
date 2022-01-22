library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Greater is
    Port ( num_1 : in  STD_LOGIC_VECTOR (23 downto 0);
           num_2 : in  STD_LOGIC_VECTOR (23 downto 0);
           s1 : out  STD_LOGIC;
           s2 : out  STD_LOGIC;
           exp1 : out  STD_LOGIC_VECTOR (7 downto 0);
           exp2 : out  STD_LOGIC_VECTOR (7 downto 0);
           frac1 : out  STD_LOGIC_VECTOR (15 downto 0);
           frac2 : out  STD_LOGIC_VECTOR (15 downto 0));
end Greater;

architecture Behavioral of Greater is
begin
	process(num_1,num_2)
	begin
		if(num_1(22 downto 0) > num_2(22 downto 0)) then
			s1 <= num_1(23);
			exp1 <= std_logic_vector(unsigned(num_1(22 downto 15)) + 1); -- se agrega un 1 por el bit oculto
			frac1 <='1' & num_1(14 downto 0); -- se agrega el bit oculto
			s2 <= num_2(23);
			exp2 <= std_logic_vector(unsigned(num_2(22 downto 15)) + 1);
			frac2 <= '1' & num_2(14 downto 0);
		else
			s1 <= num_2(23);
			exp1 <= std_logic_vector(unsigned(num_2(22 downto 15)) + 1);
			frac1 <= '1' & num_2(14 downto 0);
			s2 <= num_1(23);
			exp2 <= std_logic_vector(unsigned(num_1(22 downto 15)) + 1);
			frac2 <= '1' & num_1(14 downto 0);
		end if;
	end process;

end Behavioral;

