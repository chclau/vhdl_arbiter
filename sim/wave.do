onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_arbiter/arb_inst/rst
add wave -noupdate /tb_arbiter/arb_inst/clk
add wave -noupdate -expand /tb_arbiter/arb_inst/gnt
add wave -noupdate -expand /tb_arbiter/arb_inst/req
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {157314 ps} 0}
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
configure wave -timelineunits us
update
WaveRestoreZoom {172787 ps} {910792 ps}
