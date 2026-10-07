library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comparator_2bit is
    Port (
        A  : in STD_LOGIC_VECTOR(1 downto 0);
        B  : in STD_LOGIC_VECTOR(1 downto 0);
        GT : out STD_LOGIC;
        LT : out STD_LOGIC;
        EQ : out STD_LOGIC
    );
end comparator_2bit;

architecture Behavioral of comparator_2bit is
begin

    process(A, B)
    begin
        if unsigned(A) > unsigned(B) then
            GT <= '1';
            LT <= '0';
            EQ <= '0';

        elsif unsigned(A) < unsigned(B) then
            GT <= '0';
            LT <= '1';
            EQ <= '0';

        else
            GT <= '0';
            LT <= '0';
            EQ <= '1';
        end if;
    end process;

end Behavioral;