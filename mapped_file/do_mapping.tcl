# Step 1:  Read in the source file
analyze -format sverilog -lib WORK {address_counter.sv edge_detection.sv grayscale.sv AHB.sv AHB_slave.sv AHB_wrapper.sv edge_detection_core.sv mcu.sv buffer_window.sv buffer_2.sv   Top_Level.sv}
elaborate Top_Level -lib WORK
uniquify
# Step 2: Set design constraints
# Uncomment below to set timing, area, power, etc. constraints
# set_max_delay <delay> -from "<input>" -to "<output>"
# set_max_area <area>
# set_max_total_power <power> mW
 create_clock "clk " -name "clk " -period 4

# Step 3: Compile the design
compile -map_effort medium

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1000 -nworst 1000 > reports/Top_Level.rep
report_area >> reports/Top_Level.rep
report_power -hier >> reports/Top_Level.rep

sizeof_collection [all_registers] >> reports/regs.rep

# Step 5: Output final VHDL and Verilog files
write_file -format verilog -hierarchy -output "mapped/Top_Level.v"
echo "\nScript Done\n"
echo "\nChecking Design\n"
check_design
quit
