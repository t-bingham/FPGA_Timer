
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Inputs_Structural is
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
end Inputs_Structural;

architecture Behavioral of Inputs_Structural is

component Clock_Divider_1000HZ
    Port( in_clock  : in std_logic;
          enable    : in std_logic;
		  out_clock : out std_logic := '0' );
end component;

component Clock_Divider_5HZ
    Port( in_clock  : in std_logic;
          enable    : in std_logic;
		  out_clock : out std_logic := '0' );
end component;

component Clock_Divider
    Port( in_clock  : in std_logic;
		  enable    : in std_logic;
		  output_frequency : in std_logic_vector (15 downto 0) := x"0001";
		  out_clock : out std_logic := '0' );
end component;

component BTNC_Structural
    Port ( clk : in STD_LOGIC;
           btnc : in STD_LOGIC;
           input_mode : in STD_LOGIC_VECTOR (1 downto 0);
           top_reg_ld : out STD_LOGIC;
           duty_reg_ld : out STD_LOGIC;
           usr_frequency_reg_ld : out STD_LOGIC);
end component;

component BTNL_Structural
    Port ( clk : in STD_LOGIC;
           clk_1khz : in STD_LOGIC;
           btnl : in STD_LOGIC;
           btnl_state : out STD_LOGIC_VECTOR (1 downto 0) );
end component;

component BTNR_Structural
    Port ( clk : in STD_LOGIC;
           clk_1khz : in STD_LOGIC;
           btnr : in STD_LOGIC;
           btnr_state : out STD_LOGIC_VECTOR (1 downto 0) );
end component;

component Counter_Top_Reg_Structural
    Port ( clk          : in STD_LOGIC;
           sw           : in STD_LOGIC_VECTOR (15 downto 0);
           top_reg_ld   : in STD_LOGIC;
           top          : out STD_LOGIC_VECTOR (15 downto 0) := x"8000");
end component;

component Duty_Reg_Structural
    Port ( clk          : in STD_LOGIC;
           sw           : in STD_LOGIC_VECTOR (15 downto 0);
           duty_reg_ld  : in STD_LOGIC;
           duty         : out STD_LOGIC_VECTOR (7 downto 0) := "00110010" );
end component;

component Register_16_Bit
    Port ( d       : in STD_LOGIC_VECTOR (15 downto 0);
       ld      : in STD_LOGIC;
       reset   : in STD_LOGIC;
       clk     : in STD_LOGIC;
       q       : out STD_LOGIC_VECTOR (15 downto 0) );
end component;

component Register_2_Bit
    Port ( d       : in STD_LOGIC_VECTOR (1 downto 0);
           ld      : in STD_LOGIC;
           reset   : in STD_LOGIC;
           clk     : in STD_LOGIC;
           q       : out STD_LOGIC_VECTOR (1 downto 0) );
end component;

component Mux_3_to_1
    port ( clk     : in std_logic;
           A, B, C : in std_logic;
           S       : in std_logic_vector (1 downto 0);
           O       : out std_logic );
end component;

signal clk_1khz : STD_LOGIC;
signal clk_5hz : STD_LOGIC;
signal clk_usr : STD_LOGIC;

signal input_mode : STD_LOGIC_VECTOR (1 downto 0);
signal btnr_state : STD_LOGIC_VECTOR (1 downto 0);
signal clk_mode : STD_LOGIC_VECTOR (1 downto 0);

signal top_reg_ld : STD_LOGIC;
signal duty_reg_ld : STD_LOGIC;
signal usr_frequency_reg_ld : STD_LOGIC;

signal top_i : STD_LOGIC_VECTOR (15 downto 0);
signal duty_i : STD_LOGIC_VECTOR (7 downto 0);
signal usr_frequency : STD_LOGIC_VECTOR (15 downto 0);

begin

CD_1KHZ : Clock_Divider_1000HZ
    Port map ( in_clock => clk,
               enable => '1',
		       out_clock => clk_1khz );
		       
CD_5HZ : Clock_Divider_5HZ
    Port map ( in_clock => clk,
               enable => '1',
               out_clock => clk_5hz );
               
CD_USR : Clock_Divider
    Port map ( in_clock => clk,
               enable => '1',
               output_frequency => usr_frequency,
               out_clock => clk_usr );
               

BTNC_S : BTNC_Structural
    Port Map ( clk => clk,
               btnc => BTNC,
               input_mode => input_mode,
               top_reg_ld => top_reg_ld,
               duty_reg_ld => duty_reg_ld,
               usr_frequency_reg_ld => usr_frequency_reg_ld );
               
BTNL_S : BTNL_Structural
    Port Map ( clk => clk,
               clk_1khz => clk_1khz,
               btnl => BTNL,
               btnl_state => input_mode );
               
BTNR_S : BTNR_Structural
    Port Map ( clk => clk,
               clk_1khz => clk_1khz,
               btnr => BTNR,
               btnr_state => btnr_state );

C_T_REG_S : Counter_Top_Reg_Structural
    Port Map ( clk => clk,
               sw => SW,
               top_reg_ld => top_reg_ld,
               top => top_i );

DUTY_REG_S : Duty_Reg_Structural
    Port Map ( clk => clk,
               sw => SW,
               duty_reg_ld => duty_reg_ld,
               duty => duty_i );

USR_FREQ_REG : Register_16_Bit
    Port Map ( d => SW,
               ld => usr_frequency_reg_ld,
               reset => '0',
               clk => clk,
               q => usr_frequency );
               
CLK_MODE_REG : Register_2_Bit
    Port Map ( d => btnr_state,
               ld => BTNU,
               reset => '0',
               clk => clk,
               q => clk_mode );
               
COUNTER_CLOCK_MUX : Mux_3_to_1
    Port Map ( clk => clk,
               A => clk_1khz,
               B => clk_5hz, 
               C => clk_usr,
               S => clk_mode,
               O => counter_clk );

OUTPUT_MODE_REG : Register_2_Bit
    Port Map ( d => btnr_state,
               ld => BTND,
               reset => '0',
               clk => clk,
               q => output_mode );

process(clk, top_i, duty_i)
begin
    if clk'event and clk = '1' then
        case input_mode is
            when "00" =>
                LED <= top_i;
                LED17_R <= '1';
                LED17_G <= '0';
                LED17_B <= '0';
            
            when "01" =>
                LED <= x"00" & duty_i;
                LED17_R <= '0';
                LED17_G <= '1';
                LED17_B <= '0';

            when "10" =>
                LED <= usr_frequency;
                LED17_R <= '0';
                LED17_G <= '0';
                LED17_B <= '1';
                
            when "11" =>
                LED <= x"0000";
                LED17_R <= '0';
                LED17_G <= '0';
                LED17_B <= '0';
        end case;

        case btnr_state is
            when "00" =>
                 -- 1khz
                 -- pwm
                LED16_R <= '1';
                LED16_G <= '0';
                LED16_B <= '0';
            
            when "01" =>
                -- 5hz
                -- assert high
                LED16_R <= '0';
                LED16_G <= '1';
                LED16_B <= '0';

            when "10" =>
                -- user
                -- assert low
                LED16_R <= '0';
                LED16_G <= '0';
                LED16_B <= '1';
                
            when "11" =>
                LED <= x"0000";
                LED17_R <= '0';
                LED17_G <= '0';
                LED17_B <= '0';
        end case;
   end if;
   top <= top_i;
   duty <= duty_i;
end process;

end Behavioral;
