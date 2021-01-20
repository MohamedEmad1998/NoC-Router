library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Demux is
port( d_in : in std_logic_vector(7 downto 0);
      Sel : in std_logic_vector(1 downto 0);
      En: in std_logic;
d_out1,d_out2,d_out3,d_out4:out std_logic_vector(7 downto 0)); 
end demux;

architecture Demux_behav of Demux is
begin
    p1: process (d_in,Sel,En) is
    begin
        if En ='1' then
          case Sel is
            when "00" => 
            d_out1 <= d_in;
            d_out2 <= "00000000";
            d_out3 <= "00000000";
            d_out4 <= "00000000";

            when "01" => 
            d_out1 <= "00000000";
            d_out2 <= d_in;
            d_out3 <= "00000000";
            d_out4 <= "00000000";
             
            when "10" => 
            d_out1 <= "00000000";
            d_out2 <= "00000000";
            d_out3 <= d_in;
            d_out4 <= "00000000";
              
            when "11" =>
            d_out1 <= "00000000";
            d_out2 <= "00000000";
            d_out3 <= "00000000";
            d_out4 <= d_in;            

	    when others => null;
          end case;
        end if;
    end process p1;
end Demux_behav;

