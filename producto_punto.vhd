library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity producto_punto is
    Port ( k00 : in std_logic_vector(23 downto 0);
			  k01 : in std_logic_vector(23 downto 0);
			  k02 : in std_logic_vector(23 downto 0);
		 	  k10 : in std_logic_vector(23 downto 0);
			  k11 : in std_logic_vector(23 downto 0);
			  k12 : in std_logic_vector(23 downto 0);
			  k20 : in std_logic_vector(23 downto 0);
			  k21 : in std_logic_vector(23 downto 0);
			  k22 : in std_logic_vector(23 downto 0);
			  w00 : in  STD_LOGIC_VECTOR (23 downto 0);
           w01 : in  STD_LOGIC_VECTOR (23 downto 0);
           w02 : in  STD_LOGIC_VECTOR (23 downto 0);
           w10 : in  STD_LOGIC_VECTOR (23 downto 0);
           w11 : in  STD_LOGIC_VECTOR (23 downto 0);
           w12 : in  STD_LOGIC_VECTOR (23 downto 0);
           w20 : in  STD_LOGIC_VECTOR (23 downto 0);
           w21 : in  STD_LOGIC_VECTOR (23 downto 0);
           w22 : in  STD_LOGIC_VECTOR (23 downto 0);
			  resultado : out std_logic_vector (23 downto 0)
	 );
end producto_punto;

architecture Behavioral of producto_punto is
	COMPONENT AdderSubtractor
	PORT(
		num_1 : IN std_logic_vector(23 downto 0);
		num_2 : IN std_logic_vector(23 downto 0);          
		num : OUT std_logic_vector(23 downto 0)
		);
	END COMPONENT;
		COMPONENT TOP_MULTIPLIER
	PORT(
		num_1 : IN std_logic_vector(23 downto 0);
		num_2 : IN std_logic_vector(23 downto 0);          
		num_o : OUT std_logic_vector(23 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Funcion_RELU
	PORT(
		din : IN std_logic_vector(23 downto 0);          
		dout : OUT std_logic_vector(23 downto 0)
		);
	END COMPONENT;

	signal r00,r01,r02,r10,r11,r12,r20,r21,r22 : std_logic_vector(23 downto 0); --señales de resultado de la multiplicación
	signal s01,s02,s03,s04,s05,s06,s07,bias,res, res_x : std_logic_vector(23 downto 0);     --señales de resultado de la suma
begin
	bias <= x"3f8000";

	MUL_k00_w00: TOP_MULTIPLIER PORT MAP(
		num_1 => k00,
		num_2 => w00,
		num_o => r00
	);
	MUL_k01_w01: TOP_MULTIPLIER PORT MAP(
		num_1 => k01,
		num_2 => w01,
		num_o => r01
	);
	MUL_k02_w02: TOP_MULTIPLIER PORT MAP(
		num_1 => k02,
		num_2 => w02,
		num_o => r02
	);
	MUL_k10_w10:TOP_MULTIPLIER PORT MAP(
		num_1 => k10,
		num_2 => w10,
		num_o => r10
	);
	MUL_k11_w11: TOP_MULTIPLIER PORT MAP(
		num_1 => k11,
		num_2 => w11,
		num_o => r11
	);
	MUL_k12_w12: TOP_MULTIPLIER PORT MAP(
		num_1 => k12,
		num_2 => w12,
		num_o => r12
	);
	MUL_k20_w20: TOP_MULTIPLIER PORT MAP(
		num_1 => k20,
		num_2 => w20,
		num_o => r20
	);
	MUL_k21_w21: TOP_MULTIPLIER PORT MAP(
		num_1 => k21,
		num_2 => w21,
		num_o => r21
	);
	MUL_k22_w22: TOP_MULTIPLIER PORT MAP(
		num_1 => k22,
		num_2 => w22,
		num_o => r22
	);
	sum_00_01: AdderSubtractor PORT MAP(
		num_1 => r00,
		num_2 => r01,
		num => s01
	);
	sum_02_10: AdderSubtractor PORT MAP(
		num_1 => r02,
		num_2 => r10,
		num => s02
	);
	sum_11_12: AdderSubtractor PORT MAP(
		num_1 => r11,
		num_2 => r12,
		num => s03
	);
	sum_20_21: AdderSubtractor PORT MAP(
		num_1 => r20,
		num_2 => r21,
		num => s04
	);
	sum_1_2: AdderSubtractor PORT MAP(
		num_1 => s01,
		num_2 => s02,
		num => s05
	);
	sum_3_4: AdderSubtractor PORT MAP(
		num_1 => s03,
		num_2 => s04,
		num => s06
	);
	sum_5_6: AdderSubtractor PORT MAP(
		num_1 => s05,
		num_2 => s06,
		num => s07
	);
	sum_7_22: AdderSubtractor PORT MAP(
		num_1 => s07,
		num_2 => r22,
		num => res
	);
	plus_bias: AdderSubtractor PORT MAP(
		num_1 => bias,
		num_2 => res,
		num => res_x
	);
	RELU: Funcion_RELU PORT MAP(
		din => res_x,
		dout => resultado 
	);
end Behavioral;

