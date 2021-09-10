#---------------------------------------
# test jal and jr
#---------------------------------------

    org   0x0000
    ori $2, $0, 0x5
    ori $3, $0, 0x9
    ori $4, $0, 0x5
    ori $5, $0, 0xFF00

    jal test
check:
    ori $3, $0, 0x20
    sw    $3,12($5)
    halt

test:
    sw    $2,8($5)
    jr $31
    ori $4, $0, 0x50
    sw    $3,8($5)
    halt

