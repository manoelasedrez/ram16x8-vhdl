library ieee;
use ieee.std_logic_1164.all;

entity registrador8 is
	port (
		din: in std_logic_vector(7 downto 0);
		clk, enable, clear: in std_logic;
		q: out std_logic_vector(7 downto 0)
	);
end entity;

architecture estrutural of registrador8 is

	component ffd is
		port (
			d, clk, clear: in std_logic;
			q: out std_logic
		);
	end component;

	signal q_int, d_int: std_logic_vector(7 downto 0);

begin

	-- Define o valor que será enviado aos FF-D
	process(din, enable, q_int)
	begin
		if enable = '1' then
			d_int <= din;
		else
			d_int <= q_int;
		end if;
	end process;

	ff0: ffd port map(d_int(0), clk, clear, q_int(0));
	ff1: ffd port map(d_int(1), clk, clear, q_int(1));
	ff2: ffd port map(d_int(2), clk, clear, q_int(2));
	ff3: ffd port map(d_int(3), clk, clear, q_int(3));
	ff4: ffd port map(d_int(4), clk, clear, q_int(4));
	ff5: ffd port map(d_int(5), clk, clear, q_int(5));
	ff6: ffd port map(d_int(6), clk, clear, q_int(6));
	ff7: ffd port map(d_int(7), clk, clear, q_int(7));

	q <= q_int;

end estrutural;
