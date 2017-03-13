onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_grayscale/test_case
add wave -noupdate /tb_grayscale/tb_clk
add wave -noupdate /tb_grayscale/tb_n_rst
add wave -noupdate /tb_grayscale/tb_i_grayscale_start
add wave -noupdate -radix hexadecimal /tb_grayscale/tb_i_RGB
add wave -noupdate -radix unsigned /tb_grayscale/tb_R
add wave -noupdate -radix unsigned /tb_grayscale/tb_G
add wave -noupdate -radix unsigned /tb_grayscale/tb_B
add wave -noupdate -radix unsigned /tb_grayscale/DUT/min
add wave -noupdate -radix unsigned /tb_grayscale/DUT/max
add wave -noupdate -radix unsigned /tb_grayscale/DUT/total
add wave -noupdate -radix unsigned /tb_grayscale/DUT/average
add wave -noupdate -radix unsigned /tb_grayscale/tb_o_gray
add wave -noupdate /tb_grayscale/tb_o_grayscale_data_ready
add wave -noupdate /tb_grayscale/DUT/curr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {96012 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 222
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {210 ns}
