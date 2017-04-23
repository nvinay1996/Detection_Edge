onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_AHB_wrapper/tb_clk
add wave -noupdate /tb_AHB_wrapper/tb_n_rst
add wave -noupdate /tb_AHB_wrapper/tb_done
add wave -noupdate -expand -group {AHB Slave} -radix hexadecimal /tb_AHB_wrapper/tb_s_haddr
add wave -noupdate -expand -group {AHB Slave} -radix hexadecimal /tb_AHB_wrapper/tb_s_hrdata
add wave -noupdate -expand -group {AHB Slave} -radix hexadecimal /tb_AHB_wrapper/tb_s_hwdata
add wave -noupdate -expand -group {AHB Slave} /tb_AHB_wrapper/tb_s_hwrite
add wave -noupdate -expand -group {AHB Slave} /tb_AHB_wrapper/tb_s_hready
add wave -noupdate -expand -group {AHB Master} -radix hexadecimal /tb_AHB_wrapper/tb_m_haddr
add wave -noupdate -expand -group {AHB Master} -radix hexadecimal /tb_AHB_wrapper/tb_m_hrdata
add wave -noupdate -expand -group {AHB Master} -radix hexadecimal /tb_AHB_wrapper/tb_m_hwdata
add wave -noupdate -expand -group {AHB Master} /tb_AHB_wrapper/tb_m_hwrite
add wave -noupdate -expand -group {AHB Master} /tb_AHB_wrapper/tb_m_hready
add wave -noupdate -expand -group {HRDATA -> gray scale input} /tb_AHB_wrapper/tb_re
add wave -noupdate -expand -group {HRDATA -> gray scale input} /tb_AHB_wrapper/tb_read_complete
add wave -noupdate -expand -group {HRDATA -> gray scale input} -radix hexadecimal /tb_AHB_wrapper/tb_m_hrdata
add wave -noupdate -expand -group {HRDATA -> gray scale input} -radix hexadecimal /tb_AHB_wrapper/tb_greyscale_data
add wave -noupdate -expand -group {Buffer2 Data -> HWDATA} /tb_AHB_wrapper/tb_we
add wave -noupdate -expand -group {Buffer2 Data -> HWDATA} /tb_AHB_wrapper/tb_write_complete
add wave -noupdate -expand -group {Buffer2 Data -> HWDATA} -radix hexadecimal /tb_AHB_wrapper/tb_buffer2_data
add wave -noupdate -expand -group {Buffer2 Data -> HWDATA} -radix hexadecimal /tb_AHB_wrapper/tb_m_hwdata
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {17681 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 262
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
WaveRestoreZoom {15880 ps} {74552 ps}
