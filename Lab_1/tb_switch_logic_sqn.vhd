
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY tb_switch_logic_sqn IS
END tb_switch_logic_sqn;

ARCHITECTURE behavior OF tb_switch_logic_sqn IS

-- Component Declaration for the UUT

	COMPONENT switch_logic
	PORT(
		  switches_inputs : IN std_logic_vector(2 downto 0);
        outputs : OUT std_logic_vector(2 downto 0);
        clk : IN std_logic;
        reset : in std_logic
		  );
	END COMPONENT;
	
	--Inputs
   signal switches_inputs : std_logic_vector(2 downto 0) := (others => '0');
    
   --Outputs
   signal outputs : std_logic_vector(2 downto 0);
	 
	--clk 
	signal clk: std_logic;
	 
	--reset
	signal reset: std_logic;
	 
	-- Clock process definitions
	constant clk_period : time := 10 ns;
	
	BEGIN	 
   
    -- Instantiate the Unit Under Test (UUT)
    uut: switch_logic PORT MAP (
        switches_inputs => switches_inputs,
        outputs => outputs,
        clk => clk,
        reset => reset  
	);
	
	--Processes for the test bench
	
	--Process for input A
	A_proc : process
	begin
		switches_inputs(0) <= '0';
		wait for 20 ns;
		switches_inputs(0) <= '1';
		wait for 20 ns;
	end process;
	
	--Process for input B
	B_proc : process
	begin
		switches_inputs(1) <= '0';
		wait for 40 ns;
		switches_inputs(1) <= '1';
		wait for 40 ns;
	end process;
	
	--Process for input B
	C_proc : process
	begin
		switches_inputs(2) <= '0';
		wait for 80 ns;
		switches_inputs(2) <= '1';
		wait for 80 ns;
	end process;
	
	--Process for clock
	clk_proc : process
	begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
	end process;
	
	--Process for reset
	reset_proc : process
	begin
		reset <= '0';
		wait for 50 ns;
		reset <= '1';
		wait for 25 ns;
	end process;
END;
	
