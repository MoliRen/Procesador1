LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Add IS
END TB_Add;
 
ARCHITECTURE behavior OF TB_Add IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ADD
    PORT(
         PC_OUT : IN  std_logic_vector(31 downto 0);
         SUM : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PC_OUT : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal SUM : std_logic_vector(31 downto 0);
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ADD PORT MAP (
          PC_OUT => PC_OUT,
          SUM => SUM
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			PC_OUT<="00000000000000000000000000000000";
		wait for 100 ns;	
			PC_OUT<="00000000000000000000000000001110";
		wait for 100 ns;	
			PC_OUT<="00000000000000000000000000000011";
      wait;
   end process;

END;
