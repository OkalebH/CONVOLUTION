library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity convolucion_0 is
    Port ( clk : in  STD_LOGIC;
			  rst : in STD_LOGIC;
			  start : in STD_LOGIC;
			  result_in : in STD_LOGIC_VECTOR(23 downto 0);
			  wr : out STD_LOGIC;
			  d_out : out STD_LOGIC_VECTOR(23 downto 0);
			  d00 : out std_logic_vector (6 downto 0);
			  d01 : out std_logic_vector (6 downto 0);
			  d02 : out std_logic_vector(6 downto 0);
			  d10 : out std_logic_vector(6 downto 0);
			  d11 : out std_logic_vector(6 downto 0);
			  d12 : out std_logic_vector(6 downto 0);
			  d20 : out std_logic_vector(6 downto 0);
			  d21 : out std_logic_vector(6 downto 0);
			  d22 : out std_logic_vector(6 downto 0)
			  );
end convolucion_0;

architecture Behavioral of convolucion_0 is

constant lim_ver : natural := 1; -- numero de desplazamientos que realiza verticalmente la ventana sobre la imagen
constant lim_hor : natural := 7; -- numero de desplazamientos que realiza horizontalmente la ventana sobre la imagen
constant row : natural := 4; -- numero de filas
constant col : natural := 10; -- numero de columnas
constant kdim : natural := 3; -- kernel de tamaño 3x3
--registros para extraer valores en RAM IMG
signal d0_reg,d1_reg,d2_reg,d3_reg,d4_reg,d5_reg,d6_reg,d7_reg,d8_reg : unsigned(6 downto 0);
signal d0_next,d1_next,d2_next,d3_next,d4_next,d5_next,d6_next,d7_next,d8_next : unsigned(6 downto 0);

--Contadores horizontal y vertical
signal conth_reg, conth_next, contv_reg, contv_next : unsigned(3 downto 0);
type estados is (idle,dot,get_value,shift_hor,shift_ver);
signal state_next, state_reg : estados;

begin

process(clk,rst)
begin
	if (rst = '1') then
		state_reg <= idle;
		d0_reg <= "0000000";
		d1_reg <= "0000001";
		d2_reg <= "0000010";
		d3_reg <= "0000000" + col;
		d4_reg <= "0000001" + col;
		d5_reg <= "0000010" + col;
		d6_reg <= "0000000" + col + col;
		d7_reg <= "0000001" + col + col;
		d8_reg <= "0000010" + col + col;
		conth_reg <= x"0";
		contv_reg <= x"0";
	elsif (clk'event and clk = '1') then
		state_reg <= state_next;
		d0_reg <= d0_next;
		d1_reg <= d1_next;
		d2_reg <= d2_next;
		d3_reg <= d3_next;
		d4_reg <= d4_next;
		d5_reg <= d5_next;
		d6_reg <= d6_next;
		d7_reg <= d7_next;
		d8_reg <= d8_next;
		conth_reg <= conth_next;
		contv_reg <= contv_next;
	end if;
end process;
-- NEXT STATE --
process(state_reg,d0_reg,d1_reg,d2_reg,d3_reg,d4_reg,d5_reg,d6_reg,d7_reg,d8_reg,conth_reg,contv_reg,start,result_in)
begin
	state_next <= state_reg;
	d0_next <= d0_reg;
	d1_next <= d1_reg;
	d2_next <= d2_reg;
	d3_next <= d3_reg;
	d4_next <= d4_reg;
	d5_next <= d5_reg;
	d6_next <= d6_reg;
	d7_next <= d7_reg;
	d8_next <= d8_reg;
	conth_next <= conth_reg;
	contv_next <= contv_reg;
	wr <= '0';
	case state_reg is 
		when idle => 
			if start = '1' then
				state_next <= dot;
				d0_next <= "0000000";
				d1_next <= "0000001";
				d2_next <= "0000010";
				d3_next <= "0000000" + col;
				d4_next <= "0000001" + col;
				d5_next <= "0000010" + col;
				d6_next <= "0000000" + col + col;
				d7_next <= "0000001" + col + col;
				d8_next <= "0000010" + col + col;
				conth_next <= x"0";
				contv_next <= x"0";
			end if;
		when dot =>
			--envia valores para producto punto
			d00 <= std_logic_vector(d0_reg);
			d01 <= std_logic_vector(d1_reg);
			d02 <= std_logic_vector(d2_reg);
			d10 <= std_logic_vector(d3_reg);
			d11 <= std_logic_vector(d4_reg);
			d12 <= std_logic_vector(d5_reg);
			d20 <= std_logic_vector(d6_reg);
			d21 <= std_logic_vector(d7_reg);
			d22 <= std_logic_vector(d8_reg);
			state_next <= get_value;
		when get_value =>
			--pasa el valor obtenido del producto punto y activa una senal de escritura
			d_out <= result_in;
			wr <= '1';
			state_next <= shift_hor;
		when shift_hor =>
			--incrementa los contadores horizontalmente
			conth_next <= conth_reg + 1;
			if conth_reg < lim_hor then
				-- incrementa el contador de la columna
				d0_next <= d0_reg + 1; --avanza de columna
				d1_next <= d1_reg + 1;
				d2_next <= d2_reg + 1;
				d3_next <= d3_reg + 1;
				d4_next <= d4_reg + 1;
				d5_next <= d5_reg + 1;
				d6_next <= d6_reg + 1;
				d7_next <= d7_reg + 1;
				d8_next <= d8_reg + 1;
				state_next <= dot;
			else
				state_next <= shift_ver;
				conth_next <= x"0";
			end if;
		when shift_ver =>
			--incrementa los contadores verticalmente
			contv_next <= contv_reg + 1;
			if contv_reg < lim_ver then
				d0_next <= d0_reg + kdim; --avanza de fila
				d1_next <= d1_reg + kdim;
				d2_next <= d2_reg + kdim;
				d3_next <= d3_reg + kdim;
				d4_next <= d4_reg + kdim;
				d5_next <= d5_reg + kdim;
				d6_next <= d6_reg + kdim;
				d7_next <= d7_reg + kdim;
				d8_next <= d8_reg + kdim;
				state_next <= dot;
			else
				state_next <= idle;
				contv_next <= x"0";
			end if;
	end case;
end process;


end Behavioral;

