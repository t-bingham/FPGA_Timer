----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.03.2018 15:27:23
-- Design Name: 
-- Module Name: Counter_16_Bit - Behavioral
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
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter_16_Bit is
    Port ( 
          max_count         : in STD_LOGIC_VECTOR (15 downto 0);
          clk               : in STD_LOGIC;
          count_out         : out STD_LOGIC_VECTOR (15 downto 0)
         );
end Counter_16_Bit;

architecture Behavioral of Counter_16_Bit is

signal count : unsigned(15 downto 0) := to_unsigned(0, max_count'length);

begin
    process(clk, max_count)
        begin
            if clk'event and clk = '1' then
                if count = 0 then
                    count <= unsigned(max_count);
                else
                    count <= count - 1;
                end if;
            end if;
    end process;
                    
    count_out <= std_logic_vector(count);
    
end Behavioral;
