----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2026 20:06:20
-- Design Name: 
-- Module Name: single_pulsar - Behavioral
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
use IEEE.NUMERIC_STD.ALL;


entity single_pulsar is
    port (
        clk: in std_logic;
        rst: in std_logic;
        sig_in: in std_logic;
        pulse_out: out std_logic
    );
end single_pulsar;


architecture Behavioral of single_pulsar is
    type states is (S0, S1, S2);
    signal pstate, nstate: states := S0;
begin
    sync_proc: process(clk)
    begin
        if rising_edge(clk) then
            if rst='1' then
                pstate <= S0;                
            else
                pstate <= nstate;
            end if;
        end if;
    end process sync_proc;

    comb_proc: process(pstate, sig_in)
    begin
        case pstate is 
            when S0 =>
                pulse_out <= '0';
                nstate <= S0;
                if sig_in='1' then
                    nstate <= S1;
                end if;    
                
            when S1 =>
                pulse_out <= '1';
                if sig_in='1' then
                    nstate <= S2;
                else
                    nstate <= S0;
                end if;
            
            when S2 =>
                pulse_out <= '0';
                if sig_in='1' then
                    nstate <= S2;
                else
                    nstate <= S0;
                end if;
            
            when others =>
                NULL;
        end case;
    end process comb_proc;
    
end Behavioral;
