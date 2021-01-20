LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity G2B_Converter is
port( gray_in: IN std_logic_vector(3 downto 0);
    bin_out: out std_logic_vector (3 downto 0));
end G2B_Converter;

architecture G2B_Converter_behav of G2B_Converter is
begin
bin_out(3)<= gray_in(3);
bin_out(2)<= gray_in(3) xor gray_in(2);
bin_out(1)<= gray_in(3) xor gray_in(2) xor gray_in(1);
bin_out(0)<= gray_in(3) xor gray_in(2) xor gray_in(1) xor gray_in(0);
end G2B_Converter_behav;