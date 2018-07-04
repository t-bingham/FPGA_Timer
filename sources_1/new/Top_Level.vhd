
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top_Level is
    Port ( CLK100MHZ : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (15 downto 0);
           BTNC : in STD_LOGIC;
           BTNL : in STD_LOGIC;
           BTNR : in STD_LOGIC;
           BTNU : in STD_LOGIC;
           BTND : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (15 downto 0);
           LED16_R : out STD_LOGIC;
           LED16_G : out STD_LOGIC;
           LED16_B : out STD_LOGIC;
           LED17_R : out STD_LOGIC;
           LED17_G : out STD_LOGIC;
           LED17_B : out STD_LOGIC;
           JA : out STD_LOGIC_VECTOR (4 downto 1);
           JB : out STD_LOGIC_VECTOR (1 downto 1) );
end Top_Level;

architecture Architectural of Top_Level is

component Inputs_Structural
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (15 downto 0);
           btnc : in STD_LOGIC;
           btnl : in STD_LOGIC;
           btnr : in STD_LOGIC;
           btnu : in STD_LOGIC;
           btnd : in STD_LOGIC;
           top : out STD_LOGIC_VECTOR (15 downto 0);
           duty : out STD_LOGIC_VECTOR (7 downto 0);
           counter_clk : out STD_LOGIC;
           output_mode : out STD_LOGIC_VECTOR (1 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0);
           led16_r : out STD_LOGIC;
           led16_g : out STD_LOGIC;
           led16_b : out STD_LOGIC;
           led17_r : out STD_LOGIC;
           led17_g : out STD_LOGIC;
           led17_b : out STD_LOGIC);
end component;

component Counter_Structural
    Port ( clk : in STD_LOGIC;
           top : in STD_LOGIC_VECTOR (15 downto 0);
           counter_clk : in STD_LOGIC;
           counter_value : out STD_LOGIC_VECTOR (15 downto 0);
           o_f_pulse : out STD_LOGIC );
end component;

component Outputs_Structural
    Port ( clk : in STD_LOGIC;
           top : in STD_LOGIC_VECTOR (15 downto 0);
           duty : in STD_LOGIC_VECTOR (7 downto 0);
           output_mode : in STD_LOGIC_VECTOR (1 downto 0);
           counter_value : in STD_LOGIC_VECTOR (15 downto 0);
           o_f_pulse : in STD_LOGIC;
           ja : out STD_LOGIC_VECTOR (4 downto 1);
           jb : out STD_LOGIC );
end component;

signal top : STD_LOGIC_VECTOR (15 downto 0);
signal duty : STD_LOGIC_VECTOR (7 downto 0);
signal counter_clk : STD_LOGIC;
signal output_mode : STD_LOGIC_VECTOR (1 downto 0);
signal counter_value : STD_LOGIC_VECTOR (15 downto 0);
signal o_f_pulse : STD_LOGIC;

begin

INPUTS : Inputs_Structural
    Port Map ( clk => CLK100MHZ,
               sw => SW,
               btnc => BTNC,
               btnl => BTNL,
               btnr => BTNR,
               btnu => BTNU,
               btnd => BTND,
               top => top,
               duty => duty,
               counter_clk => counter_clk,
               output_mode => output_mode,
               led => LED,
               led16_r => LED16_R,
               led16_g => LED16_G,
               led16_b => LED16_B,
               led17_r => LED17_R,
               led17_g => LED17_G,
               led17_b => LED17_B );

COUNTER : Counter_Structural
    Port Map ( clk => CLK100MHZ,
               top => top,
               counter_clk => counter_clk,
               counter_value => counter_value,
               o_f_pulse => o_f_pulse );
               
OUTPUTS : Outputs_Structural
    Port Map ( clk => CLK100MHZ,
               top => top,
               duty => duty,
               output_mode => output_mode,
               counter_value => counter_value,
               o_f_pulse => o_f_pulse,
               ja => JA,
               jb => JB(1) );
 
end Architectural;
