library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP_MAIN is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           start : in  STD_LOGIC;
           wr0 : out  STD_LOGIC;
           wr1 : out  STD_LOGIC;
           wr2 : out  STD_LOGIC;
           wr3 : out  STD_LOGIC;
           dout0 : out  STD_LOGIC_VECTOR (23 downto 0);
           dout1 : out  STD_LOGIC_VECTOR (23 downto 0);
           dout2 : out  STD_LOGIC_VECTOR (23 downto 0);
           dout3 : out  STD_LOGIC_VECTOR (23 downto 0));
end TOP_MAIN;

architecture Behavioral of TOP_MAIN is
---- COMPONENT ----
COMPONENT ROM_IMG
	PORT(
		d000 : IN std_logic_vector(6 downto 0);
		d001 : IN std_logic_vector(6 downto 0);
		d002 : IN std_logic_vector(6 downto 0);
		d010 : IN std_logic_vector(6 downto 0);
		d011 : IN std_logic_vector(6 downto 0);
		d012 : IN std_logic_vector(6 downto 0);
		d020 : IN std_logic_vector(6 downto 0);
		d021 : IN std_logic_vector(6 downto 0);
		d022 : IN std_logic_vector(6 downto 0);
		d100 : IN std_logic_vector(6 downto 0);
		d101 : IN std_logic_vector(6 downto 0);
		d102 : IN std_logic_vector(6 downto 0);
		d110 : IN std_logic_vector(6 downto 0);
		d111 : IN std_logic_vector(6 downto 0);
		d112 : IN std_logic_vector(6 downto 0);
		d120 : IN std_logic_vector(6 downto 0);
		d121 : IN std_logic_vector(6 downto 0);
		d122 : IN std_logic_vector(6 downto 0);
		d200 : IN std_logic_vector(6 downto 0);
		d201 : IN std_logic_vector(6 downto 0);
		d202 : IN std_logic_vector(6 downto 0);
		d210 : IN std_logic_vector(6 downto 0);
		d211 : IN std_logic_vector(6 downto 0);
		d212 : IN std_logic_vector(6 downto 0);
		d220 : IN std_logic_vector(6 downto 0);
		d221 : IN std_logic_vector(6 downto 0);
		d222 : IN std_logic_vector(6 downto 0);
		d300 : IN std_logic_vector(6 downto 0);
		d301 : IN std_logic_vector(6 downto 0);
		d302 : IN std_logic_vector(6 downto 0);
		d310 : IN std_logic_vector(6 downto 0);
		d311 : IN std_logic_vector(6 downto 0);
		d312 : IN std_logic_vector(6 downto 0);
		d320 : IN std_logic_vector(6 downto 0);
		d321 : IN std_logic_vector(6 downto 0);
		d322 : IN std_logic_vector(6 downto 0);          
		k000 : OUT std_logic_vector(23 downto 0);
		k001 : OUT std_logic_vector(23 downto 0);
		k002 : OUT std_logic_vector(23 downto 0);
		k010 : OUT std_logic_vector(23 downto 0);
		k011 : OUT std_logic_vector(23 downto 0);
		k012 : OUT std_logic_vector(23 downto 0);
		k020 : OUT std_logic_vector(23 downto 0);
		k021 : OUT std_logic_vector(23 downto 0);
		k022 : OUT std_logic_vector(23 downto 0);
		k100 : OUT std_logic_vector(23 downto 0);
		k101 : OUT std_logic_vector(23 downto 0);
		k102 : OUT std_logic_vector(23 downto 0);
		k110 : OUT std_logic_vector(23 downto 0);
		k111 : OUT std_logic_vector(23 downto 0);
		k112 : OUT std_logic_vector(23 downto 0);
		k120 : OUT std_logic_vector(23 downto 0);
		k121 : OUT std_logic_vector(23 downto 0);
		k122 : OUT std_logic_vector(23 downto 0);
		k200 : OUT std_logic_vector(23 downto 0);
		k201 : OUT std_logic_vector(23 downto 0);
		k202 : OUT std_logic_vector(23 downto 0);
		k210 : OUT std_logic_vector(23 downto 0);
		k211 : OUT std_logic_vector(23 downto 0);
		k212 : OUT std_logic_vector(23 downto 0);
		k220 : OUT std_logic_vector(23 downto 0);
		k221 : OUT std_logic_vector(23 downto 0);
		k222 : OUT std_logic_vector(23 downto 0);
		k300 : OUT std_logic_vector(23 downto 0);
		k301 : OUT std_logic_vector(23 downto 0);
		k302 : OUT std_logic_vector(23 downto 0);
		k310 : OUT std_logic_vector(23 downto 0);
		k311 : OUT std_logic_vector(23 downto 0);
		k312 : OUT std_logic_vector(23 downto 0);
		k320 : OUT std_logic_vector(23 downto 0);
		k321 : OUT std_logic_vector(23 downto 0);
		k322 : OUT std_logic_vector(23 downto 0)
		);
	END COMPONENT;
		COMPONENT ROM_W
	PORT(          
		w00 : OUT std_logic_vector(23 downto 0);
		w01 : OUT std_logic_vector(23 downto 0);
		w02 : OUT std_logic_vector(23 downto 0);
		w10 : OUT std_logic_vector(23 downto 0);
		w11 : OUT std_logic_vector(23 downto 0);
		w12 : OUT std_logic_vector(23 downto 0);
		w20 : OUT std_logic_vector(23 downto 0);
		w21 : OUT std_logic_vector(23 downto 0);
		w22 : OUT std_logic_vector(23 downto 0)
		);
	END COMPONENT;
	COMPONENT convolucion_0
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		start : IN std_logic;
		result_in : IN std_logic_vector(23 downto 0);          
		wr : OUT std_logic;
		d_out : OUT std_logic_vector(23 downto 0);
		d00 : OUT std_logic_vector(6 downto 0);
		d01 : OUT std_logic_vector(6 downto 0);
		d02 : OUT std_logic_vector(6 downto 0);
		d10 : OUT std_logic_vector(6 downto 0);
		d11 : OUT std_logic_vector(6 downto 0);
		d12 : OUT std_logic_vector(6 downto 0);
		d20 : OUT std_logic_vector(6 downto 0);
		d21 : OUT std_logic_vector(6 downto 0);
		d22 : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;
	COMPONENT convolucion_1
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		start : IN std_logic;
		result_in : IN std_logic_vector(23 downto 0);          
		wr : OUT std_logic;
		d_out : OUT std_logic_vector(23 downto 0);
		d00 : OUT std_logic_vector(6 downto 0);
		d01 : OUT std_logic_vector(6 downto 0);
		d02 : OUT std_logic_vector(6 downto 0);
		d10 : OUT std_logic_vector(6 downto 0);
		d11 : OUT std_logic_vector(6 downto 0);
		d12 : OUT std_logic_vector(6 downto 0);
		d20 : OUT std_logic_vector(6 downto 0);
		d21 : OUT std_logic_vector(6 downto 0);
		d22 : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;
COMPONENT convolucion_2
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		start : IN std_logic;
		result_in : IN std_logic_vector(23 downto 0);          
		wr : OUT std_logic;
		d_out : OUT std_logic_vector(23 downto 0);
		d00 : OUT std_logic_vector(6 downto 0);
		d01 : OUT std_logic_vector(6 downto 0);
		d02 : OUT std_logic_vector(6 downto 0);
		d10 : OUT std_logic_vector(6 downto 0);
		d11 : OUT std_logic_vector(6 downto 0);
		d12 : OUT std_logic_vector(6 downto 0);
		d20 : OUT std_logic_vector(6 downto 0);
		d21 : OUT std_logic_vector(6 downto 0);
		d22 : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;
COMPONENT convolucion_3
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		start : IN std_logic;
		result_in : IN std_logic_vector(23 downto 0);          
		wr : OUT std_logic;
		d_out : OUT std_logic_vector(23 downto 0);
		d00 : OUT std_logic_vector(6 downto 0);
		d01 : OUT std_logic_vector(6 downto 0);
		d02 : OUT std_logic_vector(6 downto 0);
		d10 : OUT std_logic_vector(6 downto 0);
		d11 : OUT std_logic_vector(6 downto 0);
		d12 : OUT std_logic_vector(6 downto 0);
		d20 : OUT std_logic_vector(6 downto 0);
		d21 : OUT std_logic_vector(6 downto 0);
		d22 : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;
COMPONENT producto_punto
	PORT(
		k00 : IN std_logic_vector(23 downto 0);
		k01 : IN std_logic_vector(23 downto 0);
		k02 : IN std_logic_vector(23 downto 0);
		k10 : IN std_logic_vector(23 downto 0);
		k11 : IN std_logic_vector(23 downto 0);
		k12 : IN std_logic_vector(23 downto 0);
		k20 : IN std_logic_vector(23 downto 0);
		k21 : IN std_logic_vector(23 downto 0);
		k22 : IN std_logic_vector(23 downto 0);
		w00 : IN std_logic_vector(23 downto 0);
		w01 : IN std_logic_vector(23 downto 0);
		w02 : IN std_logic_vector(23 downto 0);
		w10 : IN std_logic_vector(23 downto 0);
		w11 : IN std_logic_vector(23 downto 0);
		w12 : IN std_logic_vector(23 downto 0);
		w20 : IN std_logic_vector(23 downto 0);
		w21 : IN std_logic_vector(23 downto 0);
		w22 : IN std_logic_vector(23 downto 0);          
		resultado : OUT std_logic_vector(23 downto 0)
		);
	END COMPONENT;


---- SIGNAL ----
-- CONEXIONES DEL KERNEL HACIA EL PRODUCTO PUNTO --
signal xk00,xk01,xk02,xk10,xk11,xk12,xk20,xk21,xk22 : std_logic_vector(23 downto 0);
-- CONEXIONES  ROM IMG a CONTROLADORES --
signal ximg000, ximg001, ximg002,  ximg010, ximg011, ximg012, ximg020, ximg021, ximg022 : std_logic_vector(6 downto 0);
signal ximg100, ximg101, ximg102,  ximg110, ximg111, ximg112, ximg120, ximg121, ximg122 : std_logic_vector(6 downto 0);
signal ximg200, ximg201, ximg202,  ximg210, ximg211, ximg212, ximg220, ximg221, ximg222 : std_logic_vector(6 downto 0);
signal ximg300, ximg301, ximg302,  ximg310, ximg311, ximg312, ximg320, ximg321, ximg322 : std_logic_vector(6 downto 0);
-- CONEXIONES DATOS ROM IMG A DOT --
signal xdot000, xdot001, xdot002, xdot010, xdot011, xdot012, xdot020, xdot021, xdot022 : std_logic_vector(23 downto 0);
signal xdot100, xdot101, xdot102, xdot110, xdot111, xdot112, xdot120, xdot121, xdot122 : std_logic_vector(23 downto 0);
signal xdot200, xdot201, xdot202, xdot210, xdot211, xdot212, xdot220, xdot221, xdot222 : std_logic_vector(23 downto 0);
signal xdot300, xdot301, xdot302, xdot310, xdot311, xdot312, xdot320, xdot321, xdot322 : std_logic_vector(23 downto 0);
-- resultado DOT a CONV CONTROLLERS --
signal xres0, xres1, xres2, xres3 : std_logic_vector(23 downto 0);




begin
---- INSTANTIATION ----
IMG: ROM_IMG PORT MAP(
		d000 => ximg000,
		d001 => ximg001,
		d002 => ximg002,
		d010 => ximg010,
		d011 => ximg011,
		d012 => ximg012,
		d020 => ximg020,
		d021 => ximg021,
		d022 => ximg022,
		k000 => xdot000,
		k001 => xdot001,
		k002 => xdot002,
		k010 => xdot010,
		k011 => xdot011,
		k012 => xdot012,
		k020 => xdot020,
		k021 => xdot021,
		k022 => xdot022,
		d100 => ximg100,
		d101 => ximg101,
		d102 => ximg102,
		d110 => ximg110,
		d111 => ximg111,
		d112 => ximg112,
		d120 => ximg120,
		d121 => ximg121,
		d122 => ximg122,
		k100 => xdot100,
		k101 => xdot101,
		k102 => xdot102,
		k110 => xdot110,
		k111 => xdot111,
		k112 => xdot112,
		k120 => xdot120,
		k121 => xdot121,
		k122 => xdot122,
		d200 => ximg200,
		d201 => ximg201,
		d202 => ximg202,
		d210 => ximg210,
		d211 => ximg211,
		d212 => ximg212,
		d220 => ximg220,
		d221 => ximg221,
		d222 => ximg222,
		k200 => xdot200,
		k201 => xdot201,
		k202 => xdot202,
		k210 => xdot210,
		k211 => xdot211,
		k212 => xdot212,
		k220 => xdot220,
		k221 => xdot221,
		k222 => xdot222,
		d300 => ximg300,
		d301 => ximg301,
		d302 => ximg302,
		d310 => ximg310,
		d311 => ximg311,
		d312 => ximg312,
		d320 => ximg320,
		d321 => ximg321,
		d322 => ximg322,
		k300 => xdot300,
		k301 => xdot301,
		k302 => xdot302,
		k310 => xdot310,
		k311 => xdot311,
		k312 => xdot312,
		k320 => xdot320,
		k321 => xdot321,
		k322 => xdot322 
	);
KERNEL_VALUES: ROM_W PORT MAP(
		w00 => xk00,
		w01 => xk01,
		w02 => xk02,
		w10 => xk10,
		w11 => xk11,
		w12 => xk12,
		w20 => xk20,
		w21 => xk21,
		w22 => xk22
	);

CONV_KERNEL0: convolucion_0 PORT MAP(
		clk => clk,
		rst => rst,
		start => start,
		result_in => xres0,
		wr => wr0,
		d_out => dout0,
		d00 => ximg000,
		d01 => ximg001,
		d02 => ximg002,
		d10 => ximg010,
		d11 => ximg011,
		d12 => ximg012,
		d20 => ximg020,
		d21 => ximg021,
		d22 => ximg022
	);
CONV_KERNEL1: convolucion_1 PORT MAP(
		clk => clk,
		rst => rst,
		start => start,
		result_in => xres1,
		wr => wr1,
		d_out => dout1,
		d00 => ximg100,
		d01 => ximg101,
		d02 => ximg102,
		d10 => ximg110,
		d11 => ximg111,
		d12 => ximg112,
		d20 => ximg120,
		d21 => ximg121,
		d22 => ximg122
	);
CONV_KERNEL2: convolucion_2 PORT MAP(
		clk => clk,
		rst => rst,
		start => start,
		result_in => xres2,
		wr => wr2,
		d_out => dout2,
		d00 => ximg200,
		d01 => ximg201,
		d02 => ximg202,
		d10 => ximg210,
		d11 => ximg211,
		d12 => ximg212,
		d20 => ximg220,
		d21 => ximg221,
		d22 => ximg222
	);
	
CONV_KERNEL3: convolucion_3 PORT MAP(
		clk => clk,
		rst => rst,
		start => start,
		result_in => xres3,
		wr => wr3,
		d_out => dout3,
		d00 => ximg300,
		d01 => ximg301,
		d02 => ximg302,
		d10 => ximg310,
		d11 => ximg311,
		d12 => ximg312,
		d20 => ximg320,
		d21 => ximg321,
		d22 => ximg322
	);
DOT0: producto_punto PORT MAP(
		k00 => xk00,
		k01 => xk01,
		k02 => xk02,
		k10 => xk10,
		k11 => xk11,
		k12 => xk12,
		k20 => xk20,
		k21 => xk21,
		k22 => xk22,
		w00 => xdot000,
		w01 => xdot001,
		w02 => xdot002,
		w10 => xdot010,
		w11 => xdot011,
		w12 => xdot012,
		w20 => xdot020,
		w21 => xdot021,
		w22 => xdot022,
		resultado => xres0
	);
DOT1: producto_punto PORT MAP(
		k00 => xk00,
		k01 => xk01,
		k02 => xk02,
		k10 => xk10,
		k11 => xk11,
		k12 => xk12,
		k20 => xk20,
		k21 => xk21,
		k22 => xk22,
		w00 => xdot100,
		w01 => xdot101,
		w02 => xdot102,
		w10 => xdot110,
		w11 => xdot111,
		w12 => xdot112,
		w20 => xdot120,
		w21 => xdot121,
		w22 => xdot122,
		resultado => xres1
	);
DOT2: producto_punto PORT MAP(
		k00 => xk00,
		k01 => xk01,
		k02 => xk02,
		k10 => xk10,
		k11 => xk11,
		k12 => xk12,
		k20 => xk20,
		k21 => xk21,
		k22 => xk22,
		w00 => xdot200,
		w01 => xdot201,
		w02 => xdot202,
		w10 => xdot210,
		w11 => xdot211,
		w12 => xdot212,
		w20 => xdot220,
		w21 => xdot221,
		w22 => xdot222,
		resultado => xres2
	);
DOT3: producto_punto PORT MAP(
		k00 => xk00,
		k01 => xk01,
		k02 => xk02,
		k10 => xk10,
		k11 => xk11,
		k12 => xk12,
		k20 => xk20,
		k21 => xk21,
		k22 => xk22,
		w00 => xdot300,
		w01 => xdot301,
		w02 => xdot302,
		w10 => xdot310,
		w11 => xdot311,
		w12 => xdot312,
		w20 => xdot320,
		w21 => xdot321,
		w22 => xdot322,
		resultado => xres3
	);
end Behavioral;

