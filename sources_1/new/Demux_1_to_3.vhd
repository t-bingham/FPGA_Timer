----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2018 16:28:37
-- Design Name: 
-- Module Name: Demux_3_to_1 - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Demux_1_to_3 is
port (
    clk     : in std_logic;
    I       : in std_logic;
    S       : in std_logic_vector (1 downto 0);
    A, B, C : out std_logic);
end Demux_1_to_3;

architecture Behavioral of Demux_1_to_3 is

begin process (I, S, clk)
begin
    if clk'event and clk = '1' then
        case s is
            when "00" => A <= I;
            when "01" => B <= I;
            when "10" => C <= I;
            when others => A <= I;
        end case;
    end if;
end process;

end Behavioral;
