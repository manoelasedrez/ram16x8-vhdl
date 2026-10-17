library ieee;
use ieee.std_logic_1164.all;

entity registrador8 is
    port (
        din: in  std_logic_vector(7 downto 0);
        clk, enable, clear: in  std_logic;
        q: out std_logic_vector(7 downto 0)
    );
end entity;

architecture estrutural of registrador8 is

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
	 
	registador8bits: for i in 0 to 7 generate
	 
	ffdi: entity work.ffd 
	port map(d => d_int(i), clk => clk, clear =>clear, q => q_int(i));
	 
    end generate;

    q <= q_int;

end estrutural;