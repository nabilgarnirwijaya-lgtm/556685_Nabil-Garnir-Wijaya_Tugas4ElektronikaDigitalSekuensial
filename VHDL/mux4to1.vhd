library ieee;
use ieee.std_logic_1164.all;

entity mux4to1 is
    port (
        i0, i1, i2, i3 : in  std_logic;  -- input data
        s0, s1         : in  std_logic;  -- select (s1 = MSB, s0 = LSB)
        y              : out std_logic   -- output
    );
end entity mux4to1;

architecture rtl of mux4to1 is
    signal sel : std_logic_vector(1 downto 0);
begin
    sel <= s1 & s0;

    with sel select
        y <= i0  when "00",
             i1  when "01",
             i2  when "10",
             i3  when "11",
             'X' when others;
end architecture rtl;