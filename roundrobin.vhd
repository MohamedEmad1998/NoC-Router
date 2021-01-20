library ieee;
use ieee.std_logic_1164.all;

entity roundrobin is port (
    din1,din2,din3,din4 : in  std_logic_vector(7 downto 0); 
    dout : out  std_logic_vector(7 downto 0);
    Clock :  in  std_logic);                                      
end roundrobin;

architecture roundrobin_behav of roundrobin is
type state is (s1,s2,s3,s4);      
signal CS,NS : state;  
begin  
current_state: process (Clock)
begin  
if(rising_edge(Clock))THEN CS <=NS;
end if;
end process current_state ;

next_state: process (CS)  
begin
case CS is
when s1 => NS <=s2; 
when s2 => NS <=s3; 
when s3 => NS <=s4; 
when s4 => NS <=s1; 
end case;
end process next_state ;

op: process (CS)
begin
case CS is
when s1 => dout <= din1;
when s2 => dout <= din2;
when s3 => dout <= din3;
when s4=> dout <= din4;
end case;
end process op ;
end architecture roundrobin_behav;
