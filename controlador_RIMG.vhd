Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity controlador_RIMG is
	Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           rd : in  STD_LOGIC;
           wr : in  STD_LOGIC;
           full : out  STD_LOGIC;
           empty : out  STD_LOGIC;
           w_addr : out  STD_LOGIC_VECTOR(3 downto 0);--Direccion: 00 
           r_addr : out STD_LOGIC_VECTOR(3 downto 0));--Direccion: 00
end controlador_RIMG;

architecture Behavioral of controlador_RIMG is
	constant N : natural := 4; -- N represents the signal size wich is going to be added later
	signal w_reg, w_next : unsigned(N downto 0);
	signal r_reg, r_next : unsigned(N downto 0);
	signal f_flag, e_flag : std_logic;
begin
-----------------Registro---------------------------
	process(clk,reset)
	begin
		if reset = '1' then
			w_reg <= (others => '0');
			r_reg <= (others => '0');
		elsif (clk'event and clk = '1') then
			w_reg <= w_next;
			r_reg <= r_next;
		end if;
	end process;
---------------Write pointer next state logic-------
	w_next <= w_reg + 1 when (wr = '1' and f_flag = '0') else
				 w_reg;
	f_flag <=
		'1' when r_reg(N) /= w_reg(N) and 
		r_reg(N-1 downto 0) = w_reg(N-1 downto 0)
		else
		'0';
---------------Write port output--------------------
	w_addr <= std_logic_vector(w_reg(N-1 downto 0)); --*
	full <= f_flag;
---------------Read pointer next state logic--------
   r_next <= 
		r_reg + 1 when (rd = '1' and e_flag = '0') else
		r_reg;
	e_flag <= '1' when r_reg = w_reg else
		'0';
---------------Read port output---------------------
	r_addr <= std_logic_vector(r_reg(N-1 downto 0)); --*
	empty <= e_flag;

end Behavioral;




