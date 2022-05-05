// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(RESTART)		//Declaring Restart Label
	@SCREEN   	//Set the A register to point to the memory
				//word that is mapped to the 16 left-most
				//pixels of the top row of the screen. RAM 16384 (0x4000)
	D=A 		//Placing the Address in the Data Reg
	@R0			//Calling RAM[0]
	M=D			//Placing the SCREEN Address from the Data to the Memory Reg

(KEYBOARD)		//Declaring KEYBOARD Label
	@KBD 		//Calling RAM address 24576 (0x6000)
	D=M 		//placing the contents of the Memory add in the Data reg
	@BLACK 		//Calling BLACK Label
	D;JGT		//If the value in D is >0 , jump to BLACK Label
	@WHITE		//Calling WHITE Label
	D;JEQ		//If the contents of D = 0, jump to WHITE Label

	@KEYBOARD	//Calling KEYBAORD Label 
	0;JMP		//GO to KEYBOARD Label

(BLACK)			//Declaring BLACK Label
	@R1			//Calling RAM[1]
	M=-1		//Placing -1 in the Memory register of RAM[1]
	@COLOUR		//Calling COLOUR Label 
	0;JMP		//Jump to COLOUR

(WHITE)			//Declaring WHITE Label
	@R1			//Calling RAM[1]
	M=0			//i=0, filling the screen with 0
	@COLOUR		//Calling COLOUR Label 
	0;JMP		//Jump to COLOUR


(COLOUR)		//Declaring COLOUR Label 
	@R1			//Calling RAM[1]	
	D=M			//Placing the contents in the Memory reg to the Data Register

	@R0			//Calling RAM[0]
	A=M			//Placing the Memory reg to the Address reg
	M=D			//M reg now has the value of the D reg

	@R0			//Calling RAM[0]
	D=M+1		//Incrementing Mem reg to move to next pixel
	@KBD		//Calling RAM address 24576 (0x6000)
	D=A-D		//KBD Address - SCREEN = A

	@R0
	M=M+1		//Incrementing to the next pixel
	A=M 		

	@COLOUR 	//Calling the COLOUR Label 
	D;JGT		//If value in D > 0 jump

@RESTART		//Calling the RESTART Label 
0;JMP 			//INF loop