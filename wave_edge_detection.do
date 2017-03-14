onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_edge_detection/test_case
add wave -noupdate /tb_edge_detection/tb_clk
add wave -noupdate /tb_edge_detection/tb_n_rst
add wave -noupdate -expand -group {Input Pixels} -radix unsigned /tb_edge_detection/tb_P0
add wave -noupdate -expand -group {Input Pixels} -radix unsigned /tb_edge_detection/tb_P1
add wave -noupdate -expand -group {Input Pixels} -radix unsigned /tb_edge_detection/tb_P2
add wave -noupdate -expand -group {Input Pixels} -radix unsigned /tb_edge_detection/tb_P3
add wave -noupdate -expand -group {Input Pixels} -radix unsigned /tb_edge_detection/tb_P4
add wave -noupdate -expand -group {Input Pixels} -radix unsigned /tb_edge_detection/tb_P5
add wave -noupdate -expand -group {Input Pixels} -radix unsigned /tb_edge_detection/tb_P6
add wave -noupdate -expand -group {Input Pixels} -radix unsigned /tb_edge_detection/tb_P7
add wave -noupdate -expand -group {Input Pixels} -radix unsigned /tb_edge_detection/tb_P8
add wave -noupdate -expand -group {Gx Calc} /tb_edge_detection/DUT/A1
add wave -noupdate -expand -group {Gx Calc} /tb_edge_detection/DUT/B1
add wave -noupdate -expand -group {Gx Calc} -radix decimal /tb_edge_detection/DUT/C1
add wave -noupdate -expand -group {Gx Calc} /tb_edge_detection/DUT/D1
add wave -noupdate -expand -group {Gx Calc} /tb_edge_detection/DUT/E1
add wave -noupdate -expand -group {Gx Calc} -radix decimal /tb_edge_detection/DUT/Gx
add wave -noupdate -expand -group {Gy Calc} /tb_edge_detection/DUT/A2
add wave -noupdate -expand -group {Gy Calc} /tb_edge_detection/DUT/B2
add wave -noupdate -expand -group {Gy Calc} /tb_edge_detection/DUT/C2
add wave -noupdate -expand -group {Gy Calc} /tb_edge_detection/DUT/D2
add wave -noupdate -expand -group {Gy Calc} /tb_edge_detection/DUT/E2
add wave -noupdate -expand -group {Gy Calc} /tb_edge_detection/DUT/n_Gy
add wave -noupdate -expand -group {Gy Calc} -radix decimal /tb_edge_detection/DUT/Gy
add wave -noupdate -radix decimal /tb_edge_detection/DUT/temp_sum
add wave -noupdate -expand -group {processed data} -radix unsigned /tb_edge_detection/tb_processed_sum
add wave -noupdate -expand -group {processed data} -radix unsigned /tb_edge_detection/expected_processed_sum
add wave -noupdate /tb_edge_detection/DUT/state
add wave -noupdate /tb_edge_detection/DUT/next_state
add wave -noupdate /tb_edge_detection/tb_gradient_start
add wave -noupdate /tb_edge_detection/tb_gradient_data_ready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {551244 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 228
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
WaveRestoreZoom {516528 ps} {569028 ps}
