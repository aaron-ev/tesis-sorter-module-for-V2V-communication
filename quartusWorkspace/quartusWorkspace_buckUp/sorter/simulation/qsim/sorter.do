onerror {quit -f}
vlib work
vlog -work work sorter.vo
vlog -work work sorter.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.bufferTri_vlg_vec_tst
vcd file -direction sorter.msim.vcd
vcd add -internal bufferTri_vlg_vec_tst/*
vcd add -internal bufferTri_vlg_vec_tst/i1/*
add wave /*
run -all
