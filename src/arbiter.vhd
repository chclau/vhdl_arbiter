------------------------------------------------------------------
-- Name		   : arbiter.vhd
-- Description : Very simple arbiter with fixed priority
-- Designed by : Claudio Avi Chami - FPGA Site
-- Date        : 13/04/2016
-- Version     : 01
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
		
		-- outputs
		gnt:		out std_logic_vector(2 downto 0)
	);
end arbiter;


architecture rtl of arbiter is

begin 

  arbiter_pr: process (clk, rst) 
  begin 
    if (rst = '1') then 
      gnt <= (others => '0');
    elsif (rising_edge(clk)) then
      gnt(0) <= req(0);
		  gnt(1) <= req(1) and not req(0);
		  gnt(2) <= req(2) and not (req(0) or req(1));
    end if;
  end process arbiter_pr;

end rtl;