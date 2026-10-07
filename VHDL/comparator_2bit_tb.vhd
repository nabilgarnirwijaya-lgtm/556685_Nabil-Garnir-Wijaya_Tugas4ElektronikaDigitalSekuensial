library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_comparator_2bit is
end tb_comparator_2bit;

architecture Behavioral of tb_comparator_2bit is

    signal A  : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal B  : STD_LOGIC_VECTOR(1 downto 0) := "00";

    signal GT : STD_LOGIC;
    signal LT : STD_LOGIC;
    signal EQ : STD_LOGIC;

begin

    DUT : entity work.comparator_2bit
        port map (
            A  => A,
            B  => B,
            GT => GT,
            LT => LT,
            EQ => EQ
        );

    process
    begin

        A <= "00";
        B <= "00";
        wait for 10 ns;

        A <= "00";
        B <= "01";
        wait for 10 ns;

        A <= "01";
        B <= "00";
        wait for 10 ns;

        A <= "01";
        B <= "01";
        wait for 10 ns;

        A <= "01";
        B <= "10";
        wait for 10 ns;

        A <= "10";
        B <= "01";
        wait for 10 ns;

        A <= "10";
        B <= "10";
        wait for 10 ns;

        A <= "10";
        B <= "11";
        wait for 10 ns;

        A <= "11";
        B <= "10";
        wait for 10 ns;

        A <= "11";
        B <= "11";
        wait for 10 ns;

        wait;

    end process;

end Behavioral;