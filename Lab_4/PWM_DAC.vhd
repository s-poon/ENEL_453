library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity PWM_DAC is
   Generic ( width : integer := 15);
   Port    ( reset      : in STD_LOGIC;
             clk        : in STD_LOGIC;
             duty_cycle : in STD_LOGIC_VECTOR (width-1 downto 0);
             pwm_out    : out STD_LOGIC
           );
end PWM_DAC;

architecture Behavioral of PWM_DAC is
   signal counter : unsigned(width-1 downto 0);
	signal countto : STD_LOGIC_VECTOR (width-1 downto 0);
	
       
begin
	
	countto <= std_logic_vector(resize(unsigned(duty_cycle)*2,countto'length));
   count : process(clk,reset)
   begin
       if( rising_edge(clk)) then
			if (reset = '1') then 
				counter <= (others => '0');
			else
				if(counter > unsigned(countto)) then
					counter <= to_unsigned(0,counter'length);
				else
					counter <= counter + 1;
				end if;
			end if;
       end if;
   end process;
 
   compare : process(counter, duty_cycle)
   begin    
       if (counter < unsigned(duty_cycle)) then
           pwm_out <= '1';
       else 
           pwm_out <= '0';
       end if;
   end process;
  
	
end Behavioral;

