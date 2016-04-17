library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CU is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALU_OP : out  STD_LOGIC_VECTOR (5 downto 0));
end CU;

architecture Behavioral of CU is

begin
	
	process(OP,OP3)
	begin
		
		if(OP="10")then
			case (OP3) is 
				when "000000" => --ADD
					ALU_OP<="000000";
				when "000100" => --SUB
					ALU_OP<="000001";
				when "000011" => --XOR
					ALU_OP<="000010";
				when "000001" => --AND
					ALU_OP<="000011";
				when "000010" => --OR
					ALU_OP<="000100";
				when "000101" => --NAND
					ALU_OP<="000101";
				when "000110" => --NOR
					ALU_OP<="000110";
				when "000111" => --NXOR
					ALU_OP<="000111";
				when others =>
					ALU_OP<=(others=>'1');
			end case;
		else  ALU_OP <= "111111";
		end if;
	end process;


end Behavioral;
