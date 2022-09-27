----------------------------------------------------------------------------------
-- Company:  FPGA'er
-- Engineer: Claudio Avi Chami - FPGA'er Website
--           http://fpgaer.tech
-- Create Date: 27.09.2022 
-- Module Name: arbiter.vhd
-- Description: Very simple arbiter with fixed priority
--              
-- Dependencies: none
-- 
-- Revision: 1
-- Revision  1 - Initial release
-- 
----------------------------------------------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arbiter is
  port (
    clk  : in  std_logic;
    rst  : in  std_logic;

    -- inputs
    req  : in  std_logic_vector(2 downto 0);
    busy : in  std_logic;

    -- outputs
    gnt  : out std_logic_vector(2 downto 0)
  );
end arbiter;

architecture rtl of arbiter is
  signal busy_d : std_logic := '0';
  signal busy_fe : std_logic;

begin
  busy_pr : process (clk)
  begin
    if (rising_edge(clk)) then
      busy_d <= busy;
    end if;
  end process busy_pr;

  -- Falling edge of busy signal
  busy_fe <= '1' when busy = '0' and busy_d = '1' else '0';

  arbiter_pr : process (clk, rst)
  begin
    if (rst = '1') then
      gnt <= (others => '0');
    elsif (rising_edge(clk)) then
      if (busy_fe = '1') then
        gnt <= (others => '0');
      elsif (busy = '0') then
        gnt(0) <= req(0);
        gnt(1) <= req(1) and not req(0);
        gnt(2) <= req(2) and not (req(0) or req(1));
      end if;
    end if;
  end process arbiter_pr;

end rtl;