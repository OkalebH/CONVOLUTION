library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Registro_IMG is
	Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           wr : in  STD_LOGIC;
           rd : in  STD_LOGIC;
			  din : in STD_LOGIC_VECTOR(23 downto 0);
           full : out  STD_LOGIC;
           empty : out  STD_LOGIC;
           dout: out  STD_LOGIC_VECTOR (23 downto 0)
			  );
end Registro_IMG;

architecture Behavioral of Registro_IMG is
	COMPONENT controlador_RIMG
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		rd : IN std_logic;
		wr : IN std_logic;          
		full : OUT std_logic;
		empty : OUT std_logic;
		w_addr : OUT std_logic_vector(3 downto 0);
		r_addr : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	COMPONENT RAM_IMG
	PORT(
		clk : IN std_logic;
		we : IN std_logic;
		w_addr : IN std_logic_vector(3 downto 0);
		r_addr : IN std_logic_vector(3 downto 0);
		din : IN std_logic_vector(23 downto 0);          
		dout : OUT std_logic_vector(23 downto 0)
		);
	END COMPONENT;

signal s_and, x_full: std_logic;
signal x_w, x_r : std_logic_vector(3 downto 0);
	
begin
s_and <= wr and not x_full;
full <= x_full;

Controller_RIMG: controlador_RIMG PORT MAP(
		clk => clk,
		reset => rst,
		rd => rd,
		wr => wr,
		full => x_full,
		empty => empty,
		w_addr => x_w,
		r_addr => x_r
	);
	
memRAM_IMG: RAM_IMG PORT MAP(
		clk => clk,
		we => s_and,
		w_addr => x_w,
		r_addr => x_r,
		din => din,
		dout => dout
	);

end Behavioral;

