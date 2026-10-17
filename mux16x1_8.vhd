library ieee;
use ieee.std_logic_1164.all;

entity mux16x1_8 is
    port (
        q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15 : in std_logic_vector(7 downto 0);
        addr : in  std_logic_vector(3 downto 0);
        dout : out std_logic_vector(7 downto 0)
    );
end entity;

architecture comportamento of mux16x1_8 is
begin
    process(addr, q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15)
    begin
        case addr is
            when "0000" => dout <= q0;
            when "0001" => dout <= q1;
            when "0010" => dout <= q2;
            when "0011" => dout <= q3;
            when "0100" => dout <= q4;
            when "0101" => dout <= q5;
            when "0110" => dout <= q6;
            when "0111" => dout <= q7;
            when "1000" => dout <= q8;
            when "1001" => dout <= q9;
            when "1010" => dout <= q10;
            when "1011" => dout <= q11;
            when "1100" => dout <= q12;
            when "1101" => dout <= q13;
            when "1110" => dout <= q14;
            when "1111" => dout <= q15;
            when others => dout <= (others => '0');
        end case;
    end process;
end comportamento;
