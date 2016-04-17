library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Register_file is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           RST : in  STD_LOGIC;
           DataToWrite : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_file;

architecture Behavioral of Register_file is
	type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);
	signal registers : ram_type := (others => x"00000000");
											 
begin

	process(RST,rs1,rs2,rd,DataToWrite)
	begin
				registers(0) <=X"00000000";
            if(RST = '1')then
                Crs1 <= (others=>'0');
                Crs2 <= (others=>'0');
               -- registers <= (others => x"00000000");
                
            else
                Crs1 <= registers(conv_integer(rs1));
					Crs2 <= registers(conv_integer(rs2));
		if(rd /= "000000")then
                    registers(conv_integer(rd)) <= DataToWrite;
                    
                end if;
            end if;
        end process;
end Behavioral;


