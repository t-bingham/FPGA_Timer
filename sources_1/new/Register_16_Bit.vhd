----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2018 16:14:13
-- Design Name: 
-- Module Name: Register_16_Bit - Behavioral
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

entity Register_16_Bit is
port(
    d       : in STD_LOGIC_VECTOR(15 downto 0); -- data
    ld      : in STD_LOGIC; -- load/enable.
    reset   : in STD_LOGIC; -- async. clear.
    clk     : in STD_LOGIC; -- clock.
    q       : out STD_LOGIC_VECTOR(15 downto 0) -- output
);
end Register_16_Bit;

architecture description of Register_16_Bit is

begin
    process(clk, reset)
    begin
        if reset = '1' then
            q <= x"0000";
        elsif clk'event and clk = '1' then
            if ld = '1' then
                q <= d;
            end if;
        end if;
    end process;
end description;