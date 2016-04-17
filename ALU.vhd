library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU is
    Port ( ALU_OP : in  STD_LOGIC_VECTOR (5 downto 0);
           CRs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Result : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

	process (ALU_OP,CRs1,CRs2)
		begin
		
			case(ALU_OP) is
				when "000000" => --ADD
					ALU_Result<= CRs1 + CRs2;
				when "000001" => --SUB
					ALU_Result<= CRs1 - CRs2;
				when "000010" => --XOR
					ALU_Result<=(CRs1 XOR CRs2);
				when "000011" => --AND
					ALU_Result<=(CRs1 AND CRs2);
				when "000100" => --OR
					ALU_Result<=(CRs1 OR CRs2);
				when "000101" => --NAND
					ALU_Result<=(CRs1 NAND CRs2);
				when "000110" => --NOR
					ALU_Result<=(CRs1 XOR CRs2);
				when "000111" => --NXOR
					ALU_Result<=(CRs1 XNOR CRs2);
				when others =>
					ALU_Result<=(others=>'0');
			end case;
				
			
	end process;


end Behavioral;



