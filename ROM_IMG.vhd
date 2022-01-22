library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ROM_IMG is
	port(
	------- IN OUT DE PRIMER KERNEL ----------
			d000 : in std_logic_vector (6 downto 0);
			d001 : in std_logic_vector (6 downto 0);
			d002 : in std_logic_vector(6 downto 0);
			d010 : in std_logic_vector(6 downto 0);
			d011 : in std_logic_vector(6 downto 0);
			d012 : in std_logic_vector(6 downto 0);
			d020 : in std_logic_vector(6 downto 0);
			d021 : in std_logic_vector(6 downto 0);
			d022 : in std_logic_vector(6 downto 0);
			k000 : out std_logic_vector(23 downto 0);
			k001 : out std_logic_vector(23 downto 0);
			k002 : out std_logic_vector(23 downto 0);
			k010 : out std_logic_vector(23 downto 0);
			k011 : out std_logic_vector(23 downto 0);
			k012 : out std_logic_vector(23 downto 0);
			k020 : out std_logic_vector(23 downto 0);
			k021 : out std_logic_vector(23 downto 0);
			k022 : out std_logic_vector(23 downto 0);
	------- IN OUT DE SEGUNDO KERNEL ----------
			d100 : in std_logic_vector (6 downto 0);
			d101 : in std_logic_vector (6 downto 0);
			d102 : in std_logic_vector(6 downto 0);
			d110 : in std_logic_vector(6 downto 0);
			d111 : in std_logic_vector(6 downto 0);
			d112 : in std_logic_vector(6 downto 0);
			d120 : in std_logic_vector(6 downto 0);
			d121 : in std_logic_vector(6 downto 0);
			d122 : in std_logic_vector(6 downto 0);
			k100 : out std_logic_vector(23 downto 0);
			k101 : out std_logic_vector(23 downto 0);
			k102 : out std_logic_vector(23 downto 0);
			k110 : out std_logic_vector(23 downto 0);
			k111 : out std_logic_vector(23 downto 0);
			k112 : out std_logic_vector(23 downto 0);
			k120 : out std_logic_vector(23 downto 0);
			k121 : out std_logic_vector(23 downto 0);
			k122 : out std_logic_vector(23 downto 0);
	------- IN OUT DE TERCER KERNEL ----------
			d200 : in std_logic_vector (6 downto 0);
			d201 : in std_logic_vector (6 downto 0);
			d202 : in std_logic_vector(6 downto 0);
			d210 : in std_logic_vector(6 downto 0);
			d211 : in std_logic_vector(6 downto 0);
			d212 : in std_logic_vector(6 downto 0);
			d220 : in std_logic_vector(6 downto 0);
			d221 : in std_logic_vector(6 downto 0);
			d222 : in std_logic_vector(6 downto 0);
			k200 : out std_logic_vector(23 downto 0);
			k201 : out std_logic_vector(23 downto 0);
			k202 : out std_logic_vector(23 downto 0);
			k210 : out std_logic_vector(23 downto 0);
			k211 : out std_logic_vector(23 downto 0);
			k212 : out std_logic_vector(23 downto 0);
			k220 : out std_logic_vector(23 downto 0);
			k221 : out std_logic_vector(23 downto 0);
			k222 : out std_logic_vector(23 downto 0);
			------- IN OUT DE CUARTO KERNEL ----------
			d300 : in std_logic_vector (6 downto 0);
			d301 : in std_logic_vector (6 downto 0);
			d302 : in std_logic_vector(6 downto 0);
			d310 : in std_logic_vector(6 downto 0);
			d311 : in std_logic_vector(6 downto 0);
			d312 : in std_logic_vector(6 downto 0);
			d320 : in std_logic_vector(6 downto 0);
			d321 : in std_logic_vector(6 downto 0);
			d322 : in std_logic_vector(6 downto 0);
			k300 : out std_logic_vector(23 downto 0);
			k301 : out std_logic_vector(23 downto 0);
			k302 : out std_logic_vector(23 downto 0);
			k310 : out std_logic_vector(23 downto 0);
			k311 : out std_logic_vector(23 downto 0);
			k312 : out std_logic_vector(23 downto 0);
			k320 : out std_logic_vector(23 downto 0);
			k321 : out std_logic_vector(23 downto 0);
			k322 : out std_logic_vector(23 downto 0));
end ROM_IMG;

architecture Behavioral of ROM_IMG is
	type ROM is array(natural range <>) of std_logic_vector(23 downto 0);
	constant img : ROM(0 to 99) := (	x"3f8000",
												x"3efefe",
												x"3f8000",
												x"3efefe",
												x"3f8000",
												x"000000",
												x"000000",
												x"000000",
												x"000000",
												x"000000",
												x"3f8000",
												x"000000",
												x"3f8000",
												x"3efefe",
												x"3f8000",
												x"000000",
												x"3f43c3",
												x"000000",
												x"000000",
												x"000000",
												x"3f8000",
												x"3efefe",
												x"000000",
												x"3f8000",
												x"3f8000",
												x"000000",
												x"3f8000",
												x"3f43c3",
												x"000000",
												x"000000",
												x"3f8000",
												x"3efefe",
												x"3efefe",
												x"000000",
												x"3f8000",
												x"000000",
												x"3f8000",
												x"3f8000",
												x"3f43c3",
												x"3f8000",
												x"3f8000",
												x"3f8000",
												x"3f8000",
												x"3f8000",
												x"3f8000",
												x"000000",
												x"000000",
												x"000000",
												x"000000",
												x"000000",
												x"1f66a6",
												x"1f66a6",
												x"1f66a6",
												x"1f66a6",
												x"1f66a6",
												x"3efefe",
												x"3efefe",
												x"3efefe",
												x"3efefe",
												x"3efefe",
												x"1f66a6",
												x"3f8000",
												x"1f66a6",
												x"3efefe",
												x"1f66a6",
												x"3efefe",
												x"000000",
												x"3f43c3",
												x"3f8000",
												x"3efefe",
												x"1f66a6",
												x"1f66a6",
												x"3f8000",
												x"3efefe",
												x"1f66a6",
												x"3efefe",
												x"000000",
												x"3f43c3",
												x"3f8000",
												x"3efefe",
												x"1f66a6",
												x"3efefe",
												x"3efefe",
												x"1f66a6",
												x"1f66a6",
												x"3efefe",
												x"000000",
												x"3f43c3",
												x"3f8000",
												x"3efefe",
												x"1f66a6",
												x"1f66a6",
												x"1f66a6",
												x"1f66a6",
												x"1f66a6",
												x"3efefe",
												x"3efefe",
												x"3efefe",
												x"3efefe",
												x"3efefe");
begin
	-- ******************* --
	k000 <= img(to_integer(unsigned(d000)));
	k001 <= img(to_integer(unsigned(d001)));
	k002 <= img(to_integer(unsigned(d002)));
	k010 <= img(to_integer(unsigned(d010)));
	k011 <= img(to_integer(unsigned(d011)));
	k012 <= img(to_integer(unsigned(d012)));
	k020 <= img(to_integer(unsigned(d020)));
	k021 <= img(to_integer(unsigned(d021)));
	k022 <= img(to_integer(unsigned(d022)));
	-- ******************* --
	k100 <= img(to_integer(unsigned(d100)));
	k101 <= img(to_integer(unsigned(d101)));
	k102 <= img(to_integer(unsigned(d102)));
	k110 <= img(to_integer(unsigned(d110)));
	k111 <= img(to_integer(unsigned(d111)));
	k112 <= img(to_integer(unsigned(d112)));
	k120 <= img(to_integer(unsigned(d120)));
	k121 <= img(to_integer(unsigned(d121)));
	k122 <= img(to_integer(unsigned(d122)));
	-- ******************* --
	k200 <= img(to_integer(unsigned(d200)));
	k201 <= img(to_integer(unsigned(d201)));
	k202 <= img(to_integer(unsigned(d202)));
	k210 <= img(to_integer(unsigned(d210)));
	k211 <= img(to_integer(unsigned(d211)));
	k212 <= img(to_integer(unsigned(d212)));
	k220 <= img(to_integer(unsigned(d220)));
	k221 <= img(to_integer(unsigned(d221)));
	k222 <= img(to_integer(unsigned(d222)));
	-- ******************* --
	k300 <= img(to_integer(unsigned(d300)));
	k301 <= img(to_integer(unsigned(d301)));
	k302 <= img(to_integer(unsigned(d302)));
	k310 <= img(to_integer(unsigned(d310)));
	k311 <= img(to_integer(unsigned(d311)));
	k312 <= img(to_integer(unsigned(d312)));
	k320 <= img(to_integer(unsigned(d320)));
	k321 <= img(to_integer(unsigned(d321)));
	k322 <= img(to_integer(unsigned(d322)));
	
end Behavioral;

