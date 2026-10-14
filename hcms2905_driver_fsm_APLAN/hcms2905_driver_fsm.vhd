-- *************************************************************
-- Objects name: HCMS-2905 Driver FSM (HCMS2905DFSM)
-- -- Coding inputs:
-- D8.11 FSC FBL Detailed Description
-- Coding outputs:
-- (SIL3 FBL)
-- Version:	v00.02
-- Date:	
-- 		Revision description
-- 		According to 
-- 		Indication Board Unit Controller FBL VHDL Static Code Analysis/Code Review Report v1.0
--		Table 3 violation №8 – CS-04-MIN - Resolved
-- Designed by:
-- Reviewed by: 
-- ****************************************************************************

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

library work;
	use	work.std_types_lib_pkg.all;

entity hcms2905_driver_fsm is
	generic(
		DISP_SYMB_QTY		: integer := 4						-- Dot matrix display symbols quantity
	);
	port(
		i_clk				: in std_logic;						--Clock
		
		--Interface EI1 - asynchronous reset signal input
		i_disp_updt_a		: in std_logic;						--Signal initializes all internal logic and starts data acquisition
		
		--Interface EI2 - HCMS-2905 Driver logic state signals;
		i_srg_rdy			: in std_logic;						--Driver shift register ready signal
		
		--Interface EI3 - output of control signals
		o_led_ce_n			: out std_logic;					--Write enable signal for dot matrix display
		o_led_rs			: out std_logic;					--Selects Dot Register (RS is low) or Control Register (RS is high)
		o_addr				: out std_logic_vector(1 downto 0);	--Address for character pattern (Should be within 0 to 3)
		o_rdy				: out std_logic						--Ready signal – indicates that all operations were completed
	);
end hcms2905_driver_fsm;

architecture arch of hcms2905_driver_fsm is

	--Internal signals declaration
	type fsm is (
		Init_st,						-- Initialization state
		CW_Writing_st,					-- Control Word writing state
		Char_Address_Outputting_st,		-- Address outputting state
		Data_Writing_st,				-- Data Writing state
		Addr_Forming_st,				-- Pattern Address forming state
		Rdy_Forming_st					-- Ready signal forming state
	);
	signal state: fsm := Init_st;		-- FSM signal

begin
	process(i_clk, i_disp_updt_a)
		--Pattern address counter
		variable cnt		: integer range 0 to DISP_SYMB_QTY - 1 := DISP_SYMB_QTY - 1;
	begin
		if (i_disp_updt_a = '1') then
			o_rdy				<= '0';
			cnt					:= DISP_SYMB_QTY - 1;
			o_addr				<= (others => '0');
			o_led_rs			<= '1';
			o_led_ce_n			<= '1';
			state				<= Init_st;
		elsif (i_clk'event and i_clk = '1') then
			case state is
				--Initialization state assignment
				when Init_st =>
					o_rdy				<= '0';
					cnt					:= DISP_SYMB_QTY - 1;
					o_addr				<= (others => '0');
					o_led_rs			<= '1';
					o_led_ce_n			<= '1';
					state				<= CW_Writing_st;
				--Control Word writing state assignment
				when CW_Writing_st =>
					o_rdy				<= '0';
					o_addr				<= (others => '0');
					o_led_rs			<= '1';
					o_led_ce_n			<= '0';
					if (i_srg_rdy = '1') then
						state			<= Char_Address_Outputting_st;
					end if;
				--Data Receiving state assignment
				when Char_Address_Outputting_st =>
					o_rdy				<= '0';
					o_addr				<= conv_std_logic_vector(cnt, o_addr'length);
					o_led_rs			<= '0';
					o_led_ce_n			<= '1';
					if (i_srg_rdy = '0') then
						state			<= Data_Writing_st;
					end if;
				--Data Writing state assignment
				when Data_Writing_st =>
					o_rdy				<= '0';
					o_led_rs			<= '0';
					o_led_ce_n			<= '0';
					if (i_srg_rdy = '1') then
						state			<= Addr_Forming_st;
					end if;
				--Pattern Address forming state assignment
				when Addr_Forming_st =>
					o_rdy				<= '0';
					o_led_rs			<= '0';
					o_led_ce_n			<= '1';
					if (cnt > 0) then
						cnt				:= cnt - 1;
						state			<= Char_Address_Outputting_st;
					else
						state			<= Rdy_Forming_st;
					end if;
				--Rdy Forming state assignment
				when Rdy_Forming_st =>
					o_rdy				<= '1';
					cnt					:= DISP_SYMB_QTY - 1;
					o_addr				<= (others => '0');
					o_led_rs			<= '1';
					o_led_ce_n			<= '1';
					state				<= Rdy_Forming_st;
			end case;
		end if;
	end process;
end arch;