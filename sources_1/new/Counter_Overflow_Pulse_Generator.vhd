----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2018 15:24:16
-- Design Name: 
-- Module Name: overflow_pulse_Counter - Behavioral
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

entity Counter_Overflow_Pulse_Generator is
    Port (
        clk : in STD_LOGIC;
        counter_value : in STD_LOGIC_VECTOR (15 downto 0); 
        overflow_pulse : out STD_LOGIC
    );
end Counter_Overflow_Pulse_Generator;

architecture Behavioral of Counter_Overflow_Pulse_Generator is

signal output : STD_LOGIC;

begin
    process(clk)
        begin
            if clk'event and clk = '1' then
                if unsigned(counter_value) = 0 then
                    output <= '1';
                else
                    output <= '0';
                end if;
            end if;
    end process;
    
    overflow_pulse <= output;
    
end Behavioral;