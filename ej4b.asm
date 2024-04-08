;Escribir otra funcion modArray que toma el mismo array del punto anterior y modifica 
;sus valores, dividiendo por 2 y restando 2 a los multiplos de 4 y multiplicando por 7 y sumando uno al resto.
;	modArray(*p,size)
;		for f=0; f<size; f++
;			if (p[f] es mult4) p[f]=p[f]/2 - 2
;			else p[f]=p[f]*7+1

main:
		SET R7, 0xFF	;stack
		SET R0, p		;p
		SET R1, 0x10	;size

		CALL |R7|, modarray

halt:
		JMP halt

modarray:

		PUSH |R7|, R0
		PUSH |R7|, R1
		PUSH |R7|, R2
		PUSH |R7|, R3
		PUSH |R7|, R4
		PUSH |R7|, R5
		PUSH |R7|, R6
		
		SET R5, 0x00	;para ver un elemento
		SET R6, 0x03	;para ver si es multiplo
		SET R2, 0x00	;para usarlo como comparador 
		SET R4, 0x01	
		SET R3, 0x00	;para usarlo como storage y guardar el valor original del arreglo
		JMP ciclo		

ciclo:
		CMP R1,R2		;si llegamos al final del arreglo, va a la etiqueta fin
		JZ fin
		LOAD R5, [R0]		;lee el valor del arreglo
		MOV R3, R5		;copio R5 en R3
		AND R5, R6		
		CMP R5, R2		;veo si es multimo de 4
		MOV R5, R3		;copio R3 en R5
		JZ esMultiplo		
		JMP elResto		

esMultiplo:
		
		SHRA R5, 1		;divido por 2
		SUB R5, R4		;resto 1
		SUB R5, R4		;resto 1
		STR [R0], R5		;modifico el valor en el arreglo
		SUB R1, R4		;le resto 1 a size
		ADD R0, R4		;incremento el puntero para avanzar al proximo elemento del array
		JMP ciclo
		
elResto:
		SHL R5, 2		;multiplico por 4
		ADD R5, R3		
		ADD R5, R3  		
		ADD R5, R3  		;sumo 3 veces R3 para llegar al valor multiplicado por 7
		ADD R5, R4      	;le sumo 1
		STR [R0], R5		;modifico el valor en el arreglo
		SUB R1, R4		;le resto 1 a size
		ADD R0, R4		;incremento el puntero para avanzar al proximo elemento del array
		JMP ciclo
		
fin:
		POP |R7|, R6
		POP |R7|, R5
		POP |R7|, R4
		POP |R7|, R3
		POP |R7|, R2
		POP |R7|, R1
		POP |R7|, R0
		RET|R7|	
	
p:
DB 0x01
DB 0x02
DB 0x04
DB 0x08
DB 0x03
DB 0x03
DB 0xA1
DB 0xC0
DB 0xFF
DB 0x40
DB 0x55
DB 0xCC
DB 0xBD
DB 0x45
DB 0x9A
DB 0xEE
