library ieee;
use ieee.std_logic_1164.all;

entity ffd is
    port (
        d, clk, clear : in std_logic;
        q      : out std_logic
    );
end entity;

architecture comportamento of ffd is
begin
    process(clk, clear)
    begin
		if clear = '1' then
			q <= '0';
		elsif rising_edge(clk) then
			q <= d;
		end if;
	end process;
end comportamento;
