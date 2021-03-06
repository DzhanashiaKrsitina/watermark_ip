-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\Watermarker\watermark_ip_dut.vhd
-- Created: 2022-05-12 17:02:14
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: watermark_ip_dut
-- Source Path: watermark_ip/watermark_ip_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY watermark_ip_dut IS
  PORT( clk                               :   IN    std_logic;
        rstx                              :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        pixel_in                          :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        mes_in                            :   IN    std_logic;  -- ufix1
        ce_out                            :   OUT   std_logic;  -- ufix1
        pixel_out                         :   OUT   std_logic_vector(7 DOWNTO 0)  -- ufix8
        );
END watermark_ip_dut;


ARCHITECTURE rtl OF watermark_ip_dut IS

  -- Component Declarations
  COMPONENT watermark_ip_src_waterma
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          rstx                            :   IN    std_logic;
          pixel_in                        :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          mes_in                          :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          pixel_out                       :   OUT   std_logic_vector(7 DOWNTO 0)  -- ufix8
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : watermark_ip_src_waterma
    USE ENTITY work.watermark_ip_src_waterma(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL mes_in_sig                       : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL pixel_out_sig                    : std_logic_vector(7 DOWNTO 0);  -- ufix8

BEGIN
  Uwatermark_ip_src_waterma : watermark_ip_src_waterma
    PORT MAP( clk => clk,
              clk_enable => enb,
              rstx => rstx,
              pixel_in => pixel_in,  -- ufix8
              mes_in => mes_in_sig,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              pixel_out => pixel_out_sig  -- ufix8
              );

  mes_in_sig <= mes_in;

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  pixel_out <= pixel_out_sig;

END rtl;

