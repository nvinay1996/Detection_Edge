onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_AHB/k
add wave -noupdate /tb_AHB/tb_clk
add wave -noupdate /tb_AHB/tb_n_rst
add wave -noupdate -radix hexadecimal /tb_AHB/tb_haddr
add wave -noupdate -radix hexadecimal /tb_AHB/tb_mcu_raddr
add wave -noupdate -expand -group {hrdata -> greyscale_data} /tb_AHB/tb_re
add wave -noupdate -expand -group {hrdata -> greyscale_data} -radix hexadecimal /tb_AHB/tb_hrdata
add wave -noupdate -expand -group {hrdata -> greyscale_data} -radix hexadecimal /tb_AHB/tb_greyscale_data
add wave -noupdate -expand -group {hrdata -> greyscale_data} /tb_AHB/tb_read_complete
add wave -noupdate -radix hexadecimal /tb_AHB/tb_mcu_waddr
add wave -noupdate -expand -group {buffer2_data -> hwdata -> (sram)} /tb_AHB/tb_we
add wave -noupdate -expand -group {buffer2_data -> hwdata -> (sram)} -radix hexadecimal /tb_AHB/tb_buffer2_data
add wave -noupdate -expand -group {buffer2_data -> hwdata -> (sram)} -radix hexadecimal /tb_AHB/tb_hwdata
add wave -noupdate -expand -group {buffer2_data -> hwdata -> (sram)} /tb_AHB/tb_write_complete
add wave -noupdate /tb_AHB/tb_hready
add wave -noupdate /tb_AHB/tb_hwrite
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {12875 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 238
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {39109 ps}
