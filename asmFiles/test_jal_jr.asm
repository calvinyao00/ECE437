#---------------------------------------
# test jal and jr
#---------------------------------------

    org   0x0000
    ori $2, $0, 0x5
    ori $3, $0, 0x9
    ori $4, $0, 0x5

    jal test
check:
    ori $3, $0, 0x20
    halt

test:
    jr $31
    ori $4, $0, 0x50
    halt

