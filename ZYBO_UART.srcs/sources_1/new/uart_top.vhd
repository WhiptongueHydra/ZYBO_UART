----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2026 18:28:34
-- Design Name: 
-- Module Name: uart_top - Behavioral
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


entity uart_top is
    port (
        clk: in std_logic;
        rst: in std_logic;
        
        tx: out std_logic;
        rx: in std_logic;
        
        a_received_led: out std_logic;
        rx_err_led: out std_logic;
        
        start_flag: in std_logic
    );
end uart_top;

architecture Behavioral of uart_top is
--    signal clk_wire: std_logic;
--    signal rst_wire: std_logic;
    signal start_pulse: std_logic;

    signal baud_req_tx_wire: std_logic;
    signal baud_req_rx_wire: std_logic;
    signal baud_wire_tx: std_logic;
    signal baud_wire_rx: std_logic;
    
    signal byte_received_bus: std_logic_vector(7 downto 0) := (others => '0');
    
    constant letter_A_test_tx: std_logic_vector(7 downto 0) := "01100001";
begin
    -- Start flag needs single pulsing so very bad, will make this now
    pulsar_inst: entity work.single_pulsar
        port map(
            clk=>clk,
            rst=>rst,
            sig_in=>start_flag,
            pulse_out=>start_pulse
        );

    baud_gen_inst: entity work.baud_gen
        generic map (
            clk_freq=>125000000,
            baud_rate=>115200
        )
        port map (
            clk=>clk,
            rst=>rst,
            baud_req_tx=>baud_req_tx_wire,
            baud_req_rx=>baud_req_rx_wire,
            baud_out_tx=>baud_wire_tx,
            baud_out_rx=>baud_wire_rx
        );
        
    rx_ctrl_inst: entity work.uart_rx 
        port map (
            clk=>clk,
            rst=>rst,
            baud_req=>baud_req_rx_wire,
            baud_in=>baud_wire_rx,
            rx=>rx,
            byte_received=>byte_received_bus,
            err=>rx_err_led
        );    
        
    -- a_received_led <= '1' when byte_received_bus="01100001" else '0';
    a_received_led <= '1' when byte_received_bus="01100001" else '0';
        
    tx_ctrl_inst: entity work.uart_tx 
        port map (
            clk=>clk,
            rst=>rst,
            tx=>tx,
            baud_req=>baud_req_tx_wire,
            baud_in=>baud_wire_tx,
            data_in=>letter_A_test_tx,
            start_flag=>start_pulse
        );
        
end Behavioral;
