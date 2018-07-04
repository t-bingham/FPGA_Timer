

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity Outputs_Structural is
    Port ( clk : in STD_LOGIC;
           top : in STD_LOGIC_VECTOR (15 downto 0);
           duty : in STD_LOGIC_VECTOR (7 downto 0);
           output_mode : in STD_LOGIC_VECTOR (1 downto 0);
           counter_value : in STD_LOGIC_VECTOR (15 downto 0);
           o_f_pulse : in STD_LOGIC;
           ja : out STD_LOGIC_VECTOR (4 downto 1);
           jb : out STD_LOGIC );
end Outputs_Structural;

architecture Behavioral of Outputs_Structural is

component Mux_3_to_1
    port ( clk     : in std_logic;
           A, B, C : in std_logic;
           S       : in std_logic_vector (1 downto 0);
           O       : out std_logic );
end component;

component PWM_Generator
    Port ( clk : in STD_LOGIC;
           duty : in STD_LOGIC_VECTOR (7 downto 0);
           current_timer_count : in STD_LOGIC_VECTOR (15 downto 0);
           counter_top : in STD_LOGIC_VECTOR (15 downto 0);
           pwm : out STD_LOGIC);
end component;

signal pwm : STD_LOGIC;
signal assert_high : STD_LOGIC := '0';
signal assert_low : STD_LOGIC := '0';

begin

PWM_GEN : PWM_Generator
    Port Map ( clk => clk,
               duty => duty,
               current_timer_count => counter_value,
               counter_top => top,
               pwm => pwm );

OUTPUT_MUX : Mux_3_to_1
    Port Map ( clk => clk,
               A => pwm,
               B => assert_high, 
               C => assert_low,
               S => output_mode,
               O => JB );

process(clk, pwm, output_mode, o_f_pulse, assert_high, assert_low)
begin
    if (clk'event and clk = '1') then
        
        if (output_mode = "01" and o_f_pulse = '1') then
            assert_high <= '1';
        elsif (output_mode = "01" and o_f_pulse = '0') then
            assert_high <= assert_high;
        else
            assert_high <= '0';
        end if;
        
        if (output_mode = "10" and o_f_pulse = '1') then
            assert_low <= '0';
        elsif (output_mode = "10" and o_f_pulse = '0') then
            assert_low <= assert_low;
        else
            assert_low <= '1';
        end if;
        
    end if;

    JA(1) <= pwm;
    JA(2) <= o_f_pulse;
    JA(3) <= assert_high;
    JA(4) <= assert_low;

end process;

end Behavioral;
