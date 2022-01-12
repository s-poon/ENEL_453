-- --- Seven segment component
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SevenSegment is
    Port ( DP_in                                                 : in  STD_LOGIC_VECTOR (5 downto 0);
           Num_Hex0,Num_Hex1,Num_Hex2,Num_Hex3,Num_Hex4,Num_Hex5 : in  STD_LOGIC_VECTOR (3 downto 0);
           HEX0,HEX1,HEX2,HEX3,HEX4,HEX5                        : out STD_LOGIC_VECTOR (7 downto 0)
          );
end SevenSegment;
architecture Behavioral of SevenSegment is
	type hexi is array(0 to 5) of STD_LOGIC_VECTOR(3 downto 0);
	type hexo is array(0 to 5) of STD_LOGIC_VECTOR(7 downto 0);
	signal HEXIn :hexi := (others =>(others=> '0'));
	signal HEXOut :hexo := (others =>(others=> '0'));


--Note that component declaration comes after architecture and before begin (common source of error).
   Component SevenSegment_decoder is 
	
      port(  H     : out STD_LOGIC_VECTOR (7 downto 0);
             input : in  STD_LOGIC_VECTOR (3 downto 0);
             DP    : in  STD_LOGIC                               
          );                  
   end  Component;   
	begin
	HEXIn(0) <= Num_Hex0(3 downto 0);
	HEXIn(1) <= Num_Hex1(3 downto 0);
	HEXIn(2) <= Num_Hex2(3 downto 0);
	HEXIn(3) <= Num_Hex3(3 downto 0);
	HEXIn(4) <= Num_Hex4(3 downto 0);
	HEXIn(5) <= Num_Hex5(3 downto 0);
	
	HEX0(7 downto 0) <= HEXOut(0);
	HEX1(7 downto 0) <= HEXOut(1);
	HEX2(7 downto 0) <= HEXOut(2);
	HEX3(7 downto 0) <= HEXOut(3);
	HEX4(7 downto 0) <= HEXOut(4);
	HEX5(7 downto 0) <= HEXOut(5);

--Note that port mapping begins after begin (common source of error).

	GEN_DECODER:
	for I in 0 to 5 generate
			DECODERX : SevenSegment_decoder port map
										(H		 => HEXOut(I),
										 input => HEXin(I),
										 DP	 => DP_in(I)
										 );
	end generate GEN_DECODER;
	
		
                       
end Behavioral;