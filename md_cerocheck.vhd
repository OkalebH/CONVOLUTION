library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity md_cerocheck is
	 Port ( num_1 : in  STD_LOGIC_VECTOR (23 downto 0);
           num_2 : in  STD_LOGIC_VECTOR (23 downto 0);
			  num_i : out STD_LOGIC_VECTOR(23 downto 0);
           flag : out  STD_LOGIC_VECTOR(1 downto 0));
end md_cerocheck;

architecture Behavioral of md_cerocheck is

begin
process(num_1,num_2)
	begin
		if(num_1(22 downto 0) = "00000000000000000000000" or num_2(22 downto 0) = "00000000000000000000000") then
			flag <= "01";
		elsif(num_1 = x"3F8000") then
			num_i <= num_2;
			flag <= "10";
		elsif(num_2 = x"3F8000") then
			num_i <= num_1;
			flag <= "10";
		elsif(num_1 = x"BF8000") then 
			num_i <= num_2;
			num_i(23) <= '1';
			flag <= "10";
		elsif(num_2 = x"BF8000") then 
			num_i <= num_1;
			num_i(23) <= '1';
			flag<="10";
		else
			flag <= "00";
		end if;
	end process;

end Behavioral;

