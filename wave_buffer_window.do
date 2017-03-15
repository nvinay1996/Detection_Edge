onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_buffer_window/test_case
add wave -noupdate /tb_buffer_window/tb_clk
add wave -noupdate /tb_buffer_window/tb_n_rst
add wave -noupdate /tb_buffer_window/tb_clear
add wave -noupdate /tb_buffer_window/tb_save
add wave -noupdate -radix unsigned /tb_buffer_window/tb_data_in
add wave -noupdate /tb_buffer_window/tb_full
add wave -noupdate /tb_buffer_window/tb_empty
add wave -noupdate /tb_buffer_window/DUT/curr
add wave -noupdate -expand -group m1 -radix unsigned /tb_buffer_window/tb_m1
add wave -noupdate -expand -group m1 -radix unsigned /tb_buffer_window/expected_m1
add wave -noupdate -expand -group m2 -radix unsigned /tb_buffer_window/tb_m2
add wave -noupdate -expand -group m2 -radix unsigned /tb_buffer_window/expected_m2
add wave -noupdate -expand -group m3 -radix unsigned /tb_buffer_window/tb_m3
add wave -noupdate -expand -group m3 -radix unsigned /tb_buffer_window/expected_m3
add wave -noupdate -expand -group m4 -radix unsigned /tb_buffer_window/tb_m4
add wave -noupdate -expand -group m4 -radix unsigned /tb_buffer_window/expected_m4
add wave -noupdate -expand -group m5 -radix unsigned /tb_buffer_window/tb_m5
add wave -noupdate -expand -group m5 -radix unsigned /tb_buffer_window/expected_m5
add wave -noupdate -expand -group m6 -radix unsigned /tb_buffer_window/tb_m6
add wave -noupdate -expand -group m6 -radix unsigned /tb_buffer_window/expected_m6
add wave -noupdate -expand -group m7 -radix unsigned /tb_buffer_window/tb_m7
add wave -noupdate -expand -group m7 -radix unsigned /tb_buffer_window/expected_m7
add wave -noupdate -expand -group m8 -radix unsigned /tb_buffer_window/tb_m8
add wave -noupdate -expand -group m8 -radix unsigned /tb_buffer_window/expected_m8
add wave -noupdate -expand -group m9 -radix unsigned /tb_buffer_window/tb_m9
add wave -noupdate -expand -group m9 -radix unsigned /tb_buffer_window/expected_m9
add wave -noupdate -expand -group m10 -radix unsigned /tb_buffer_window/tb_m10
add wave -noupdate -expand -group m10 -radix unsigned /tb_buffer_window/expected_m10
add wave -noupdate -expand -group m11 -radix unsigned /tb_buffer_window/tb_m11
add wave -noupdate -expand -group m11 -radix unsigned /tb_buffer_window/expected_m11
add wave -noupdate -expand -group m12 -radix unsigned /tb_buffer_window/tb_m12
add wave -noupdate -expand -group m12 -radix unsigned /tb_buffer_window/expected_m12
add wave -noupdate -expand -group m13 -radix unsigned /tb_buffer_window/tb_m13
add wave -noupdate -expand -group m13 -radix unsigned /tb_buffer_window/expected_m13
add wave -noupdate -expand -group m14 -radix unsigned /tb_buffer_window/tb_m14
add wave -noupdate -expand -group m14 -radix unsigned /tb_buffer_window/expected_m14
add wave -noupdate -expand -group m15 -radix unsigned /tb_buffer_window/tb_m15
add wave -noupdate -expand -group m15 -radix unsigned /tb_buffer_window/expected_m15
add wave -noupdate -expand -group m16 -radix unsigned /tb_buffer_window/tb_m16
add wave -noupdate -expand -group m16 -radix unsigned /tb_buffer_window/expected_m16
add wave -noupdate -expand -group m17 -radix unsigned /tb_buffer_window/tb_m17
add wave -noupdate -expand -group m17 -radix unsigned /tb_buffer_window/expected_m17
add wave -noupdate -expand -group m18 -radix unsigned /tb_buffer_window/tb_m18
add wave -noupdate -expand -group m18 -radix unsigned /tb_buffer_window/expected_m18
add wave -noupdate -expand -group m19 -radix unsigned /tb_buffer_window/tb_m19
add wave -noupdate -expand -group m19 -radix unsigned /tb_buffer_window/expected_m19
add wave -noupdate -expand -group m20 -radix unsigned /tb_buffer_window/tb_m20
add wave -noupdate -expand -group m20 -radix unsigned /tb_buffer_window/expected_m20
add wave -noupdate -expand -group m21 -radix unsigned /tb_buffer_window/tb_m21
add wave -noupdate -expand -group m21 -radix unsigned /tb_buffer_window/expected_m21
add wave -noupdate -expand -group m22 -radix unsigned /tb_buffer_window/tb_m22
add wave -noupdate -expand -group m22 -radix unsigned /tb_buffer_window/expected_m22
add wave -noupdate -expand -group m23 -radix unsigned /tb_buffer_window/tb_m23
add wave -noupdate -expand -group m23 -radix unsigned /tb_buffer_window/expected_m23
add wave -noupdate -expand -group m24 -radix unsigned /tb_buffer_window/tb_m24
add wave -noupdate -expand -group m24 -radix unsigned /tb_buffer_window/expected_m24
add wave -noupdate -expand -group m25 -radix unsigned /tb_buffer_window/tb_m25
add wave -noupdate -expand -group m25 -radix unsigned /tb_buffer_window/expected_m25
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {286517 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {420 ns}
