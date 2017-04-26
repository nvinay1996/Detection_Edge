onerror {resume}
quietly virtual function -install /tb_Top_Level/DUT -env /tb_Top_Level { (context /tb_Top_Level/DUT )&{m1 ,m2 ,m3 ,m4 ,m5 ,m6 ,m7 ,m8 ,m9 ,m10 ,m11 ,m12 ,m13 ,m14 ,m15 ,m16 ,m17 ,m18 ,m19 ,m20 ,m21 ,m22 ,m23 ,m24 ,m25 }} Pixel_Input
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_Top_Level/tb_clk
add wave -noupdate /tb_Top_Level/tb_n_rst
add wave -noupdate -radix unsigned /tb_Top_Level/IMG_WIDTH
add wave -noupdate -radix unsigned /tb_Top_Level/IMG_HEIGHT
add wave -noupdate -expand -group {AHB Slave} -radix hexadecimal /tb_Top_Level/tb_s_hrdata
add wave -noupdate -expand -group {AHB Slave} /tb_Top_Level/tb_s_hready
add wave -noupdate -expand -group {AHB Slave} -radix decimal /tb_Top_Level/tb_s_haddr
add wave -noupdate -expand -group {AHB Slave} -radix hexadecimal /tb_Top_Level/tb_s_hwdata
add wave -noupdate -expand -group {AHB Slave} /tb_Top_Level/tb_s_hwrite
add wave -noupdate -expand -group {AHB Master} -radix hexadecimal /tb_Top_Level/tb_m_hrdata
add wave -noupdate -expand -group {AHB Master} /tb_Top_Level/tb_m_hready
add wave -noupdate -expand -group {AHB Master} -radix unsigned /tb_Top_Level/tb_m_haddr
add wave -noupdate -expand -group {AHB Master} -radix hexadecimal /tb_Top_Level/tb_m_hwdata
add wave -noupdate -expand -group {AHB Master} /tb_Top_Level/tb_m_hwrite
add wave -noupdate -expand -group {Read Transfer} /tb_Top_Level/tb_clk
add wave -noupdate -expand -group {Read Transfer} -radix unsigned /tb_Top_Level/tb_m_haddr
add wave -noupdate -expand -group {Read Transfer} /tb_Top_Level/tb_m_hwrite
add wave -noupdate -expand -group {Read Transfer} -radix hexadecimal /tb_Top_Level/tb_m_hrdata
add wave -noupdate -expand -group {Read Transfer} /tb_Top_Level/tb_m_hready
add wave -noupdate -expand -group {HRDATA -> rgb} /tb_Top_Level/DUT/re
add wave -noupdate -expand -group {HRDATA -> rgb} /tb_Top_Level/DUT/read_complete
add wave -noupdate -expand -group {HRDATA -> rgb} -radix hexadecimal /tb_Top_Level/tb_m_hrdata
add wave -noupdate -expand -group {HRDATA -> rgb} -radix hexadecimal /tb_Top_Level/DUT/rgb
add wave -noupdate -expand -group {Write Transfer} /tb_Top_Level/tb_clk
add wave -noupdate -expand -group {Write Transfer} -radix unsigned /tb_Top_Level/tb_m_haddr
add wave -noupdate -expand -group {Write Transfer} /tb_Top_Level/tb_m_hwrite
add wave -noupdate -expand -group {Write Transfer} -radix hexadecimal /tb_Top_Level/tb_m_hwdata
add wave -noupdate -expand -group {Write Transfer} /tb_Top_Level/tb_m_hready
add wave -noupdate -expand -group {buffer2_data -> HWDATA} /tb_Top_Level/DUT/we
add wave -noupdate -expand -group {buffer2_data -> HWDATA} /tb_Top_Level/DUT/write_complete
add wave -noupdate -expand -group {buffer2_data -> HWDATA} -radix hexadecimal /tb_Top_Level/DUT/buffer2_data
add wave -noupdate -expand -group {buffer2_data -> HWDATA} -radix hexadecimal /tb_Top_Level/tb_m_hwdata
add wave -noupdate -expand -group GrayScale /tb_Top_Level/DUT/grayscale_start
add wave -noupdate -expand -group GrayScale /tb_Top_Level/DUT/grayscale_data_ready
add wave -noupdate -expand -group GrayScale -radix hexadecimal /tb_Top_Level/DUT/rgb
add wave -noupdate -expand -group GrayScale -radix unsigned /tb_Top_Level/DUT/gray
add wave -noupdate -group {Buffer Window (Buffer 1)} /tb_Top_Level/DUT/b1_save
add wave -noupdate -group {Buffer Window (Buffer 1)} /tb_Top_Level/DUT/b1_clear
add wave -noupdate -group {Buffer Window (Buffer 1)} /tb_Top_Level/DUT/b1_full
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m1
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m2
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m3
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m4
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m5
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m6
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m7
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m8
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m9
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m10
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m11
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m12
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m13
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m14
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m15
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m16
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m17
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m18
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m19
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m20
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m21
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m22
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m23
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m24
add wave -noupdate -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m25
add wave -noupdate /tb_Top_Level/DUT/gradient_start
add wave -noupdate /tb_Top_Level/DUT/gradient_ready
add wave -noupdate -expand -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_1
add wave -noupdate -expand -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_2
add wave -noupdate -expand -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_3
add wave -noupdate -expand -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_4
add wave -noupdate -expand -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_5
add wave -noupdate -expand -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_6
add wave -noupdate -expand -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_7
add wave -noupdate -expand -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_8
add wave -noupdate -expand -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_9
add wave -noupdate -group {Output Buffer (Buffer 2)} /tb_Top_Level/DUT/b2_save
add wave -noupdate -group {Output Buffer (Buffer 2)} /tb_Top_Level/DUT/b2_empty
add wave -noupdate -group {Output Buffer (Buffer 2)} /tb_Top_Level/DUT/start_next_write
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -divider {Edge Detector}
add wave -noupdate /tb_Top_Level/tb_clk
add wave -noupdate /tb_Top_Level/tb_n_rst
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m1
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m2
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m3
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m4
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m5
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m6
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m7
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m8
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m9
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m10
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m11
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m12
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m13
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m14
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m15
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m16
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m17
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m18
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m19
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m20
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m21
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m22
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m23
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m24
add wave -noupdate -expand -group {Edge Detect Input} -radix unsigned /tb_Top_Level/DUT/m25
add wave -noupdate /tb_Top_Level/DUT/gradient_start
add wave -noupdate /tb_Top_Level/DUT/gradient_ready
add wave -noupdate -expand -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_1
add wave -noupdate -expand -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_2
add wave -noupdate -expand -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_3
add wave -noupdate -expand -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_4
add wave -noupdate -expand -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_5
add wave -noupdate -expand -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_6
add wave -noupdate -expand -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_7
add wave -noupdate -expand -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_8
add wave -noupdate -expand -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_9
add wave -noupdate -divider {First Window}
add wave -noupdate -expand -group {First Window Input} -radix unsigned /tb_Top_Level/DUT/m1
add wave -noupdate -expand -group {First Window Input} -radix unsigned /tb_Top_Level/DUT/m2
add wave -noupdate -expand -group {First Window Input} -radix unsigned /tb_Top_Level/DUT/m3
add wave -noupdate -expand -group {First Window Input} -radix unsigned /tb_Top_Level/DUT/m6
add wave -noupdate -expand -group {First Window Input} -radix unsigned /tb_Top_Level/DUT/m7
add wave -noupdate -expand -group {First Window Input} -radix unsigned /tb_Top_Level/DUT/m8
add wave -noupdate -expand -group {First Window Input} -radix unsigned /tb_Top_Level/DUT/m11
add wave -noupdate -expand -group {First Window Input} -radix unsigned /tb_Top_Level/DUT/m12
add wave -noupdate -expand -group {First Window Input} -radix unsigned /tb_Top_Level/DUT/m13
add wave -noupdate /tb_Top_Level/DUT/gradient_start
add wave -noupdate /tb_Top_Level/DUT/gradient_ready
add wave -noupdate -expand -group {First Window Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_1
add wave -noupdate -divider {Center Window}
add wave -noupdate -expand -group {5th Window Input} -radix unsigned /tb_Top_Level/DUT/m7
add wave -noupdate -expand -group {5th Window Input} -radix unsigned /tb_Top_Level/DUT/m8
add wave -noupdate -expand -group {5th Window Input} -radix unsigned /tb_Top_Level/DUT/m9
add wave -noupdate -expand -group {5th Window Input} -radix unsigned /tb_Top_Level/DUT/m12
add wave -noupdate -expand -group {5th Window Input} -radix unsigned /tb_Top_Level/DUT/m13
add wave -noupdate -expand -group {5th Window Input} -radix unsigned /tb_Top_Level/DUT/m14
add wave -noupdate -expand -group {5th Window Input} -radix unsigned /tb_Top_Level/DUT/m17
add wave -noupdate -expand -group {5th Window Input} -radix unsigned /tb_Top_Level/DUT/m18
add wave -noupdate -expand -group {5th Window Input} -radix unsigned /tb_Top_Level/DUT/m19
add wave -noupdate /tb_Top_Level/DUT/gradient_start
add wave -noupdate /tb_Top_Level/DUT/gradient_ready
add wave -noupdate -expand -group {5th Window Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_5
add wave -noupdate -divider {Last Window}
add wave -noupdate -expand -group {Last Window Input} -radix unsigned /tb_Top_Level/DUT/m13
add wave -noupdate -expand -group {Last Window Input} -radix unsigned /tb_Top_Level/DUT/m14
add wave -noupdate -expand -group {Last Window Input} -radix unsigned /tb_Top_Level/DUT/m15
add wave -noupdate -expand -group {Last Window Input} -radix unsigned /tb_Top_Level/DUT/m18
add wave -noupdate -expand -group {Last Window Input} -radix unsigned /tb_Top_Level/DUT/m19
add wave -noupdate -expand -group {Last Window Input} -radix unsigned /tb_Top_Level/DUT/m20
add wave -noupdate -expand -group {Last Window Input} -radix unsigned /tb_Top_Level/DUT/m23
add wave -noupdate -expand -group {Last Window Input} -radix unsigned /tb_Top_Level/DUT/m24
add wave -noupdate -expand -group {Last Window Input} -radix unsigned /tb_Top_Level/DUT/m25
add wave -noupdate /tb_Top_Level/DUT/gradient_start
add wave -noupdate /tb_Top_Level/DUT/gradient_ready
add wave -noupdate -expand -group {Last Window Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_9
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {Example {240090050 ps} 1}
quietly wave cursor active 1
configure wave -namecolwidth 302
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
WaveRestoreZoom {239916920 ps} {240899784 ps}
