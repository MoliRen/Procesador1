library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PC is
    Port ( PC_IN : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
			  RST : in STD_LOGIC;
           PC_OUT : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture Behavioral of PC is

begin

	process(CLK,PC_IN,RST)
	begin
		
		if(RST='1')then
			PC_OUT<=(others=>'0');
			
		else
			if(rising_edge(CLK))then
				PC_OUT<=PC_IN;
			end if;
		end if;
	end process;


end Behavioral;

