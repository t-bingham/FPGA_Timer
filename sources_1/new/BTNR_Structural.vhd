
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BTNR_Structural is
    Port ( clk : in STD_LOGIC;
           clk_1khz : in STD_LOGIC;
           btnr : in STD_LOGIC;
           btnr_state : out STD_LOGIC_VECTOR (1 downto 0) );
end BTNR_Structural;


architecture Behavioral of BTNR_Structural is

component Button_Debounce 
    Port(
        clk, reset  : in std_logic;
        button_in   : in std_logic;
        db_out      : out std_logic );
end component;

component FSM_3_State 
    Port (
        sig_in  : in STD_LOGIC;
        reset   : in STD_LOGIC;
        clk     : in STD_LOGIC;
        output  : out STD_LOGIC_VECTOR (1 downto 0) );
end component;

signal btnr_dbcd : STD_LOGIC;


begin

BTNR_DEBOUNCE : Button_Debounce 
    port map(
        clk => clk_1khz, 
        reset => '0',
        button_in => BTNR,
        DB_out => btnr_dbcd
);

BTNR_FSM : FSM_3_State
    port map (
        sig_in => btnr_dbcd,
        output => btnr_state,
        reset => '0',
        clk => clk
);

end Behavioral;
