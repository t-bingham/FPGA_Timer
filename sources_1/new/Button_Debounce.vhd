----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.05.2018 13:24:34
-- Design Name: 
-- Module Name: Button_Debounce - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Button_Debounce is
    Port(
        clk, reset  : in std_logic;
        button_in   : in std_logic;
        db_out      : out std_logic
        );
end Button_Debounce;

architecture arch of Button_Debounce is

signal Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8 : std_logic;

begin process(clk, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8)
begin
   if (clk'event and clk = '1') then
      if (reset = '1') then
         Q1 <= '0';
         Q2 <= '0';
         Q3 <= '0';
         Q4 <= '0';
         Q5 <= '0';
         Q6 <= '0';
         Q7 <= '0';
         Q8 <= '0';
      else
         Q1 <= button_in;
         Q2 <= Q1;
         Q3 <= Q2;
         Q4 <= Q3;
         Q5 <= Q4;
         Q6 <= Q5;
         Q7 <= Q6;
         Q8 <= Q7;
      end if;
   end if;
   
   db_out <= Q1 and Q2 and Q3 and Q4 and Q5 and Q6 and Q7 and (not Q8);
   
end process;
end arch;



