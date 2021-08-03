onerror {quit -f}
vlib work
vlog -work work dotProduct.vo
vlog -work work dotProduct.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.dist2_vlg_vec_tst
vcd file -direction dotProduct.msim.vcd
vcd add -internal dist2_vlg_vec_tst/*
vcd add -internal dist2_vlg_vec_tst/i1/*
add wave /*
run -all
