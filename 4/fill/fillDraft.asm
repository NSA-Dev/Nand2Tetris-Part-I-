(LISTENER)
//addr = SCREEN
@SCREEN
D=A
@addr
M=D
//i for screenMem matrix row
@i
M=0
// set n to 0..8191 8192 = 32(cells per row)*256(rows) for the outer Loop
@8191
D=A
@cells
M=D

//Jump to draw loop if kbd > 0
(KBDREAD)
@KBD
D=M
@LOOP1
D;JGT
//jump to erase if kbd == 0
@ERASE
D;JEQ
@KBDREAD
0,JMP


(LOOP1)
//for(int i = 0; i > 8191; i++)
//if i > rows break loop
@i
D=M
@drawPoint
M=D
@cells
D=D-M
@LISTENER
D;JGT
//loop body
// addr[0] = -1;
@addr
A=M
M=-1
//i++
@i
M=M+1
//increment pointer
@addr
M=M+1
@LOOP1
0;JMP


(ERASE)
//for(int j = 0; j != drawPoint; j++)
@j
M=0
@SCREEN
D=A
@startAddr
M=D
(LOOP2)
@j
D=M
@drawPoint
D=D-M
@LISTENER
D;JGT
//loop body
@startAddr
A=M
M=0
@j
M=M+1
@startAddr
M=M+1
@LOOP2
0;JMP



(END)
@END
0;JMP