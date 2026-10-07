-- MUX 8 ke 1, cascade dari 3 buah mux4to1
--   Tahap 1: mux4 (i0..i3) dan mux4 (i4..i7), dipilih oleh s1 s0
--   Tahap 2: 1 mux4 dipakai sebagai 2:1, dipilih oleh s2
-- Butuh: mux4to1.vhd (harus di-analyze lebih dulu)

library ieee;
use ieee.std_logic_1164.all;

entity mux8to1 is
    port (
        i0, i1, i2, i3, i4, i5, i6, i7 : in  std_logic;
        s0, s1, s2                     : in  std_logic;  -- s2 = MSB, s0 = LSB
        y                              : out std_logic
    );
end entity mux8to1;

architecture structural of mux8to1 is
    signal y_low, y_high : std_logic;
begin
    -- tahap 1
    U_LOW : entity work.mux4to1
        port map (i0 => i0, i1 => i1, i2 => i2, i3 => i3,
                  s0 => s0, s1 => s1, y => y_low);

    U_HIGH : entity work.mux4to1
        port map (i0 => i4, i1 => i5, i2 => i6, i3 => i7,
                  s0 => s0, s1 => s1, y => y_high);

    -- tahap 2 (i2 dan i3 tidak dipakai -> '0', s1 -> '0')
    U_FINAL : entity work.mux4to1
        port map (i0 => y_low, i1 => y_high, i2 => '0', i3 => '0',
                  s0 => s2, s1 => '0', y => y);
end architecture structural;