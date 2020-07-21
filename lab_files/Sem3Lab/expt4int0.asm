;
; int1.asm
;
; Created: 03-09-2019 00:34:52
; Author : Anand
;


; Replace with your application code
#include "m8def.inc"
.org 0
rjmp reset

.org 0x0001
rjmp int0_ISR

.org 0x0100

reset:
      LDI R16,0x70
	  OUT SPL,R16
	  LDI R16,0x00
	  OUT SPH,R16

	  LDI R16,0x01
	  OUT DDRB,R16

	  LDI R16,0x00
	  OUT DDRD,R16

	  IN R16,MCUCR;Load MCUCR register 
	  ORI R16,0x02
	  ;ANDI R16,0xfe
	  OUT MCUCR,R16

	  IN R16,GICR; Load GICR register 
	  ORI R16,0x40
	  OUT GICR,R16

	  LDI R16,0x00
	  OUT PORTB,R16

	  SEI
ind_loop:rjmp ind_loop

int0_ISR:IN R16,SREG
		 PUSH R16;....R16

		 LDI R16,10;R16,....
		 MOV R0,R16

	c1:	 LDI R16,0x01;..
		 OUT PORTB,R16

		 LDI R16,0xFF
	a1:	 LDI R17,0xFF
	a2:	 DEC R17
		 BRNE a2  ;...
		 DEC R16
		 BRNE a1;...
		 
		 LDI R16,0x00
		 OUT PORTB,R16

		 LDI R16,0xFF
	b1:	 LDI R17,0xFF
	b2:	 DEC R17
		 BRNE b2;...
		 DEC R16
		 BRNE b1;....

		 DEC R0
		 BRNE c1;...
		 POP R16;....R16
		 OUT SREG,R16
		 
		 rjmp reset

	  