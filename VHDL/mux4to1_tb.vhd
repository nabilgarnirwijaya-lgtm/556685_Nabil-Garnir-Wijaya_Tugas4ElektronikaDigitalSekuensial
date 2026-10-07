library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_mux4to1 is
end entity tb_mux4to1;

architecture sim of tb_mux4to1 is
    signal i0, i1, i2, i3 : std_logic := '0';
    signal s0, s1         : std_logic := '0';
    signal y              : std_logic;
begin
    DUT : entity work.mux4to1
        port map (i0 => i0, i1 => i1, i2 => i2, i3 => i3,
                  s0 => s0, s1 => s1, y => y);

    stim : process
        type pat_array is array (0 to 1) of std_logic_vector(3 downto 0);
        -- pola kedua = kebalikan pola pertama
        constant PATS : pat_array := ("1010", "0101");
        variable pat  : std_logic_vector(3 downto 0);
        variable sel  : std_logic_vector(1 downto 0);
    begin
        for p in PATS'range loop
            pat := PATS(p);
            i0 <= pat(0);
            i1 <= pat(1);
            i2 <= pat(2);
            i3 <= pat(3);
            for k in 0 to 3 loop
                sel := std_logic_vector(to_unsigned(k, 2));
                s0 <= sel(0);
                s1 <= sel(1);
                wait for 10 ns;
                assert y = pat(k)
                    report "mux4to1 SALAH pada select=" & integer'image(k)
                    severity error;
            end loop;
        end loop;
        report "tb_mux4to1 selesai";
        wait;
    end process stim;
end architecture sim;