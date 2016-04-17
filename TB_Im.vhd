
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Im IS
END TB_Im;
 
ARCHITECTURE behavior OF TB_Im IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InstructionMemory
    PORT(
         RST : IN  std_logic;
         Address : IN  std_logic_vector(31 Downto 0);
         instruction_out : OUT  std_logic_vector(31 Downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RST : std_logic := '0';
   signal Address : std_logic_vector(0 to 31) := (others => '0');

 	--Outputs
   signal instruction_out : std_logic_vector(0 to 31);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InstructionMemory PORT MAP (
          RST => RST,
          Address => Address,
          instruction_out => instruction_out
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		RST <='1';
		
      wait for 100 ns;	
		RST <= '0';
		Address <= x"00000001";

      -- insert stimulus here 

      wait;
   end process;

END;
