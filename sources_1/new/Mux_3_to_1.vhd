----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2018 16:19:31
-- Design Name: 
-- Module Name: Demux_3_Way - Behavioral
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

entity Mux_3_to_1 is
port (
    clk     : in std_logic;
    A, B, C : in std_logic;
    S       : in std_logic_vector (1 downto 0);
    O       : out std_logic);
end Mux_3_to_1;

architecture Behavioral of Mux_3_to_1 is

begin process (A, B, C, S, clk)
begin
    if clk'event and clk = '1' then
        case s is
            when "00" => O <= A;
            when "01" => O <= B;
            when "10" => O <= C;
            when others => O <= A;
        end case;
    end if;
end process;

end Behavioral;
