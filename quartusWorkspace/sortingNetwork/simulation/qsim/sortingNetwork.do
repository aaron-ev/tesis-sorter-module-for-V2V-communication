onerror {quit -f}
vlib work
vlog -work work sortingNetwork.vo
vlog -work work sortingNetwork.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.sortingNetwork4_vlg_vec_tst
vcd file -direction sortingNetwork.msim.vcd
vcd add -internal sortingNetwork4_vlg_vec_tst/*
vcd add -internal sortingNetwork4_vlg_vec_tst/i1/*
add wave /*
run -all
