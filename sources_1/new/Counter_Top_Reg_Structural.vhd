
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Counter_Top_Reg_Structural is
    Port ( clk          : in STD_LOGIC;
           sw           : in STD_LOGIC_VECTOR (15 downto 0);
           top_reg_ld   : in STD_LOGIC;
           top          : out STD_LOGIC_VECTOR (15 downto 0) := x"8000");
end Counter_Top_Reg_Structural;

architecture archi of Counter_Top_Reg_Structural is

component Register_16_bit port( 
    d       : in STD_LOGIC_VECTOR(15 downto 0);
    ld      : in STD_LOGIC; -- load/enable.
    reset   : in STD_LOGIC; -- async. clear.
    clk     : in STD_LOGIC; -- clock.
    q       : out STD_LOGIC_VECTOR(15 downto 0) := x"8000"); -- output
end component;

signal top_reg_in : STD_LOGIC_VECTOR (15 downto 0) := x"8000";

begin

COUNT_TOP_REG : Register_16_Bit
    port map (
        d => top_reg_in,
        ld => top_reg_ld,
        reset => '0',
        clk => clk,
        q => top
    );

process(clk)
begin
    if clk'event and clk = '1' then
        if (SW < x"0100") then
            top_reg_in <= x"0100";
        else
            top_reg_in <= SW;
        end if;
    end if;
end process;
end archi;
