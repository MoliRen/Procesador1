LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Pc IS
END TB_Pc;
 
ARCHITECTURE behavior OF TB_Pc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         PC_IN : IN  std_logic_vector(31 downto 0);
         CLK : IN  std_logic;
         RST : IN  std_logic;
         PC_OUT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PC_IN : std_logic_vector(31 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal PC_OUT : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          PC_IN => PC_IN,
          CLK => CLK,
          RST => RST,
          PC_OUT => PC_OUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
	
      wait for CLK_period*10;
		
		RST <= '1';
		PC_IN <= "11111111111111111111111111111111";
		
		

		 wait for CLK_period*10;
		
		RST <= '0';
		PC_IN <= "11111111111111111111111111111111";
		
		
		 wait for CLK_period*10;
		
		RST <= '0';
		PC_IN <= "00000000000000000000000000000000";
		
		
      -- insert stimulus here 



      wait;
   end process;

END;