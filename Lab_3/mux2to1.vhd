library ieee;
use ieee.std_logic_1164.all;

entity mux2to1 is

 
port( 
		input1 	: in std_logic_vector(12 downto 0);
		input2 	: in std_logic_vector(12 downto 0);
		control	: in std_logic;
		output1	: out std_logic_vector(12 downto 0)	
    );
end mux2to1;

architecture BEHAVIOR of mux2to1 is
begin
	output1 <= 	input1 when control = '0'
			else	input2 when control = '1'; 

end;










