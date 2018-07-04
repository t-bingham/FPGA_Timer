----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.05.2018 14:45:13
-- Design Name: 
-- Module Name: Register_8_Bit - Behavioral
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

entity Register_8_Bit is
Port ( 
    d       : in STD_LOGIC_VECTOR (7 downto 0);
    ld      : in STD_LOGIC;
    reset   : in STD_LOGIC;
    clk     : in STD_LOGIC;
    q       : out STD_LOGIC_VECTOR (7 downto 0)
);
end Register_8_Bit;

architecture description of Register_8_Bit is

begin
    process(clk, reset)
    begin
        if reset = '1' then
            q <= x"00";
        elsif clk'event and clk = '1' then
            if ld = '1' then
                q <= d;
            end if;
        end if;
    end process;
end description;