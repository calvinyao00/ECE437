#---------------------------------------
# test bne taken
#---------------------------------------

    org   0x0000
    ori $2, $0, 0x5
    ori $3, $0, 0x9
    ori $4, $0, 0x5

    bne $2, $3, test
check:
    ori $3, $0, 0x20
    halt

test:
    ori $2, $0, 0x9
    bne $4, $2, check
    halt

