	TTL Expt6-3

	AREA Program, CODE, READONLY
	ENTRY

Main
	ADR R0, seq
	MOV R1, #0x7E000000
	MOV R2, #0x00FF0000
	MOV R9, #7
	
Loop
	LDR R3, [R0], #4
	MOV R5, #23
	AND R6, R1, R3
	CMP R6, R1
	ADDEQ R8, R8, #1
firstloop
	AND R6, R1, R3, LSL R5
	CMP R6, R1
	ADDEQ R8, R8, #1
	SUBS R5, R5, #1
	BNE firstloop
	
	MOV R3, R3, LSL #23
	LDR R7, [R0]
	MOV R7, R7, LSR #8
	AND R7, R7, R2
	
	MOV R5, #7
	AND R6, R1, R3
	CMP R6, R1
	ADDEQ R8, R8, #1

secondloop
	AND R6, R1, R3, LSL R5
	CMP R6, R1
	ADDEQ R8, R8, #1
	SUBS R5, R5, #1
	BNE secondloop
	
	SUBS R9, R9, #1
	BNE Loop

	LDR R3, [R0], #4
	MOV R5, #23
	AND R6, R1, R3
	CMP R6, R1
	ADDEQ R8, R8, #1

f1irstloop
	AND R6, R1, R3, LSL R5
	CMP R6, R1
	ADDEQ R8, R8, #1
	SUBS R5, R5, #1
	BNE f1irstloop
	SUBS R8, R8, #1
	SWI &11

	
	

seq DCW 0xf87E, 0x0003
	DCW 0x07E0, 0x0000
	DCW 0x0000, 0x0000
	DCW 0x03f0, 0x0000
	DCW 0xfc00, 0x7E00
	DCW 0x0000, 0x0000
	DCW 0x0000, 0x0000
	DCW 0x0000, 0x0000
	
	
	;DCW 0xE07E, 0x0007
	;DCW 0xE07E, 0x0007
	;DCW 0xE07E, 0x0007
	;DCW 0xE07E, 0x0007
	;DCW 0xE07E, 0x0007
	;DCW 0xE07E, 0x0007
	ALIGN
	
	END