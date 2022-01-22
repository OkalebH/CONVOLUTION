library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--Direccion 2^3 = 8
--Datos = 2^3 = 8


entity RAM_IMG is
	Port ( 
			  clk : in  STD_LOGIC;
           we : in  STD_LOGIC;
           w_addr : in  STD_LOGIC_VECTOR (3 downto 0);
			  r_addr : in  STD_LOGIC_VECTOR (3 downto 0);
           din : in  STD_LOGIC_VECTOR (23 downto 0);
			  dout : out  STD_LOGIC_VECTOR(23  downto 0)
			);
end RAM_IMG;

architecture Behavioral of RAM_IMG is
type ram_type is array (15 downto 0) --16 Filas
	of std_logic_vector(23 downto 0); --datos de 24 bits
signal ram : ram_type; 					--100 datos de 24 bits *
begin
	-----Register-------------
	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (we = '1')then
				ram(to_integer(unsigned(w_addr))) <= din;
			end if;
		end if;
	end process;
	dout <= ram(to_integer(unsigned(r_addr)));
end Behavioral;
