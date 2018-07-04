----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.05.2018 14:06:07
-- Design Name: 
-- Module Name: FSM_3_State - Behavioral
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

entity FSM_3_State is
    Port ( sig_in   : in STD_LOGIC;
           reset    : in STD_LOGIC;
           clk      : in STD_LOGIC;
           output   : out STD_LOGIC_VECTOR (1 downto 0));
end FSM_3_State;

architecture Behavioral of FSM_3_State is
   
   type state_type is (state_1, state_2, state_3);
   signal state, next_state : state_type;
   --Declare internal signals for all outputs of the state-machine
   signal output_i : std_logic_vector (1 downto 0);  -- example output signal
   --other outputs
begin
   SYNC_PROC : process (clk)
   begin
      if (clk'event and clk = '1') then
         if (reset = '1') then
            state <= state_1;
            output <= "00";
         else
            state <= next_state;
            output <= output_i;
         end if;
      end if;
   end process;

   OUTPUT_DECODE: process (state)
   begin
      if state = state_3 then
         output_i <= "10";
      elsif state = state_2 then
         output_i <= "01";
      else
         output_i <= "00";
      end if;
   end process;

    NEXT_STATE_DECODE: process (state, sig_in)
    begin
    --declare default state for next_state to avoid latches
    next_state <= state;  --default is to stay in current state
    if sig_in = '1' then
        case (state) is
            when state_1 =>
                next_state <= state_2;
            when state_2 =>
                next_state <= state_3;
            when state_3 =>
                next_state <= state_1;
            when others =>
                next_state <= state_1;
        end case;
    end if;
    end process;

end Behavioral;







				
				
