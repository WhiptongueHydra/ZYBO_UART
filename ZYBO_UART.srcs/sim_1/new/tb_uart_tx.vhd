----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2026 18:50:37
-- Design Name: 
-- Module Name: tb_uart_tx - Behavioral
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

entity tb_uart_tx is
end tb_uart_tx;

architecture Behavioral of tb_uart_tx is
    signal clk: std_logic := '0';
    signal rst: std_logic := '0';
    signal tx: std_logic;
    signal start_flag: std_logic;
    
    constant T: time := 8 ns;
    signal simDone: std_logic :='0';
begin
    dut: entity work.uart_top 
        port map(
            clk=>clk,
            rst=>rst,
            tx=>tx,
            rx=>'1', -- Drive idle
            start_flag=>start_flag
        );
        
     clk_proc: process
     begin
        while simDone /= '1' loop
            clk <= not clk;
            wait for T/2;
        end loop;
        wait;
     end process;
     
     stim_proc: process
     begin
        rst <= '1';
        start_flag <= '0';
        wait for T * 500;
        rst <= '0';
        start_flag <= '1';
        wait for T * 2;
        start_flag <= '0';
        wait for T * 50000;
        simDone <= '1';
        wait;        
     end process stim_proc;

end Behavioral;
