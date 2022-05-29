%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Auto generated cosimulation 'tclstart' script 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Source Model         : Watermarker
%  Generated Model      : gm_Watermarker
%  Cosimulation Model   : gm_Watermarker_mq
%
%  Source DUT           : gm_Watermarker_mq/watermarking
%  Cosimulation DUT     : gm_Watermarker_mq/watermarking_mq
%
%  File Location        : hdl_prj\hdlsrc\Watermarker\gm_Watermarker_mq_tcl.m
%  Created              : 2022-05-12 16:52:11
%
%  Generated by MATLAB 9.12 and HDL Coder 3.20
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  ClockName           : clk
%  ResetName           : rstx
%  ClockEnableName     : clk_enable
%
%  ClockLowTime        : 5ns
%  ClockHighTime       : 5ns
%  ClockPeriod         : 10ns
%
%  ResetLength         : 20ns
%  ClockEnableDelay    : 10ns
%  HoldTime            : 2ns
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  ModelBaseSampleTime   : 1
%  DutBaseSampleTime     : 1
%  OverClockFactor     : 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Mapping of DutBaseSampleTime to ClockPeriod
%
%  N = (ClockPeriod / DutBaseSampleTime) * OverClockFactor
%  1 sec in Simulink corresponds to 10ns in the HDL Simulator(N = 10)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  ResetHighAt          : (ClockLowTime + ResetLength + HoldTime)
%  ResetRiseEdge        : 27ns
%  ResetType            : async
%  ResetAssertedLevel   : 1
%
%  ClockEnableHighAt    : (ClockLowTime + ResetLength + ClockEnableDelay + HoldTime)
%  ClockEnableRiseEdge  : 37ns
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function tclCmds = gm_Watermarker_mq_tcl
tclCmds = {
    'vlib work',...% Compile the generated code
    'vcom Bit_Divider_Inner.vhd',...
    'vcom Bit_Divider_Outer.vhd',...
    'vcom Index_Definer.vhd',...
    'vcom ROM_Template_0.vhd',...
    'vcom ROM_Template_1.vhd',...
    'vcom SimpleDualPortRAM_singlebit.vhd',...
    'vcom Indexing.vhd',...
    'vcom watermarking.vhd',...
    'vsimulink -coverage -voptargs=+acc  work.watermarking',...% Initiate cosimulation
    'add wave  /watermarking/clk',...% Add wave commands for chip input signals
    'add wave  /watermarking/rstx',...
    'add wave  /watermarking/clk_enable',...
    'add wave  /watermarking/pixel_in',...
    'add wave  /watermarking/mes_in',...
    'add wave  /watermarking/ce_out',...% Add wave commands for chip output signals
    'add wave  /watermarking/pixel_out',...
    'set UserTimeUnit ns',...% Set simulation time unit
    'puts ""',...
    'puts "Ready for cosimulation..."',...
};
end