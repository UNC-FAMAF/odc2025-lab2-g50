	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32
	.equ ANIMATION_DELAY,	750

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.equ BLOCK_SIZE,	32

	.globl main

main:
	// x0 contiene la direccion base del framebuffer
 	mov x20, x0	// Guarda la dirección base del framebuffer en x20
	//---------------- CODE HERE ------------------------------------

	

loop2:
	movz x4, 0x82, lsl 16
	movk x4, 0xc8e5, lsl 00
	mov x0, x20
	mov x2, SCREEN_HEIGH         // Y Size
loop1:
	mov x1, SCREEN_WIDTH         // X Size
loop0:
	stur w4,[x0]  // Colorear el pixel N
	add x0,x0,4	   // Siguiente pixel
	sub x1,x1,1	   // Decrementar contador X
	cbnz x1,loop0  // Si no terminó la fila, salto
	sub x2,x2,1	   // Decrementar contador Y
	cbnz x2,loop1  // Si no es la última fila, salto
lopp3:
	//---------------------------------------------------------------
	// Infinite Loop
	
	BL grassPlate

	mov x25, 288
	mov x26, 32
	BL stoneBlock

	mov x3, ANIMATION_DELAY
	BL delay

	mov x25, 256
	mov x26, 64
	BL stoneBlock

	mov x3, ANIMATION_DELAY
	BL delay

	mov x25, 224
	mov x26, 96
	BL stoneBlock

	mov x3, ANIMATION_DELAY
	BL delay

	mov x25, 320
	mov x26, 64
	BL stoneBlock

	mov x3, ANIMATION_DELAY
	BL delay

	mov x25, 256
	mov x26, 320
	BL stoneBlock

	mov x3, ANIMATION_DELAY
	BL delay

	mov x25, 320
	mov x26, 320
	BL stoneBlock

	mov x3, ANIMATION_DELAY
	BL delay

	mov x25, 288
	mov x26, 352
	BL stoneBlock

	mov x3, ANIMATION_DELAY
	BL delay

	mov x25, 288
	mov x26, 320
	BL stoneBlock

	mov x3, ANIMATION_DELAY
	BL delay

	mov x25, 288
	mov x26, 288
	BL stoneBlock

	mov x3, ANIMATION_DELAY
	BL delay

	mov x25, 288
	mov x26, 256
	BL stoneBlock

	mov x3, ANIMATION_DELAY
	BL delay

	movz x4, 0x6f, lsl 16
	movk x4, 0x432a, lsl 00

	mov x12, 320
	mov x13, 190
	mov x10, 4
	mov x11, 75
	BL rect

	mov x12, 283
	mov x13, 190
	mov x10, 75
	mov x11, 50
	BL rect

	mov x3, ANIMATION_DELAY
	BL delay

	// TEXT
	movz x4, 0x00, lsl 16
	movk x4, 0x0000, lsl 00

	// LETRA O
	mov x1, 288
	mov x2, 211
	mov x3, 8
	BL lineVertical

	mov x1, 295
	mov x2, 211
	mov x3, 8
	BL lineVertical

	mov x1, 289
	mov x2, 210
	mov x3, 6
	BL lineHorizontal

	mov x1, 289
	mov x2, 219
	mov x3, 6
	BL lineHorizontal

	mov x3, ANIMATION_DELAY
	BL delay

	// LETRA D
	mov x1, 297
	mov x2, 210
	mov x3, 10
	BL lineVertical

	mov x1, 303
	mov x2, 212
	mov x3, 6
	BL lineVertical

	mov x1, 297
	mov x2, 210
	mov x3, 5
	BL lineHorizontal

	mov x1, 297
	mov x2, 219
	mov x3, 5
	BL lineHorizontal

	mov x1, 302
	mov x2, 211
	mov x3, 1
	BL lineHorizontal


	mov x1, 302
	mov x2, 218
	mov x3, 1
	BL lineHorizontal

	mov x3, ANIMATION_DELAY
	BL delay

	// LETRA C
	mov x1, 306
	mov x2, 212
	mov x3, 6
	BL lineVertical

	mov x1, 307
	mov x2, 211
	mov x3, 1
	BL lineVertical

	mov x1, 307
	mov x2, 218
	mov x3, 1
	BL lineVertical

	mov x1, 308
	mov x2, 211
	mov x3, 4
	BL lineHorizontal

	mov x1, 308
	mov x2, 218
	mov x3, 4
	BL lineHorizontal

	mov x3, ANIMATION_DELAY
	BL delay

	// Numero 2

	mov x1, 319
	mov x2, 211
	mov x3, 6
	BL lineHorizontal

	mov x1, 320
	mov x2, 216
	mov x3, 5
	BL lineHorizontal

	mov x1, 319
	mov x2, 220
	mov x3, 7
	BL lineHorizontal

	mov x1, 319
	mov x2, 217
	mov x3, 4
	BL lineVertical

	mov x1, 325
	mov x2, 212
	mov x3, 4
	BL lineVertical

	mov x3, ANIMATION_DELAY
	BL delay

	// Numero 0
	mov x1, 328
	mov x2, 212
	mov x3, 8
	BL lineVertical

	mov x1, 333
	mov x2, 212
	mov x3, 8
	BL lineVertical

	mov x1, 329
	mov x2, 211
	mov x3, 4
	BL lineHorizontal

	mov x1, 329
	mov x2, 220
	mov x3, 4
	BL lineHorizontal

	mov x3, ANIMATION_DELAY
	BL delay

	// Numero 2
	mov x1, 336
	mov x2, 211
	mov x3, 6
	BL lineHorizontal

	mov x1, 337
	mov x2, 216
	mov x3, 5
	BL lineHorizontal

	mov x1, 336
	mov x2, 220
	mov x3, 7
	BL lineHorizontal

	mov x1, 336
	mov x2, 217
	mov x3, 4
	BL lineVertical

	mov x1, 342
	mov x2, 212
	mov x3, 4
	BL lineVertical

	mov x3, ANIMATION_DELAY
	BL delay

	// Numero 5
	mov x1, 345
	mov x2, 211
	mov x3, 8
	BL lineHorizontal

	mov x1, 345
	mov x2, 215
	mov x3, 7
	BL lineHorizontal

	mov x1, 345
	mov x2, 220
	mov x3, 7
	BL lineHorizontal

	mov x1, 345
	mov x2, 211
	mov x3, 4
	BL lineVertical

	mov x1, 352
	mov x2, 216
	mov x3, 4
	BL lineVertical

	B InfLoop

// Parameters x1: X init; x2: Y init; x3: size; x4 color;
lineUpper:
	mov x9, x3
	mov x10, x1
	mov x11, x2
	mov x14, SCREEN_WIDTH
lineUpper0:
	mul x12, x11, x14
	add x12, x12, x10
	lsl x12, x12, 2

	mov x13, x20
	add x13, x13, x12
	stur w4, [x13]

	add x10, x10, 1
	sub x11, x11, 1
	sub x9, x9, 1
	cbnz x9, lineUpper0



	BR x30

// Parameters x1: X init; x2: Y init; x3: size; x4 color;
lineBottom:
	mov x9, x3
	mov x10, x1
	mov x11, x2
	mov x14, SCREEN_WIDTH
lineBottom0:
	mul x12, x11, x14
	add x12, x12, x10
	lsl x12, x12, 2

	mov x13, x20
	add x13, x13, x12
	stur w4, [x13]

	add x10, x10, 1
	add x11, x11, 1
	sub x9, x9, 1
	cbnz x9, lineBottom0



	BR x30

lineVertical:
	mov x9, x3
	mov x10, x1
	mov x11, x2
	mov x14, SCREEN_WIDTH
lineVertical0:
	mul x12, x11, x14
	add x12, x12, x10
	lsl x12, x12, 2

	mov x13, x20
	add x13, x13, x12
	stur w4, [x13]

	add x11, x11, 1
	sub x9, x9, 1
	cbnz x9, lineVertical0

	BR x30

lineHorizontal:
	mov x9, x3
	mov x10, x1
	mov x11, x2
	mov x14, SCREEN_WIDTH
lineHorizontal0:
	mul x12, x11, x14
	add x12, x12, x10
	lsl x12, x12, 2

	mov x13, x20
	add x13, x13, x12
	stur w4, [x13]

	add x10, x10, 1
	sub x9, x9, 1
	cbnz x9, lineHorizontal0

	BR x30


// Parameters x5: X init; x6: Y init; x4 color;
blockLeftSide:
	mov x15, BLOCK_SIZE
	mov x29, x30
blockLeftSide0:
	mov x1, x5
	sub x11, x15, BLOCK_SIZE
	neg x11, x11
	add x11, x6, x11
	mov x2, x11
	
	BL lineBottom

	sub x15, x15, 1

	cbnz x15, blockLeftSide0

	BR x29

// Parameters x5: X init; x6: Y init; x4 color;
blockRightSide:
	mov x15, BLOCK_SIZE
	mov x29, x30
blockRightSide0:
	mov x1, x5
	sub x11, x15, BLOCK_SIZE
	neg x11, x11
	add x11, x6, x11
	mov x2, x11
	
	BL lineUpper

	sub x15, x15, 1

	cbnz x15, blockRightSide0

	BR x29

// Parameters x5: X init; x6: Y init; x4 color;
blockTopSide:
	mov x15, BLOCK_SIZE
	mov x29, x30
blockTopSide0:
	sub x10, x15, BLOCK_SIZE
	neg x10, x10
	sub x10, x5, x10
	mov x1, x10
	sub x11, x15, BLOCK_SIZE
	neg x11, x11
	add x11, x6, x11
	mov x2, x11
	mov x3, BLOCK_SIZE
	add x3, x3, 1
	BL lineBottom

	sub x10, x15, BLOCK_SIZE
	neg x10, x10
	sub x10, x5, x10
	add x10, x10, 1
	mov x1, x10
	sub x11, x15, BLOCK_SIZE
	neg x11, x11
	add x11, x6, x11
	mov x2, x11
	mov x3, BLOCK_SIZE
	BL lineBottom

	sub x15, x15, 1

	cbnz x15, blockTopSide0

	BR x29

// Parameters x25: X init; x26: Y Init
block:

	mov x27, x30

	mov x3, 32

	movz x4, 0x10, lsl 16
	movk x4, 0x1010, lsl 00
	mov x5, x25
	mov x6, x26
	BL blockLeftSide

	movz x4, 0x08, lsl 16
	movk x4, 0x0808, lsl 00
	add x5, x5, x3
	sub x5, x5, 1
	add x6, x6, x3
	sub x6, x6, 1
	BL blockRightSide


	movz x4, 0x15, lsl 16
	movk x4, 0x1515, lsl 00
	add x5, x25, x3
	sub x5, x5, 1
	sub x6, x26, x3
	add x6, x6, 1
	BL blockTopSide


	BR x27

grassBlock:
	mov x27, x30

	mov x3, 32

	movz x4, 0x55, lsl 16
	movk x4, 0x2f12, lsl 00
	mov x5, x25
	mov x6, x26
	BL blockLeftSide

	movz x4, 0x46, lsl 16
	movk x4, 0x250a, lsl 00
	add x5, x5, x3
	sub x5, x5, 1
	add x6, x6, x3
	sub x6, x6, 1
	BL blockRightSide


	movz x4, 0x3f, lsl 16
	movk x4, 0x9b0b, lsl 00
	add x5, x25, x3
	sub x5, x5, 1
	sub x6, x26, x3
	add x6, x6, 1
	BL blockTopSide


	BR x27

stoneBlock:
	mov x27, x30

	mov x3, 32

	movz x4, 0x7B, lsl 16
	movk x4, 0x7D70, lsl 00
	mov x5, x25
	mov x6, x26
	BL blockLeftSide

	movz x4, 0x73, lsl 16
	movk x4, 0x7568, lsl 00
	add x5, x5, x3
	sub x5, x5, 1
	add x6, x6, x3
	sub x6, x6, 1
	BL blockRightSide


	movz x4, 0x83, lsl 16
	movk x4, 0x8578, lsl 00
	add x5, x25, x3
	sub x5, x5, 1
	sub x6, x26, x3
	add x6, x6, 1
	BL blockTopSide


	BR x27

grassPlate:
	mov x24, x30
	mov x23, 6
grassPlate0:
	mov x22, 6
grassPlate1:

	sub x10, x22, 6
	neg x10, x10

	sub x11, x23, 6
	neg x11, x11

	mov x25, 288
	mov x26, 64
	lsl x11, x11, 5
	add x25, x25, x11
	add x26, x26, x11

	lsl x10, x10, 5
	sub x25, x25, x10
	add x26, x26, x10

	BL grassBlock

	mov x3, ANIMATION_DELAY
	BL delay

	sub x22, x22, 1

	cbnz x22, grassPlate1

	sub x23, x23, 1

	cbnz x23, grassPlate0

	BR x24

rect:
	mov x21, SCREEN_WIDTH
	mov x2, x11
rect1:
	mov x1, x10
rect2:
	add x15, x12, x1 // x
	add x16, x13, x2 // y

	mul x17, x16, x21
	add x18, x15, x17
	lsl x18, x18, 2

	add x19, x20, x18

	stur w4, [x19]

	sub x1, x1, 1
	cbnz x1, rect2
	sub x2, x2, 1
	cbnz x2, rect1
	BR x30

delay:
    SUB  SP, SP, #16       // Reservar espacio en el stack
    STUR X1, [SP, #8]      // Guardar X1
    STUR X2, [SP, #0]      // Guardar X2
    
	movz X2, 0x03, lsl 16
	movk X2, 0x8002, lsl 00
    //MOV  X2, #0x00038002       // Ajustar este valor para la velocidad de tu CPU
    MUL  X2, X2, X3        // X2 = iteraciones totales (X2 * milisegundos)

delay_loop:
    SUBS X2, X2, #1        // Decrementar contador
    B.NE delay_loop        // Continuar si no es cero
    
    LDUR X2, [SP, #0]      // Restaurar X2
    LDUR X1, [SP, #8]      // Restaurar X1
    ADD  SP, SP, #16       // Liberar stack
    BR   LR                // Retornar

InfLoop:
	b InfLoop
