ldi R16, 0xd2
sts 0x60, R16
ldi R18, 0x00
ldi R17, 0x01
and R17,R16
BREQ eve
ldi R18, 0x01
eve: sts 0x61, R18
nop
