
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Sgu IS
END TB_Sgu;
 
ARCHITECTURE behavior OF TB_Sgu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SGU
    PORT(
         Imm : IN  std_logic_vector(12 downto 0);
         SGU_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Imm : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal SGU_out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SGU PORT MAP (
          Imm => Imm,
          SGU_out => SGU_out
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
			Imm <= "0000000000010";
		wait for 100 ns;
			Imm <= "1000000001000";
      -- insert stimulus here 

      wait;
   end process;

END;
