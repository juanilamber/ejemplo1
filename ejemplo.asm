start:
shift:
SET R7, 0xFF
PUSH |R7|, R3
SET R0, 0x01
SHR R3, 2
SET R1, 0x00
STR [R2], R3
SET R2, 0x40
POP |R7|, R3
SET R3, 0x10
SUB R3, R0
RET |R7|
loop:
CALL |R7|, shift
SUB R2, R0
CMP R1, R3
JZ end
JMP loop
end:
JMP end
