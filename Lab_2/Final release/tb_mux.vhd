library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux is
end tb_mux;


architecture test of tb_mux is

--Inputs
signal  control: STD_LOGIC;
signal 	input1, input2: STD_LOGIC_VECTOR (11 downto 0);
--Outputs
signal output1: STD_LOGIC_VECTOR (11 downto 0);


component mux2to1 is
port( 
		input1 	: in std_logic_vector(11 downto 0);
		input2 	: in std_logic_vector(11 downto 0);
		control	: in std_logic;
		output1	: out std_logic_vector(11 downto 0)	
    );
           
end component;

begin

	uut : mux2to1
	port map(
			
		input1 => input1,
		input2 => input2,
		control	=> control,
		output1 => output1
	);


	
	mux :process
	begin
		control <= '1';
		input1 <= "000000111111";
		input2 <= "111111000000";
		wait for 10000 ns;
		control <= '0';
		wait for 10000 ns;
		control <= '1';
		wait for 10000 ns;
		wait;
		
	end process;
	
end;