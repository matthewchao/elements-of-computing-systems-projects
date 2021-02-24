// A program to test out filling the screen without keyboard logic

@0
M=1;
D=A;
D=D-1;
@ALL_ONES
M=D; //sets ALL_ONES= "1111 1111 1111 1111"

// Below colors the full screen white if R[0]=0,
// or black if R[0]=1


// outer loop initialization
@i
M=0;
@offset1
M=0;
//put the number we are going to assign to (either 0 or 32767) into R[2]
@2 //2 will hold the value 0 or 32767
M=0;
@0
D=M;
@OUTER_LOOP
D;JEQ
//else, 
@ALL_ONES
D=M;
@2
M=D;
////////////////////////////////////////////////

(OUTER_LOOP)
// Outer loop termination condition
@i
D=M;
@256;
D=D-A; //Sets D = i-256
@OUTER_END
D;JEQ //If i==0, terminate.


    // BEGIN THE INNER LOOP
    //fill a row; 
    @j
    M=0;

    (INNER_LOOP)
    //termination; after 32 words are done
    @32
    D=A;
    @j
    D=M-D;
    @INNER_END
    D;JEQ //if j-32, terminate


    @SCREEN
    D=A;
    @idx
    M=D;
    @offset1
    D=M;
    @idx
    M=D+M; //idx = idx+offset1
    @j
    D=M;
    @idx
    M=D+M; //idx = SCREEN+offset1+j, the index we will color

    @2
    D=M;
    @idx
    A=M;
    M=D; //set this word of this row equal to 32767

    // inner loop incrementation
    @j
    M=M+1;
    @INNER_LOOP
    0;JMP

    (INNER_END)

// outer loop incrementation
@i
M=M+1;
@32
D=A; //D=32
@offset1
M=D+M; //offset1 increased by 32
@OUTER_LOOP
0;JMP

(OUTER_END)



@OUTER_END
0;JMP
