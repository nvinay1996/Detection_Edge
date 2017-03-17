onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_mcu/test_case
add wave -noupdate /tb_mcu/tb_clk
add wave -noupdate /tb_mcu/tb_n_rst
add wave -noupdate /tb_mcu/tb_i_stop
add wave -noupdate /tb_mcu/tb_i_read_complete
add wave -noupdate /tb_mcu/tb_i_grayscale_data_ready
add wave -noupdate /tb_mcu/tb_i_b1_full
add wave -noupdate /tb_mcu/tb_i_gradient_data_ready
add wave -noupdate /tb_mcu/tb_i_start_next_write
add wave -noupdate /tb_mcu/tb_i_write_complete
add wave -noupdate /tb_mcu/tb_i_b2_empty
add wave -noupdate /tb_mcu/tb_o_grayscale_start
add wave -noupdate /tb_mcu/tb_o_b1_save
add wave -noupdate /tb_mcu/tb_o_gradient_start
add wave -noupdate /tb_mcu/tb_o_b2_save
add wave -noupdate /tb_mcu/tb_o_complete
add wave -noupdate /tb_mcu/b1
add wave -noupdate /tb_mcu/b2
add wave -noupdate -expand -group {Read Addr Check} -radix unsigned /tb_mcu/tb_o_mcu_raddr
add wave -noupdate -expand -group {Read Addr Check} /tb_mcu/tb_o_re
add wave -noupdate -expand -group {Write Addr Check} -radix unsigned /tb_mcu/tb_o_mcu_waddr
add wave -noupdate -expand -group {Write Addr Check} /tb_mcu/tb_o_we
add wave -noupdate -radix unsigned /tb_mcu/DUT/rct1
add wave -noupdate -radix unsigned /tb_mcu/DUT/rct2
add wave -noupdate -radix unsigned /tb_mcu/DUT/rct3
add wave -noupdate -radix unsigned /tb_mcu/DUT/wct1
add wave -noupdate -radix unsigned /tb_mcu/DUT/wct2
add wave -noupdate -radix unsigned /tb_mcu/DUT/wct3
add wave -noupdate -radix unsigned /tb_mcu/DUT/wct4
add wave -noupdate /tb_mcu/DUT/curr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1176339 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 219
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
WaveRestoreZoom {964676 ps} {1161552 ps}
