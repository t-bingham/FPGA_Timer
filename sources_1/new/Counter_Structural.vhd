
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Counter_Structural is
    Port ( clk : in STD_LOGIC;
           top : in STD_LOGIC_VECTOR (15 downto 0);
           counter_clk : in STD_LOGIC;
           counter_value : out STD_LOGIC_VECTOR (15 downto 0);
           o_f_pulse : out STD_LOGIC );
end Counter_Structural;

architecture Behavioral of Counter_Structural is

component Counter_16_Bit
    Port ( max_count : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           count_out : out STD_LOGIC_VECTOR (15 downto 0) );
end component;

component Counter_Overflow_Pulse_Generator
    Port ( clk : in STD_LOGIC;
           counter_value : in STD_LOGIC_VECTOR (15 downto 0); 
           overflow_pulse : out STD_LOGIC );
end component;

signal output : STD_LOGIC_VECTOR (15 downto 0);

begin

COUNTER : Counter_16_Bit
    Port Map ( max_count => top,
               clk => counter_clk,
               count_out => output );

O_F_PULSE_GEN : Counter_Overflow_Pulse_Generator
    Port Map ( clk => clk,
               counter_value => output,
               overflow_pulse => o_f_pulse);

process(output)
begin
    counter_value <= output;
end process;

end Behavioral;
