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


//Consider that R1 is uniquely expressed as a[0]*2^0+a[1]*2^1+...+a[14]*2^14 where a[i] = 0 or 1

//Thus R2 = R0*a[0]*2^0 + R0*a[1]*2^1 + ... + R0*a[14]*2^14

//Invariants: At the beginning of the i-th iteration,
// 1) RAM[2] contains the cumulative sum of terms R0*a[j]*2^j for all j < i
// 2) Bit holds 2^i
// 3) Shift holds 2^i times R[0]

/////////////////////////////////////////////////////////
// Initialize i = 0
@i
M=0;

// Initialize RAM[2]:=0
@2
M=0;

// Initialize Bit:=2^0
@Bit
M=1;

// Initialize Shift:=R[0] in 2 steps:
// First, set D = R[0]
@0
D=M;
// Then set Shift = D.
@Shift
M=D;


////////////////////////////////////////////////////////////
// Main Loop
////////////////////////////////////////////////////////////
// Termination condition: when i = 15
(FORLOOP)
@i
D=M;
@15 //Sets A=15
D=D-A
D;JEQ
@END

//Set D = Bit&R1
@Bit
D=M;
@1
D=D&M

//IF Bit&R1 equals 0, then we DON'T add Shift to the cumulative sum
@PREPARE
D;JEQ
//ELSE, add Shift to the cumulative sum
@Shift
D=M;
@2
M=D+M


(PREPARE)
//Increment i, and satisfy invariants for the next iteration
@i
M=M+1;

@Bit
D=M;
@Bit
M=D+M;

@Shift
D=M;
@Shift
M=D+M;

@FORLOOP
0;JMP


(END)
@END
0;JMP
