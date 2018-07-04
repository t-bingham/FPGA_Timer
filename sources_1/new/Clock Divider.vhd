library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity Clock_Divider is
	generic(
		INPUT_FREQUENCY  : integer := 100000000
	);
	
	port(
		in_clock  : in std_logic;
		enable    : in std_logic;
		output_frequency : in std_logic_vector (15 downto 0) := x"0001";
		out_clock : out std_logic := '0'
	);
end Clock_Divider;


architecture behavioral of Clock_Divider is


signal count: integer := 0;

begin
	divider : process(in_clock, enable, output_frequency)
    variable DIVIDER_RATIO : integer := INPUT_FREQUENCY / to_integer(unsigned(output_frequency));
    variable HALF_DIVIDER  : integer := DIVIDER_RATIO / 2;
	begin
		if enable = '0' then
			out_clock <= '0';
			count <= 0;
		elsif in_clock'event and in_clock = '1' then
			if count = HALF_DIVIDER then
				out_clock <= '1';
				count <= count + 1;
			elsif count = DIVIDER_RATIO then
				out_clock <= '0';
				count <= 0;
			else
				count <= count + 1;
			end if;
		end if;
	end process divider;
end behavioral;
