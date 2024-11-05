// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Remaining: add loop activation on key press



//while KBD != 0, Execute draw loop, else execute erase loop
// erase loop bound can be fetched from last i
// don't forget to set i, back to 0 once erase if finished
// set n to 0..8191 8192 = 32(cells per row)*256(rows) for the outer Loop


// WORKS AS INTENDED BUT LOGIC COULD BE IMPROVED
// MAIN LOOP - LISTENS TO THE KBD


//init bound 8192 = 32(cells per row)*256(rows)
@8191
D=A
@drawBound
M=D


(LISTENER)
//listen on KBD
@KBD
D=M

//KBD != 0 - draw KBD = 0, erase or do nothing
@DRAW
D;JNE
@ERASE
D;JEQ

@LISTENER
0;JMP


(DRAW)
//get screen ptr
@SCREEN
D=A
@screenPTR
M=D
// init counter i
@i
M=0
(DRAWLOOP)
//LOOP BODY
//CHECK if KBD still != 0
@KBD
D=M
@ERASE
D;JEQ
//if i > drawBound Jump to main LOOP
@i
D=M
@drawBound
D=D-M
@LISTENER
D;JGT
//set chunk to black col
@screenPTR
A=M
M=-1 
//increment pointer
@screenPTR
M=M+1
//increment i
@i
M=M+1
@DRAWLOOP
0;JMP


//ERASER
(ERASE)
//get num of iterations for bound
//@i
//D=M
//@eraseBound
//M=D
//re-init counter
@i
M=0
//re-init screenPTR
@SCREEN
D=A
@screenPTR
M=D
(ERASELOOP)
//check if key still off
@KBD
D=M
@DRAW
D;JNE
// check loop condition
@i
D=M
@drawBound
D=D-M
@LISTENER
D;JGT
//set chunk to WHITE
@screenPTR
A=M
M=0
//increment ptr
@screenPTR
M=M+1
//increment i
@i
M=M+1
@ERASELOOP
0;JMP







