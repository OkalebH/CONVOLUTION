library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP_RAMS is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           start : in  STD_LOGIC;
			  rd0 : in STD_LOGIC;
			  rd1 : in STD_LOGIC;
			  rd2 : in STD_LOGIC;
			  rd3 : in STD_LOGIC;
			  full0 : out STD_LOGIC;
			  full1 : out STD_LOGIC;
			  full2 : out STD_LOGIC;
			  full3 : out STD_LOGIC;
			  empty0 : out STD_LOGIC;
			  empty1 : out STD_LOGIC;
			  empty2 : out STD_LOGIC;
			  empty3 : out STD_LOGIC;
			  dout0 : out STD_LOGIC_VECTOR (23 downto 0);
           dout1 : out  STD_LOGIC_VECTOR (23 downto 0);
           dout2 : out  STD_LOGIC_VECTOR (23 downto 0);
           dout3 : out  STD_LOGIC_VECTOR (23 downto 0));
end TOP_RAMS;

architecture Behavioral of TOP_RAMS is
-- COMPONENT --
COMPONENT TOP_MAIN
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		start : IN std_logic;          
		wr0 : OUT std_logic;
		wr1 : OUT std_logic;
		wr2 : OUT std_logic;
		wr3 : OUT std_logic;
		dout0 : OUT std_logic_vector(23 downto 0);
		dout1 : OUT std_logic_vector(23 downto 0);
		dout2 : OUT std_logic_vector(23 downto 0);
		dout3 : OUT std_logic_vector(23 downto 0)
		);
	END COMPONENT;
COMPONENT Registro_IMG
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		wr : IN std_logic;
		rd : IN std_logic;
		din : IN std_logic_vector(23 downto 0);          
		full : OUT std_logic;
		empty : OUT std_logic;
		dout : OUT std_logic_vector(23 downto 0)
		);
	END COMPONENT;
-- SIGNAL --
signal xwr0,xwr1,xwr2,xwr3 : std_logic;
signal xd0,xd1,xd2,xd3 : std_logic_vector(23 downto 0);
begin
-- INSTANTIATION --

	CONVOLUTION: TOP_MAIN PORT MAP(
		clk => clk,
		rst => rst,
		start => start,
		wr0 => xwr0,
		wr1 => xwr1,
		wr2 => xwr2,
		wr3 => xwr3,
		dout0 => xd0,
		dout1 => xd1,
		dout2 => xd2,
		dout3 => xd3
	);
RAM0: Registro_IMG PORT MAP(
		clk => clk,
		rst => rst,
		wr => xwr0,
		rd => rd0,
		din => xd0,
		full => full0,
		empty => empty0,
		dout => dout0
	);
RAM1: Registro_IMG PORT MAP(
		clk => clk,
		rst => rst,
		wr => xwr1,
		rd => rd1,
		din => xd1,
		full => full1,
		empty => empty1,
		dout => dout1
	);
RAM2: Registro_IMG PORT MAP(
		clk => clk,
		rst => rst,
		wr => xwr2,
		rd => rd2,
		din => xd2,
		full => full2,
		empty => empty2,
		dout => dout2
	);
RAM3: Registro_IMG PORT MAP(
		clk => clk,
		rst => rst,
		wr => xwr3,
		rd => rd3,
		din => xd3,
		full => full3,
		empty => empty3,
		dout => dout3
	);
end Behavioral;

