
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Mux IS
END TB_Mux;
 
ARCHITECTURE behavior OF TB_Mux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux
    PORT(
         Sgu_in : IN  std_logic_vector(31 downto 0);
         i : IN  std_logic;
         Crs2 : IN  std_logic_vector(31 downto 0);
         Mux_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Sgu_in : std_logic_vector(31 downto 0) := (others => '0');
   signal i : std_logic := '0';
   signal Crs2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Mux_out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux PORT MAP (
          Sgu_in => Sgu_in,
          i => i,
          Crs2 => Crs2,
          Mux_out => Mux_out
        );

   -- Clock process definitions


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		i <= '1';
		Crs2 <=   "00000000000000000000000000000000";
		Sgu_in <= "11111111111111111111111111111111";
		
		wait for 100 ns;
		i <= '0';
		Crs2 <=   "00000000000000000000000000000000";
		Sgu_in <= "11111111111111111111111111111111";

   
      -- insert stimulus here 

      wait;
   end process;

END;
