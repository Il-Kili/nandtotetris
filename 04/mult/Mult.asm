 // This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

@R2			//Calling RAM[2]
M=0			//Setting RAM[2] to 0 

@R0			//Calling RAM[0]
D=M 		//Placing the contents of the Memory from RAM[0] into the Data Register
@END		//Calling End Label 
D;JEQ		//Jumps to @END if the value in the Data Register is '0'

@R1			//Calling RAM[1]
D=M 		//Placing the contents of the Memory from RAM[1] into the Data Register
@END 		//Calling End Label 
D;JEQ		//Jumps to @END if the value in the Data Register is '0' 

(LOOP) 		//Declaring Loop Label
	@R1 	//Calling RAM[1] (Second Number)
	D=M 	//Placing the contents of the Memory from RAM[1] into the Data Register
			//The Data Reg has the second number

	@R2 	//Calling RAM[2] (Answer)
	M=D+M 	//Adding the Number in the Data Register(Second Number) to 
			//the number in the Memory(Previous Number)

	@R0 	//Calling RAM[0] to get 1st number
	M=M-1 	//Decreasing the number in the Mem registory of RAM[0] by 1

	D=M 	//Placing the contents of the Memory reg into D for RAM[0] to access it
	@LOOP 	//Calling Loop label
	D;JGT  	//Jump to (LOOP)

(END)		//Declaring END Label
	@END	//Calling END Label
	0;JMP 	//INF loop