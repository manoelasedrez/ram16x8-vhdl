library ieee;
use ieee.std_logic_1164.all;

entity tb_ram16x8 is
end entity;

architecture teste of tb_ram16x8 is

    component ram16x8 is
        port (
            din: in  std_logic_vector(7 downto 0);
            addr: in  std_logic_vector(3 downto 0);
            clk, enable, clear: in  std_logic;
            dout: out std_logic_vector(7 downto 0)
        );
    end component;

    signal din: std_logic_vector(7 downto 0) := (others => '0');
    signal addr: std_logic_vector(3 downto 0) := (others => '0');
    signal clk, enable, clear: std_logic := '0';
    signal dout: std_logic_vector(7 downto 0);

begin

    dut: ram16x8
        port map (din, addr, clk, enable, clear, dout);

    -- clock de 10 ns
    clk <= not clk after 5 ns;

    process
    begin
        -- Limpa toda a memória (clear síncrono)
        clear <= '1';
        wait for 12 ns;  -- atravessa uma borda de subida
        clear <= '0';
        wait for 8 ns;

        -- Escreve 10101010 no endereço 3
        addr <= "0011";
        din <= "10101010";
        enable <= '1';
        wait for 10 ns;

        -- Escreve 00110011 no endereço 7
        addr <= "0111";
        din <= "00110011";
        wait for 10 ns;

        -- Desabilita escrita
        enable <= '0';

        -- Leitura assíncrona: muda endereço SEM depender de clock
        addr <= "0011";
        wait for 3 ns;  -- dout deve virar 10101010

        addr <= "0111";
        wait for 3 ns;  -- dout deve virar 00110011

        -- Testa enable=0: tenta sobrescrever endereço 3
        addr <= "0011";
        din <= "11111111";
        enable <= '0';
        wait for 10 ns; -- não deve gravar

        addr <= "0011";
        wait for 3 ns;  -- deve continuar 10101010

        -- Clear
        clear <= '1';
        wait for 10 ns;
        clear <= '0';

        addr <= "0011";
        wait for 3 ns;  -- deve ser 00000000
        addr <= "0111";
        wait for 3 ns;  -- deve ser 00000000

        wait;
    end process;

end teste;
