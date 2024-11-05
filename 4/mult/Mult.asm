// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.

// startVal = R0
@R0
D=M
@startVal
M=D

// n = R1
@R1
D=M
@n
M=D
// int i = 0; 
@i
M=0

// init result = 0;
@R2
M=0

(LOOP)
//if i == n go to END
@i
D=M
@n
D = D - M
@END
D;JEQ

// result += startVal;
@R2
D = M;
@startVal
D = D + M;
@R2
M = D;

// i++
@i
M = M + 1;

@LOOP
0;JMP


(END)
@END
0;JMP

