onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_buffer_2/test_case
add wave -noupdate /tb_buffer_2/tb_clk
add wave -noupdate /tb_buffer_2/tb_n_rst
add wave -noupdate -radix hexadecimal /tb_buffer_2/tb_processed_sum_1
add wave -noupdate -radix hexadecimal /tb_buffer_2/tb_processed_sum_2
add wave -noupdate -radix hexadecimal /tb_buffer_2/tb_processed_sum_3
add wave -noupdate -radix hexadecimal /tb_buffer_2/tb_processed_sum_4
add wave -noupdate -radix hexadecimal /tb_buffer_2/tb_processed_sum_5
add wave -noupdate -radix hexadecimal /tb_buffer_2/tb_processed_sum_6
add wave -noupdate -radix hexadecimal /tb_buffer_2/tb_processed_sum_7
add wave -noupdate -radix hexadecimal /tb_buffer_2/tb_processed_sum_8
add wave -noupdate -radix hexadecimal /tb_buffer_2/tb_processed_sum_9
add wave -noupdate /tb_buffer_2/tb_save
add wave -noupdate /tb_buffer_2/tb_write_complete
add wave -noupdate -radix hexadecimal /tb_buffer_2/tb_buffer2_data
add wave -noupdate /tb_buffer_2/DUT/curr
add wave -noupdate -radix hexadecimal /tb_buffer_2/tb_out_rgb
add wave -noupdate /tb_buffer_2/tb_write_enable
add wave -noupdate /tb_buffer_2/tb_empty
add wave -noupdate /tb_buffer_2/tb_full
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {308583 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 208
configure wave -valuecolwidth 86
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
WaveRestoreZoom {241206 ps} {343382 ps}
