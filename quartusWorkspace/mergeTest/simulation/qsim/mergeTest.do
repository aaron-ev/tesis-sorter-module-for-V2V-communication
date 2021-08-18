onerror {quit -f}
vlib work
vlog -work work mergeTest.vo
vlog -work work mergeTest.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.regLoad_vlg_vec_tst
vcd file -direction mergeTest.msim.vcd
vcd add -internal regLoad_vlg_vec_tst/*
vcd add -internal regLoad_vlg_vec_tst/i1/*
add wave /*
run -all
