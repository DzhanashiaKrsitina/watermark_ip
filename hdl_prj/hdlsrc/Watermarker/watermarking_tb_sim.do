onbreak resume
onerror resume
vsim -voptargs=+acc work.watermarking_tb

add wave sim:/watermarking_tb/u_watermarking/clk
add wave sim:/watermarking_tb/u_watermarking/rstx
add wave sim:/watermarking_tb/u_watermarking/clk_enable
add wave sim:/watermarking_tb/u_watermarking/pixel_in
add wave sim:/watermarking_tb/u_watermarking/mes_in
add wave sim:/watermarking_tb/u_watermarking/ce_out
add wave sim:/watermarking_tb/u_watermarking/pixel_out
add wave sim:/watermarking_tb/pixel_out_ref
run -all
