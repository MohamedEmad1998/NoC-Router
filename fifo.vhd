library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity fifo is port (
	reset,rclk,wclk,rreq,wreq : in std_logic;
	datain :in std_logic_vector (7 downto 0);
	empty,full : out std_logic;
	dataout : out std_logic_vector(7 downto 0));
end entity;

architecture fifo_behav of fifo is 
	component fifoController is port(
		reset,rdclk,wrclk,r_req,w_req : in  std_logic;
		write_valid, read_valid, empty, full : out std_logic;
		wr_ptr, rd_ptr : out std_logic_vector(2 downto 0));
	end component;

	component RAM is port ( 
		d_in : in std_logic_vector(7 downto 0); 
		d_out : out std_logic_vector(7 downto 0); 
		wea,rea,clka,clkb : in std_logic ; 
		addra,addrb : in std_logic_vector(2 downto 0));
	end component;

	signal Rvalid,Wvalid :std_logic;
	signal addra_ptr,addrb_ptr :std_logic_vector(2 downto 0);

	begin
        controller : fifoController 
	port map(
	reset => reset, rdclk => rclk, wrclk => wclk, r_req => rreq, w_req => wreq,
	write_valid => Wvalid, read_valid => Rvalid, wr_ptr => addra_ptr, rd_ptr =>addrb_ptr,
	full => full, empty => empty);
	
	memory : RAM
	port map(
	wea =>Wvalid, rea =>Rvalid, addra =>addra_ptr, addrb =>addrb_ptr, clka =>wclk, 
	clkb =>rclk, d_in =>datain, d_out =>dataout);
end architecture ;

