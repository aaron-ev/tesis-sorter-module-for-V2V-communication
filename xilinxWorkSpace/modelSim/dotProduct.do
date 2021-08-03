onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider TOP_module
add wave -noupdate /dotProduct_tb/clk
add wave -noupdate /dotProduct_tb/rst
add wave -noupdate /dotProduct_tb/start
add wave -noupdate /dotProduct_tb/inaReal
add wave -noupdate /dotProduct_tb/inaImag
add wave -noupdate /dotProduct_tb/outaReal
add wave -noupdate /dotProduct_tb/outaImag
add wave -noupdate /dotProduct_tb/done
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -divider RAM
add wave -noupdate /dotProduct_tb/UUT/ramcomplexNum_0/clk
add wave -noupdate /dotProduct_tb/UUT/ramcomplexNum_0/din_aReal
add wave -noupdate /dotProduct_tb/UUT/ramcomplexNum_0/din_aImag
add wave -noupdate /dotProduct_tb/UUT/ramcomplexNum_0/we_aReal
add wave -noupdate /dotProduct_tb/UUT/ramcomplexNum_0/we_aImag
add wave -noupdate /dotProduct_tb/UUT/ramcomplexNum_0/w_addr_aReal
add wave -noupdate /dotProduct_tb/UUT/ramcomplexNum_0/w_addr_aImag
add wave -noupdate /dotProduct_tb/UUT/ramcomplexNum_0/r_addr_aReal
add wave -noupdate /dotProduct_tb/UUT/ramcomplexNum_0/r_addr_aImag
add wave -noupdate /dotProduct_tb/UUT/ramcomplexNum_0/dout_aReal
add wave -noupdate /dotProduct_tb/UUT/ramcomplexNum_0/dout_aImag
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -divider complex_multiplier
add wave -noupdate /dotProduct_tb/UUT/complex2In4_0/clk
add wave -noupdate /dotProduct_tb/UUT/complex2In4_0/rst
add wave -noupdate /dotProduct_tb/UUT/complex2In4_0/inaReal
add wave -noupdate /dotProduct_tb/UUT/complex2In4_0/inaImag
add wave -noupdate /dotProduct_tb/UUT/complex2In4_0/outaReal
add wave -noupdate /dotProduct_tb/UUT/complex2In4_0/outaImag
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate /dotProduct_tb/UUT/ctrlUnitDotProduct_0/clk
add wave -noupdate /dotProduct_tb/UUT/ctrlUnitDotProduct_0/rst
add wave -noupdate /dotProduct_tb/UUT/ctrlUnitDotProduct_0/start
add wave -noupdate /dotProduct_tb/UUT/ctrlUnitDotProduct_0/we
add wave -noupdate /dotProduct_tb/UUT/ctrlUnitDotProduct_0/addrReal
add wave -noupdate /dotProduct_tb/UUT/ctrlUnitDotProduct_0/addrImag
add wave -noupdate /dotProduct_tb/UUT/ctrlUnitDotProduct_0/done
add wave -noupdate /dotProduct_tb/UUT/ctrlUnitDotProduct_0/state
add wave -noupdate /dotProduct_tb/UUT/ctrlUnitDotProduct_0/nextState
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {34889 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 508
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {157500 ps}
