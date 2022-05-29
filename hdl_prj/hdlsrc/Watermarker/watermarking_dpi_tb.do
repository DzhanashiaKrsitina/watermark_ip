vlib work
vcom watermarking_pac.vhd -work work
vcom Bit_Divider_Inner.vhd -work work
vcom Bit_Divider_Outer.vhd -work work
vcom Index_Definer.vhd -work work
vcom ROM_Template_0.vhd -work work
vcom ROM_Template_1.vhd -work work
vcom SimpleDualPortRAM_singlebit.vhd -work work
vcom Indexing.vhd -work work
vcom watermarking.vhd -work work
vlog -dpicopyopt 0 -sv gm_Watermarker_ref_dpi.sv
vlog -sv watermarking_dpi_tb.sv
vsim -voptargs=+acc -L work  -sv_lib gm_Watermarker_ref_win64 work.watermarking_dpi_tb
add wave /*
run -all
