#---------------------------------------
# test bne not taken
#---------------------------------------

    org   0x0000
    ori $2, $0, 0x5
    ori $3, $0, 0x9
    ori $4, $0, 0x5
    ori $5, $0, 0xFF00

    bne $2, $4, test
check:
    ori $3, $0, 0x20
    sw    $3,8($5)
    halt

test:
    ori $2, $0, 0x9
    sw    $2,8($5)
    bne $4, $2, check
    halt

