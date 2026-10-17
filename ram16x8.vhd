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
    signal q_mem: std_logic_vector(127 downto 0);

begin

    dec: decoder4x16 port map(addr, sel);

    en <= sel when enable = '1' else (others => '0');

    registradores: for i in 0 to 15 generate
        ri: registrador8 port map(din, clk, en(i), clear, q_mem((i*8)+7 downto i*8));
    end generate;

    mux: mux16x1_8 port map(q_mem(7 downto 0), q_mem(15 downto 8), q_mem(23 downto 16), q_mem(31 downto 24), q_mem(39 downto 32), q_mem(47 downto 40), q_mem(55 downto 48), q_mem(63 downto 56), q_mem(71 downto 64), q_mem(79 downto 72), q_mem(87 downto 80), q_mem(95 downto 88), q_mem(103 downto 96), q_mem(111 downto 104), q_mem(119 downto 112), q_mem(127 downto 120), addr, dout);

end estrutural;