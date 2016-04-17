
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Cu IS
END TB_Cu;
 
ARCHITECTURE behavior OF TB_Cu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CU
    PORT(
         OP : IN  std_logic_vector(1 downto 0);
         OP3 : IN  std_logic_vector(5 downto 0);
         ALU_OP : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OP : std_logic_vector(1 downto 0) := (others => '0');
   signal OP3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal ALU_OP : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CU PORT MAP (
          OP => OP,
          OP3 => OP3,
          ALU_OP => ALU_OP
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
   
      wait for 100 ns;	

      OP <= "10";
		OP3 <= "000100";
		
		wait for 100 ns;
		
		OP <= "10";
		OP3 <= "000000";
		
		wait for 100 ns;
		
		OP <= "00";
		OP3 <= "000000";
		
      -- insert stimulus here 

      wait;
   end process;

END;
