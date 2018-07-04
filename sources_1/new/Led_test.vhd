----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.03.2018 16:31:52
-- Design Name: 
-- Module Name: Led_test - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Led_test is
    Port ( count_in : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           led_out : out STD_LOGIC );
end Led_test;

architecture Behavioral of Led_test is

component Flip_Flop port
   (
      clk : in std_logic;

      rst : in std_logic;
      pre : in std_logic;
      ce  : in std_logic;
      
      d : in std_logic;

      q : out std_logic
   );
end component;

signal a : std_logic;
signal b : std_logic;
signal c : std_logic;

begin

LED_STATE: Flip_Flop port map( clk => clk, ) 

    process(count_in, clk)
        begin
            if count_in = 0
                
            end if
    end process
                

end Behavioral;
