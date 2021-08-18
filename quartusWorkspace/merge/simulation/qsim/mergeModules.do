onerror {quit -f}
vlib work
vlog -work work mergeModules.vo
vlog -work work mergeModules.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.merge8to16_vlg_vec_tst
vcd file -direction mergeModules.msim.vcd
vcd add -internal merge8to16_vlg_vec_tst/*
vcd add -internal merge8to16_vlg_vec_tst/i1/*
add wave /*
run -all
