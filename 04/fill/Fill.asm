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





// Ram[0] = the state = 0 or 1
// 0 means no key pressed, 1 means key press
// Ram[1] will be used to hold the next state


//Initialize constants:
@0
D=A;
D=D-1; //D = -1 in 2s complement notation
@ALL_ONES
M=D;

//Initialize state R[0]:=0 where things start out unfilled
@0
M=0;


(SCAN)
// Checks for a state change

    @KBD
    D=M;

    @1
    M=0;
    
    @COMPARE
    D;JEQ

    @1
    M=1;


    (COMPARE)
    //D = currState-nextState
    @0
    D=M;
    @1
    D=D-M;

    //IF the current and prev states coincide,
    //then no change: scan again
    @SCAN
    D;JEQ
    //ELSE: The states differ;
    //Update R[0] and proceed to the FILL routine
    @1
    D=M;
    @0
    M=D;


    (FILL)
    // outer loop initialization
    @i
    M=0;
    @offset1 //offset1 helps us more easily compute the addresses of the words we color
    M=0;
    @2 //2 will hold the value that we assign words to
    M=0;
    
    //IF state = 0, then proceed to the beginning of the loop (since we already set R[2]=0)
    @0
    D=M;
    @OUTER_LOOP
    D;JEQ
    //ELSE, set R[2]="11..111"
    @ALL_ONES
    D=M;
    @2
    M=D;


    (OUTER_LOOP)
    @i
    D=M;
    @256
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
    D=A;
    @offset1
    M=D+M; // offset1 increased by 32
    @OUTER_LOOP
    0;JMP

    (OUTER_END)    
    
@SCAN
0;JMP
