
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BTNL_Structural is
    Port ( clk : in STD_LOGIC;
           clk_1khz : in STD_LOGIC;
           btnl : in STD_LOGIC;
           btnl_state : out STD_LOGIC_VECTOR (1 downto 0) );
end BTNL_Structural;


architecture Behavioral of BTNL_Structural is

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

signal btnl_dbcd : STD_LOGIC;


begin

BTNR_DEBOUNCE : Button_Debounce 
    port map(
        clk => clk_1khz, 
        reset => '0',
        button_in => BTNL,
        DB_out => btnl_dbcd
);

BTNR_FSM : FSM_3_State
    port map (
        sig_in => btnl_dbcd,
        output => btnl_state,
        reset => '0',
        clk => clk
);

end Behavioral;
