onerror {resume}
quietly virtual signal -install /tb_Top_Level/DUT { (context /tb_Top_Level/DUT )&{m1 ,m2 ,m3 ,m4 ,m5 ,m6 ,m7 ,m8 ,m9 ,m10 ,m11 ,m12 ,m13 ,m14 ,m15 ,m16 ,m17 ,m18 ,m19 ,m20 ,m21 ,m22 ,m23 ,m24 ,m25 }} Pixel_Input
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
add wave -noupdate -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_1
add wave -noupdate -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_2
add wave -noupdate -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_3
add wave -noupdate -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_4
add wave -noupdate -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_5
add wave -noupdate -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_6
add wave -noupdate -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_7
add wave -noupdate -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_8
add wave -noupdate -group {Edge Detect Output} -radix unsigned /tb_Top_Level/DUT/processed_sum_9
add wave -noupdate -group {Output Buffer (Buffer 2)} /tb_Top_Level/DUT/b2_save
add wave -noupdate -group {Output Buffer (Buffer 2)} /tb_Top_Level/DUT/b2_empty
add wave -noupdate -group {Output Buffer (Buffer 2)} /tb_Top_Level/DUT/start_next_write
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -divider {Gray Scaler}
add wave -noupdate /tb_Top_Level/tb_clk
add wave -noupdate /tb_Top_Level/tb_n_rst
add wave -noupdate -expand -group GrayScale /tb_Top_Level/DUT/grayscale_start
add wave -noupdate -expand -group GrayScale /tb_Top_Level/DUT/grayscale_data_ready
add wave -noupdate -expand -group GrayScale -radix hexadecimal -childformat {{{/tb_Top_Level/DUT/rgb[31]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[30]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[29]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[28]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[27]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[26]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[25]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[24]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[23]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[22]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[21]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[20]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[19]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[18]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[17]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[16]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[15]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[14]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[13]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[12]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[11]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[10]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[9]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[8]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[7]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[6]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[5]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[4]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[3]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[2]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[1]} -radix hexadecimal} {{/tb_Top_Level/DUT/rgb[0]} -radix hexadecimal}} -subitemconfig {{/tb_Top_Level/DUT/rgb[31]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[30]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[29]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[28]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[27]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[26]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[25]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[24]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[23]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[22]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[21]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[20]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[19]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[18]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[17]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[16]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[15]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[14]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[13]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[12]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[11]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[10]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[9]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[8]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[7]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[6]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[5]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[4]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[3]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[2]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[1]} {-height 17 -radix hexadecimal} {/tb_Top_Level/DUT/rgb[0]} {-height 17 -radix hexadecimal}} /tb_Top_Level/DUT/rgb
add wave -noupdate -expand -group GrayScale -radix hexadecimal /tb_Top_Level/DUT/gray
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{(3A + 93) / 2 = 66} {150283 ps} 1} {{(6A + A1) / 2 = 85} {415716810 ps} 1} {{Cursor 5} {4999236776 ps} 0}
quietly wave cursor active 2
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
WaveRestoreZoom {415521978 ps} {416313112 ps}
