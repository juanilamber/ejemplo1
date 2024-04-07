start:
SET R7, 0xFF
SET R0, 0x01
SET R1, 0x00
SET R2, 0x10
SET R3, 0x30
loop:
CALL |R7|, shift
SUB R2, R0
CMP R1, R2
JZ end
JMP loop
end:
JMP end
shift:
PUSH |R7|, R2
SHL R2, 1
STR [R3], R2
ADD R3, R0
POP |R7|, R
