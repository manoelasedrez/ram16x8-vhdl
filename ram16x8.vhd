library ieee;
use ieee.std_logic_1164.all;

entity ram16x8 is
	port (
		din: in std_logic_vector(7 downto 0);
		addr: in std_logic_vector(3 downto 0);
		clk, enable, clear: in std_logic;
		dout: out std_logic_vector(7 downto 0)
	);
end entity;

architecture estrutural of ram16x8 is

	component decoder4x16 is
		port (
			addr: in std_logic_vector(3 downto 0);
			sel: out std_logic_vector(15 downto 0)
		);
	end component;

	component registrador8 is
		port (
			din: in std_logic_vector(7 downto 0);
			clk, enable, clear: in std_logic;
			q: out std_logic_vector(7 downto 0)
		);
	end component;

	component mux16x1_8 is
		port (
			q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15: in std_logic_vector(7 downto 0);
			addr: in std_logic_vector(3 downto 0);
			dout: out std_logic_vector(7 downto 0)
		);
	end component;

	signal sel, en: std_logic_vector(15 downto 0);
	signal clear_i: std_logic;

	signal q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15: std_logic_vector(7 downto 0);

begin

	clear_i <= not clear;

	dec: decoder4x16 port map(addr, sel);

	-- Só a posição selecionada pode gravar quando enable='1'
	en <= sel when enable = '1' else (others => '0');

	r0: registrador8 port map(din, clk, en(0), clear_i, q0);
	r1: registrador8 port map(din, clk, en(1), clear_i, q1);
	r2: registrador8 port map(din, clk, en(2), clear_i, q2);
	r3: registrador8 port map(din, clk, en(3), clear_i, q3);
	r4: registrador8 port map(din, clk, en(4), clear_i, q4);
	r5: registrador8 port map(din, clk, en(5), clear_i, q5);
	r6: registrador8 port map(din, clk, en(6), clear_i, q6);
	r7: registrador8 port map(din, clk, en(7), clear_i, q7);
	r8: registrador8 port map(din, clk, en(8), clear_i, q8);
	r9: registrador8 port map(din, clk, en(9), clear_i, q9);
	r10: registrador8 port map(din, clk, en(10), clear_i, q10);
	r11: registrador8 port map(din, clk, en(11), clear_i, q11);
	r12: registrador8 port map(din, clk, en(12), clear_i, q12);
	r13: registrador8 port map(din, clk, en(13), clear_i, q13);
	r14: registrador8 port map(din, clk, en(14), clear_i, q14);
	r15: registrador8 port map(din, clk, en(15), clear_i, q15);

	mux: mux16x1_8
		port map(q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, addr, dout);

end estrutural;
