LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY counter IS
PORT (Clock, Reset, En: IN std_logic;
      Count_output: OUT std_logic_vector (3 DOWNTO 0));
END counter;

ARCHITECTURE counter_behav OF counter IS
SIGNAL CS,NS,hold,Nhold:std_logic_vector(3 DOWNTO 0);
BEGIN
  P_state: PROCESS (Clock,Reset,En)
  BEGIN
    IF (Clock = '1' AND Clock'EVENT) THEN
      IF (Reset = '1') THEN
        CS <= (OTHERS =>'0');
      ELSIF (En = '1') THEN
        CS <= NS;
      END IF;
    END IF;
  END PROCESS;

  hold <= CS XOR ('0' & hold(3 DOWNTO 1));
  Nhold <= std_logic_vector(unsigned(hold) + 1);
  NS <= Nhold XOR ('0' & Nhold(3 DOWNTO 1)); 
  Count_output <= CS;

END counter_behav;
