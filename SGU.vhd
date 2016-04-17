
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SGU is
    Port ( Imm : in  STD_LOGIC_VECTOR (12 downto 0);
           SGU_out : out  STD_LOGIC_VECTOR (31 downto 0));
end SGU;

architecture Behavioral of SGU is

begin
	process(Imm)
	begin
		if(Imm(12) = '1')then
			SGU_out(12 Downto 0) <= Imm;
			SGU_out(31 Downto 13) <= (others=>'1');
			
		else 
			SGU_out(12 Downto 0) <= Imm;
			SGU_out(31 Downto 13) <= (others=>'0');
		end if;
	end process;
end Behavioral;

