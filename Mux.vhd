
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux is
    Port ( Sgu_in : in  STD_LOGIC_VECTOR (31 downto 0);
			  i : in  STD_LOGIC;
           Crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Mux_out : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux;

architecture Behavioral of Mux is

begin
	process(i, Sgu_in, Crs2)
		begin
		if(i ='1')then
			Mux_out <= Sgu_in;
		
		else 
			Mux_out <= Crs2;
		end if;
	end process;
end Behavioral;

