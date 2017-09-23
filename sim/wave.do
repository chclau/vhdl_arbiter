onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_arbiter/rst
add wave -noupdate /tb_arbiter/clk
add wave -noupdate -expand /tb_arbiter/req
add wave -noupdate -expand /tb_arbiter/gnt
add wave -noupdate /tb_arbiter/busy
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {905219 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 84
configure wave -valuecolwidth 38
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
WaveRestoreZoom {169446 ps} {824230 ps}
