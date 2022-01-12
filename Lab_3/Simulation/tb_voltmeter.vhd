library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_voltmeter is
end tb_voltmeter;


architecture test of tb_voltmeter is

--Inputs
signal clk, reset : STD_LOGIC;
--Outputs
signal LEDR 		: STD_LOGIC_VECTOR (9 downto 0);
signal HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 : STD_LOGIC_VECTOR (7 downto 0);
--Clock process definitions
constant clk_period: time:=20ns;

component Voltmeter is
    Port ( clk                           : in  STD_LOGIC;
           reset                         : in  STD_LOGIC;
           LEDR                          : out STD_LOGIC_VECTOR (9 downto 0);
           HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 : out STD_LOGIC_VECTOR (7 downto 0)
          );
           
end component;

begin

	uut : Voltmeter
	port map(
		clk	=> clk,
		reset	=> reset,
		LEDR	=> LEDR,
		HEX0	=> HEX0,
		HEX1	=> HEX1,
		HEX2	=> HEX2,
		HEX3	=> HEX3,
		HEX4	=> HEX4,
		HEX5	=> HEX5
	);

	clk_process :process
	begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		
	end process;
	
	sim_process :process
	begin
		reset <= '0';
		wait for clk_period*5;
		reset <= '1';
		wait for clk_period;
		reset <= '0';
	wait;
	end process;
	
end;
	
	










