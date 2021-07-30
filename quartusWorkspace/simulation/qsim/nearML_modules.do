onerror {quit -f}
vlib work
vlog -work work nearML_modules.vo
vlog -work work nearML_modules.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.complex2In4_vlg_vec_tst
vcd file -direction nearML_modules.msim.vcd
vcd add -internal complex2In4_vlg_vec_tst/*
vcd add -internal complex2In4_vlg_vec_tst/i1/*
add wave /*
run -all
