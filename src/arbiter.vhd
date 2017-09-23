------------------------------------------------------------------
-- Name		     : arbiter.vhd
-- Description : Very simple arbiter with fixed priority
-- Designed by : Claudio Avi Chami - FPGA Site
-- Version     : 02
-- Changes
--    Version 02 -- added busy signal
------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arbiter is
	port (
		clk: 		in std_logic;
		rst: 		in std_logic;
		
		-- inputs
		req:		in std_logic_vector(2 downto 0);
    busy:   in std_logic;
		
		-- outputs
		gnt:		out std_logic_vector(2 downto 0)
	);
end arbiter;


architecture rtl of arbiter is
  signal busy_d : std_logic;
  signal busy_fe : std_logic;
  

begin 
  busy_pr: process (clk, rst) 
  begin 
    if (rst = '1') then 
      busy_d <= '0';
    elsif (rising_edge(clk)) then
      busy_d <= busy;
    end if;
  end process busy_pr;

  -- Rising and falling edges of busy signal
  busy_fe <= '1' when busy = '0' and busy_d = '1' else '0';

  arbiter_pr: process (clk, rst) 
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