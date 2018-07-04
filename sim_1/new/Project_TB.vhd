-- Testbench created online at:
--   www.doulos.com/knowhow/perl/testbench_creation/
-- Copyright Doulos Ltd
-- SD, 03 November 2002

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Counter_16_Bit_tb is
end;

architecture bench of Counter_16_Bit_tb is

  component Counter_16_Bit
      Port ( 
            max_count         : in STD_LOGIC_VECTOR (15 downto 0);
            clk               : in STD_LOGIC;
            count_out         : out STD_LOGIC_VECTOR (15 downto 0)
           );
  end component;

  signal max_count: STD_LOGIC_VECTOR (15 downto 0);
  signal clk: STD_LOGIC;
  signal count_out: STD_LOGIC_VECTOR (15 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: Counter_16_Bit port map ( max_count => max_count,
                                 clk       => clk,
                                 count_out => count_out );

  stimulus: process
  begin
    max_count <= x"000F";
    wait for 180 ns;
    max_count <= x"0030"; 
    wait for 920 ns;
    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;