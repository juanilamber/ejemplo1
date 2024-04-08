;Escribir la funcion cantImpares que toma un array de enteros positivos en memoria y cuenta cuantos elementos impares tiene.
;	cantImpares(*p,size)
;		for f=0; f<size; f++
;			if (p[f] es impar) count++
;		return count

main:
	SET R7, 0xFF	;stack
	SET R0, p	;p (arreglo)
	SET R1, 0x10	;size
	SET R4, 0x00	;count

	CALL |R7|, cantimpares

halt: 
	JMP halt

cantimpares:
	PUSH |R7|, R0
	PUSH |R7|, R1
	PUSH |R7|, R2
	PUSH |R7|, R3
	PUSH |R7|, R5
	PUSH |R7|, R6
	
	SET R3, 0x01    ;para AND
	SET R2, 0x01    ;iterador
	SET R5, 0x00    ;leer y guardar el valor del reg
	SET R6, 0x00    ;para fijarse si la long llego a 0
		
ciclo:
	LOAD R5, [R0] ; leo lo que esta en el arreglo
	ADD R0, R2 ; incremento el puntero
	SUB R1, R2 ; decremento el size
	CMP R1, R6
	JZ fin
	AND R5, R3
	CMP R5, R6
	JZ espar
	JMP esimpar
	
espar:
	CMP R1, R6
	JZ fin
	JMP ciclo
	
esimpar:
	ADD R4, R2 ; aumento count	
	CMP R1, R6
	JZ fin
	JMP ciclo
	
fin:
	POP |R7|, R6
	POP |R7|, R5
	POP |R7|, R3
	POP |R7|, R2
	POP |R7|, R1
	POP |R7|, R0
	 
	RET|R7|
	
p:
DB 0x01; 
DB 0x02 
DB 0x04
DB 0x08
DB 0x03;
DB 0x03;
DB 0xA1;
DB 0xC0
DB 0xFF;
DB 0x40
DB 0x55;
DB 0xCC
DB 0xBD;
DB 0x45;
DB 0x9A
DB 0xEE
