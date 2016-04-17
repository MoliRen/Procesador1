library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Procesador is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador;

architecture Behavioral of Procesador is

	COMPONENT CU
	PORT(
		OP : IN std_logic_vector(1 downto 0);
		OP3 : IN std_logic_vector(5 downto 0);          
		ALU_OP : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;


		COMPONENT InstructionMemory
	PORT(
		RST : IN std_logic;
		Address : IN std_logic_vector(31 downto 0);          
		instruction_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
		COMPONENT Register_file
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		RST : IN std_logic;
		DataToWrite : IN std_logic_vector(31 downto 0);          
		Crs1 : OUT std_logic_vector(31 downto 0);
		Crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PC
	PORT(
		PC_IN : IN std_logic_vector(31 downto 0);
		CLK : IN std_logic;
		RST : IN std_logic;          
		PC_OUT : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT ADD
	PORT(
		PC_OUT : IN std_logic_vector(31 downto 0);          
		SUM : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ALU
	PORT(
		ALU_OP : IN std_logic_vector(5 downto 0);
		CRs1 : IN std_logic_vector(31 downto 0);
		CRs2 : IN std_logic_vector(31 downto 0);          
		ALU_Result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Mux
	PORT(
		Sgu_in : IN std_logic_vector(31 downto 0);
		i : IN std_logic;
		Crs2 : IN std_logic_vector(31 downto 0);          
		Mux_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
		COMPONENT SGU
	PORT(
		Imm : IN std_logic_vector(12 downto 0);          
		SGU_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;


signal SUM_out : STD_LOGIC_VECTOR (31 downto 0); -- 1
signal PC_out : STD_LOGIC_VECTOR (31 downto 0); -- 2
signal PC2_out : STD_LOGIC_VECTOR (31 downto 0); -- 3
signal im_out : STD_LOGIC_VECTOR (31 downto 0); -- 4
signal Crs1_out, Crs2_out, dataToWrite_out, Mux_out, SGU_out : STD_LOGIC_VECTOR (31 downto 0); -- 5
signal ALU_OP_out : STD_LOGIC_VECTOR (5 downto 0); -- 6


begin



	Inst_ADD: ADD PORT MAP(
		PC_OUT => PC_out,
		SUM => SUM_out
	);
	

	
	Inst_CU: CU PORT MAP(
		OP => im_out(31 downto 30) ,
		OP3 => im_out(24 downto 19) ,
		ALU_OP => ALU_OP_out
	);

	
	Inst_InstructionMemory: InstructionMemory PORT MAP(
		RST => RST ,
		Address => PC2_out ,
		instruction_out => im_out 
	);
	


	Inst_Register_file: Register_file PORT MAP(
		rs1 => im_out (18 downto 14), 
		rs2 => im_out (4 downto 0),
		rd => im_out (29 downto 25) ,
		RST => RST ,
		DataToWrite => dataToWrite_out  ,
		Crs1 => Crs1_out,
		Crs2 => Crs2_out
	);
	
	Inst_PC: PC PORT MAP( --npc
		PC_IN => SUM_out,
		CLK => CLK,
		RST => RST,
		PC_OUT => PC_out
	);
	
	Inst_PC2: PC PORT MAP(
		PC_IN => PC_out,
		CLK => CLK ,
		RST => RST,
		PC_OUT => PC2_out 
	);


		Inst_ALU: ALU PORT MAP(
		ALU_OP => ALU_OP_out ,
		CRs1 => Crs1_out,
		CRs2 => Mux_out,
		ALU_Result => dataToWrite_out
	);
	
	Inst_Mux: Mux PORT MAP(
		Sgu_in => SGU_out,
		i => im_out(13),
		Crs2 => Crs2_out,
		Mux_out => Mux_out 
	);
	
	Inst_SGU: SGU PORT MAP(
		Imm => im_out(12 downto 0) ,
		SGU_out => SGU_out
	);
	
	S <= dataToWrite_out;
	
end Behavioral;

