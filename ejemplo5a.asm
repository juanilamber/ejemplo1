start:
	SET R7, 0xFF	;stack
	SET R6, 0x03
	PUSH |R7|, R6
	
	DB 0x77
	DB 0x50
	
halt:
	JMP halt

