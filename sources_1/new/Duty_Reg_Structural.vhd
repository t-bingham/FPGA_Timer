
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Duty_Reg_Structural is
    Port ( clk          : in STD_LOGIC;
           sw           : in STD_LOGIC_VECTOR (15 downto 0);
           duty_reg_ld  : in STD_LOGIC;
           duty         : out STD_LOGIC_VECTOR (7 downto 0) := "00110010" );
end Duty_Reg_Structural;

architecture archi of Duty_Reg_Structural is

component Register_8_bit port( 
    d       : in STD_LOGIC_VECTOR(7 downto 0) := "00110010";
    ld      : in STD_LOGIC := '1'; -- load/enable.
    reset   : in STD_LOGIC; -- async. clear.
    clk     : in STD_LOGIC := '1'; -- clock.
    q       : out STD_LOGIC_VECTOR(7 downto 0) := "00110010"); -- output
end component;

signal duty_reg_in : STD_LOGIC_VECTOR (7 downto 0) := "00110010";

begin

DUTY_REG : Register_8_bit 
    port map (
        d => duty_reg_in,
        ld => duty_reg_ld,
        reset => '0',
        clk => clk,
        q => duty
    );
    
process(clk) 
begin
    if clk'event and clk = '1' then
        if (SW > "0000000001100100") then
            duty_reg_in <= "01100100";
        else
            duty_reg_in <= SW (7 downto 0);
        end if;
    end if;
end process;
end archi;
