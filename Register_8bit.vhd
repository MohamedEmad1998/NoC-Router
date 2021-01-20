library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_8bit is
Port ( Data_in  : in  STD_LOGIC_VECTOR (7 DOWNTO 0);
       Clock,Clock_En,Reset : in  STD_LOGIC;
       Data_out    : out  STD_LOGIC_VECTOR (7 DOWNTO 0));
end Register_8bit;

architecture Register_8bit_behav of Register_8bit is
begin
PROCESS(Clock,Reset)
BEGIN
IF(Reset='1') THEN
   Data_out <=(others =>'0');
ELSIF(Clock'event AND Clock='1')THEN
   IF(Clock_En ='1') THEN
      Data_out <= Data_in;
    END IF;
else NUll;
END IF;
END PROCESS;
end Register_8bit_behav;


