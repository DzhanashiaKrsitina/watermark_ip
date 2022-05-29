-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\Watermarker\Bit_Divider_Inner.vhd
-- Created: 2022-05-12 16:51:49
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Bit_Divider_Inner
-- Source Path: Watermarker/watermarking/Indexing/Index Definer/Bit Divider Inner
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Bit_Divider_Inner IS
  PORT( in_rsvd                           :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        LSBs                              :   OUT   std_logic_vector(4 DOWNTO 0);  -- ufix5
        MSBs                              :   OUT   std_logic_vector(2 DOWNTO 0)  -- ufix3
        );
END Bit_Divider_Inner;


ARCHITECTURE rtl OF Bit_Divider_Inner IS

  -- Signals
  SIGNAL in_unsigned                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL LSBs_tmp                         : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL MSBs_tmp                         : unsigned(2 DOWNTO 0);  -- ufix3

BEGIN
  in_unsigned <= unsigned(in_rsvd);

  LSBs_tmp <= in_unsigned(4 DOWNTO 0);

  LSBs <= std_logic_vector(LSBs_tmp);

  MSBs_tmp <= in_unsigned(7 DOWNTO 5);

  MSBs <= std_logic_vector(MSBs_tmp);

END rtl;

