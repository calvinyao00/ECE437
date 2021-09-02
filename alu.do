onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /alu_tb/nRST
add wave -noupdate /alu_tb/v1
add wave -noupdate /alu_tb/v2
add wave -noupdate /alu_tb/v3
add wave -noupdate /alu_tb/PROG/test_case_num
add wave -noupdate /alu_tb/PROG/test_case
add wave -noupdate /alu_tb/alu_if/flagZero
add wave -noupdate /alu_tb/alu_if/flagNeg
add wave -noupdate /alu_tb/alu_if/flagOvf
add wave -noupdate /alu_tb/alu_if/op
add wave -noupdate -radix decimal /alu_tb/alu_if/portA
add wave -noupdate -radix decimal /alu_tb/alu_if/portB
add wave -noupdate -radix decimal /alu_tb/alu_if/portOut
add wave -noupdate -radix decimal -childformat {{{/alu_tb/DUT/temp[35]} -radix decimal} {{/alu_tb/DUT/temp[34]} -radix decimal} {{/alu_tb/DUT/temp[33]} -radix decimal} {{/alu_tb/DUT/temp[32]} -radix decimal} {{/alu_tb/DUT/temp[31]} -radix decimal} {{/alu_tb/DUT/temp[30]} -radix decimal} {{/alu_tb/DUT/temp[29]} -radix decimal} {{/alu_tb/DUT/temp[28]} -radix decimal} {{/alu_tb/DUT/temp[27]} -radix decimal} {{/alu_tb/DUT/temp[26]} -radix decimal} {{/alu_tb/DUT/temp[25]} -radix decimal} {{/alu_tb/DUT/temp[24]} -radix decimal} {{/alu_tb/DUT/temp[23]} -radix decimal} {{/alu_tb/DUT/temp[22]} -radix decimal} {{/alu_tb/DUT/temp[21]} -radix decimal} {{/alu_tb/DUT/temp[20]} -radix decimal} {{/alu_tb/DUT/temp[19]} -radix decimal} {{/alu_tb/DUT/temp[18]} -radix decimal} {{/alu_tb/DUT/temp[17]} -radix decimal} {{/alu_tb/DUT/temp[16]} -radix decimal} {{/alu_tb/DUT/temp[15]} -radix decimal} {{/alu_tb/DUT/temp[14]} -radix decimal} {{/alu_tb/DUT/temp[13]} -radix decimal} {{/alu_tb/DUT/temp[12]} -radix decimal} {{/alu_tb/DUT/temp[11]} -radix decimal} {{/alu_tb/DUT/temp[10]} -radix decimal} {{/alu_tb/DUT/temp[9]} -radix decimal} {{/alu_tb/DUT/temp[8]} -radix decimal} {{/alu_tb/DUT/temp[7]} -radix decimal} {{/alu_tb/DUT/temp[6]} -radix decimal} {{/alu_tb/DUT/temp[5]} -radix decimal} {{/alu_tb/DUT/temp[4]} -radix decimal} {{/alu_tb/DUT/temp[3]} -radix decimal} {{/alu_tb/DUT/temp[2]} -radix decimal} {{/alu_tb/DUT/temp[1]} -radix decimal} {{/alu_tb/DUT/temp[0]} -radix decimal}} -subitemconfig {{/alu_tb/DUT/temp[35]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[34]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[33]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[32]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[31]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[30]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[29]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[28]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[27]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[26]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[25]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[24]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[23]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[22]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[21]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[20]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[19]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[18]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[17]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[16]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[15]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[14]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[13]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[12]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[11]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[10]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[9]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[8]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[7]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[6]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[5]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[4]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[3]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[2]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[1]} {-height 16 -radix decimal} {/alu_tb/DUT/temp[0]} {-height 16 -radix decimal}} /alu_tb/DUT/temp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {28 ns} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {168 ns}
