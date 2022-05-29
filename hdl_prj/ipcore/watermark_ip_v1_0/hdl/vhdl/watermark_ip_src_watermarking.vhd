-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\Watermarker\watermark_ip_src_watermarking.vhd
-- Created: 2022-05-12 00:35:59
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 1
-- Target subsystem base rate: 1
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        1
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- pixel_out                     ce_out        1
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: watermark_ip_src_watermarking
-- Source Path: Watermarker/watermarking
-- Hierarchy Level: 0
-- 
-- Simulink model description for Watermarker:
-- 
-- Performs watermarking.
-- In:
-- - One channel of 8-bit image 256x256
-- - Watermark (64 bits)
-- Out:
-- - Watermarked image channel
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.watermark_ip_src_watermarking_pac.ALL;

ENTITY watermark_ip_src_watermarking IS
  PORT( clk                               :   IN    std_logic;
        rstx                              :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        pixel_in                          :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        mes_in                            :   IN    std_logic;
        ce_out                            :   OUT   std_logic;
        pixel_out                         :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
        );
END watermark_ip_src_watermarking;


ARCHITECTURE rtl OF watermark_ip_src_watermarking IS

  -- Component Declarations
  COMPONENT watermark_ip_src_Indexing
    PORT( clk                             :   IN    std_logic;
          rstx                            :   IN    std_logic;
          enb                             :   IN    std_logic;
          message                         :   IN    std_logic;
          Temp0                           :   OUT   std_logic;
          Temp1                           :   OUT   std_logic;
          MessageOut                      :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : watermark_ip_src_Indexing
    USE ENTITY work.watermark_ip_src_Indexing(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL i0                               : std_logic;
  SIGNAL i1                               : std_logic;
  SIGNAL rst_x                            : std_logic;
  SIGNAL rst_x_1                          : std_logic;
  SIGNAL rst_x_2                          : std_logic;
  SIGNAL pixel_in_unsigned                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL pixel_in_1                       : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Constant_out1                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Delay_reg                        : vector_of_unsigned8(0 TO 1);  -- ufix8 [2]
  SIGNAL Delay_out1                       : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Add1_out1                        : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Add_out1                         : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL out_rsvd                         : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL out_rsvd_1                       : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL out_rsvd_2                       : unsigned(7 DOWNTO 0);  -- uint8

BEGIN
  u_Indexing : watermark_ip_src_Indexing
    PORT MAP( clk => clk,
              rstx => rstx,
              enb => clk_enable,
              message => mes_in,
              Temp0 => i0,
              Temp1 => i1,
              MessageOut => rst_x
              );

  enb <= clk_enable;

  delayMatch_process : PROCESS (clk, rstx)
  BEGIN
    IF rstx = '1' THEN
      rst_x_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rst_x_1 <= rst_x;
      END IF;
    END IF;
  END PROCESS delayMatch_process;


  
  rst_x_2 <= i1 WHEN rst_x_1 = '0' ELSE
      i0;

  pixel_in_unsigned <= unsigned(pixel_in);

  delayMatch2_process : PROCESS (clk, rstx)
  BEGIN
    IF rstx = '1' THEN
      pixel_in_1 <= to_unsigned(16#00#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        pixel_in_1 <= pixel_in_unsigned;
      END IF;
    END IF;
  END PROCESS delayMatch2_process;


  Constant_out1 <= to_unsigned(16#0C#, 8);

  Delay_process : PROCESS (clk, rstx)
  BEGIN
    IF rstx = '1' THEN
      Delay_reg <= (OTHERS => to_unsigned(16#00#, 8));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay_reg(0) <= pixel_in_unsigned;
        Delay_reg(1) <= Delay_reg(0);
      END IF;
    END IF;
  END PROCESS Delay_process;

  Delay_out1 <= Delay_reg(1);

  Add1_out1 <= Constant_out1 + Delay_out1;

  Add_out1 <= Delay_out1 - Constant_out1;

  
  out_rsvd <= Add1_out1 WHEN rst_x = '0' ELSE
      Add_out1;

  delayMatch1_process : PROCESS (clk, rstx)
  BEGIN
    IF rstx = '1' THEN
      out_rsvd_1 <= to_unsigned(16#00#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        out_rsvd_1 <= out_rsvd;
      END IF;
    END IF;
  END PROCESS delayMatch1_process;


  
  out_rsvd_2 <= pixel_in_1 WHEN rst_x_2 = '0' ELSE
      out_rsvd_1;

  pixel_out <= std_logic_vector(out_rsvd_2);

  ce_out <= clk_enable;

END rtl;

