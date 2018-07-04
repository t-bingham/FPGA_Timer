
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BTNC_Structural is
    Port ( clk : in STD_LOGIC;
           btnc : in STD_LOGIC;
           input_mode : in STD_LOGIC_VECTOR (1 downto 0);
           top_reg_ld : out STD_LOGIC;
           duty_reg_ld : out STD_LOGIC;
           usr_frequency_reg_ld : out STD_LOGIC);
end BTNC_Structural;


architecture Behavioral of BTNC_Structural is

component Button_Debounce 
    Port(
        clk, reset  : in std_logic;
        button_in   : in std_logic;
        db_out      : out std_logic );
end component;

component Demux_1_to_3 
    port (
        clk     : in STD_LOGIC;
        I       : in std_logic;
        S       : in std_logic_vector (1 downto 0);
        A, B, C : out std_logic);
end component;

signal btnc_dbcd : STD_LOGIC;


begin

BTNC_DEBOUNCE : Button_Debounce 
    port map(
        clk => clk, 
        reset => '0',
        button_in => BTNC,
        DB_out => btnc_dbcd );

BTNC_DEMUX : Demux_1_to_3
port map (
    clk => clk,
    I => btnc_dbcd,
    S => input_mode,
    A => top_reg_ld,
    B => duty_reg_ld,
    C => usr_frequency_reg_ld
);

end Behavioral;
