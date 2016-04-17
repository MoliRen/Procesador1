library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ADD is
    Port ( PC_OUT : in  STD_LOGIC_VECTOR (31 downto 0);
           SUM : out  STD_LOGIC_VECTOR (31 downto 0));
end ADD;

architecture Behavioral of ADD is

signal N_4 : STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000001";

begin
	process(PC_OUT)
	begin
			SUM<= N_4 + PC_OUT;
		
	end process;


end Behavioral;

