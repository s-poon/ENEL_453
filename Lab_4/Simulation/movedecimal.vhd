
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY movedecimal IS

   PORT(
      MSBin    :  IN    STD_LOGIC_VECTOR(7 DOWNTO 0);                                
      SMSBin   :  IN    STD_LOGIC_VECTOR(7 DOWNTO 0);                                
      ctrl     :  IN    STD_LOGIC;                                
      MSBout   :  OUT   STD_LOGIC_VECTOR(7 DOWNTO 0);         
      SMSBout  :  OUT   STD_LOGIC_VECTOR(7 DOWNTO 0));                           
END movedecimal;

ARCHITECTURE behavior OF movedecimal IS

Signal in1 :STD_LOGIC_VECTOR(7 DOWNTO 0);
signal in2 :STD_LOGIC_VECTOR(7 DOWNTO 0);
Signal out1 :STD_LOGIC_VECTOR(7 DOWNTO 0);
signal out2 :STD_LOGIC_VECTOR(7 DOWNTO 0);


begin

	in1 <= MSBin;
	in2 <= SMSBin;

	whichone : process(ctrl, MSBin)
	begin 
	if ctrl = '0' then
		MSBout <= in1;
		SMSBout <= in2;
	else
		if in1(6 downto 0) = "1000000" then
			out1 <= "11111111";
			out2(7) <= '0';
			out2(6 downto 0) <= SMSBin(6 downto 0);
		else
			out1(7) <= '1';
			out1(6 downto 0) <= MSBin(6 downto 0);
			out2(7) <= '0';
			out2(6 downto 0) <= SMSBin(6 downto 0);
		end if;
		MSBout <= out1;
		SMSBout <= out2;
	end if;
	end process;





end behavior;