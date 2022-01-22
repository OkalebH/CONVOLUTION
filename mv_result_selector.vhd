library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mv_result_selector is
Port ( flag : in  STD_LOGIC_VECTOR(1 downto 0);
           num : in  STD_LOGIC_VECTOR (23 downto 0);
			  num_1 : in STD_LOGIC_VECTOR (23 downto 0);
           num_o : out  STD_LOGIC_VECTOR (23 downto 0));
end mv_result_selector;

architecture Behavioral of mv_result_selector is

begin
process(flag,num)
	begin
		if(flag = "01") then
			num_o <= "000000000000000000000000";
		elsif(flag = "10") then
			num_o <= num_1;
		else
			num_o <= num;
		end if;
	end process;

end Behavioral;

