library ieee;
use ieee.std_logic_1164.all;

entity decoder4x16 is
	port (
		addr: in std_logic_vector(3 downto 0);
		sel: out std_logic_vector(15 downto 0)
	);
end entity;

architecture comportamento of decoder4x16 is
begin
	process(addr)
	begin
		sel <= (others => '0');

		case addr is
			when "0000" => sel(0) <= '1';
			when "0001" => sel(1) <= '1';
			when "0010" => sel(2) <= '1';
			when "0011" => sel(3) <= '1';
			when "0100" => sel(4) <= '1';
			when "0101" => sel(5) <= '1';
			when "0110" => sel(6) <= '1';
			when "0111" => sel(7) <= '1';
			when "1000" => sel(8) <= '1';
			when "1001" => sel(9) <= '1';
			when "1010" => sel(10) <= '1';
			when "1011" => sel(11) <= '1';
			when "1100" => sel(12) <= '1';
			when "1101" => sel(13) <= '1';
			when "1110" => sel(14) <= '1';
			when "1111" => sel(15) <= '1';
			when others => null;
		end case;
	end process;
end comportamento;
