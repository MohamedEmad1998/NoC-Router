library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.ALL;

entity Router_test is
  GENERIC (N : INTEGER := 7);
end entity;

architecture Router_test_behav of Router_test is
SIGNAL wclock,rclock,rst : std_logic :='0';
SIGNAL datai1,datai2,datai3,datai4 : std_logic_vector(N DOWNTO 0):="00000000";
SIGNAL wr1,wr2,wr3,wr4 : std_logic :='0';
SIGNAL datao1,datao2,datao3,datao4 : std_logic_vector(N DOWNTO 0):="00000000";
constant delay: time := 100 ns;

component router port(
	datai1,datai2,datai3,datai4 : in std_logic_vector(N downto 0);
	datao1,datao2,datao3,datao4 :out std_logic_vector(N downto 0);
	wr1,wr2,wr3,wr4,wclock,rclock,rst : in std_logic);
end component;

begin
dut: Router port map (datai1,datai2,datai3,datai4,datao1,
datao2,datao3,datao4,wr1,wr2,wr3,wr4,wclock,rclock,rst);

p_w: process is
begin
wclock <= '0', '1' after delay/2;
wait for delay;
end process;

p_r: process is
begin
rclock <= '0', '1' after delay/2;
wait for delay;
end process;

p_stim: process is 
begin 
-- Test 1 send packets to port 1 
wr1<='1';wr2<='1';wr3<='1';wr4<='1';rst <= '0';
datai1<="11110000";Datai2<="00001100";datai3<="11000000";datai4<="00000000";
WAIT FOR delay;

-- Test 2 send packets to port 2
datai1<="11110001";datai2<="00001101";datai3<="11000001";datai4<="00000001";
WAIT FOR delay;

-- Test 3 send packets to port 3
datai1<="11110010";datai2<="00001110";datai3<="11000010";datai4<="00000010";
WAIT FOR delay;

-- Test 4 send packets to port 4
datai1<="11110011";datai2<="00001111";datai3<="11000011";datai4<="00000011";
WAIT FOR delay;

-- Test 5 no writing 
wr1<='0';wr2<='0';wr3<='0';wr4<='0';
datai1<="10101000";Datai2<="10101000";datai3<="10101000";datai4<="10101000";
WAIT ;

end process;
end architecture; 