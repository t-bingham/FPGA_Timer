
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PWM_Generator is
    Port ( clk : in STD_LOGIC;
           duty : in STD_LOGIC_VECTOR (7 downto 0);
           current_timer_count : in STD_LOGIC_VECTOR (15 downto 0);
           counter_top : in STD_LOGIC_VECTOR (15 downto 0);
           pwm : out STD_LOGIC);
end PWM_Generator;

architecture Behavioral of PWM_Generator is

begin
    PWM_Calc : process(clk, current_timer_count, counter_top, duty)
    variable duty_threshold_16_bit : integer;
    begin
        if (clk'event and clk = '1') then
            duty_threshold_16_bit := ( to_integer(unsigned(counter_top)) * ( to_integer(unsigned(duty)) / 100) );
            if (to_integer(unsigned(current_timer_count)) <= duty_threshold_16_bit) then
                pwm <= '1';
            else 
                pwm <= '0';
            end if;
        end if;
    end process;
end Behavioral;
