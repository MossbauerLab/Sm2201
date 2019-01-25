--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:28:58 01/26/2019
-- Design Name:   
-- Module Name:   E:/PLD/Sm2201/ISA_Camac_Interface/sm2201_interface_board/tests/SN74LS365A_testbench.vhd
-- Project Name:  sm2201_interface_board
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SN74LS365
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SN74LS365A_testbench IS
END SN74LS365A_testbench;
 
ARCHITECTURE behavior OF SN74LS365A_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SN74LS365
    PORT(
         e1 : IN  std_logic;
         e2 : IN  std_logic;
         data : IN  std_logic_vector(5 downto 0);
         out : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal e1 : std_logic := '0';
   signal e2 : std_logic := '0';
   signal data : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal out : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SN74LS365 PORT MAP (
          e1 => e1,
          e2 => e2,
          data => data,
          out => out
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
