// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm


// A demonstration to understand how AM=<compvalue> or AMD=<compvalue> assignments work.
// The "M" part of the assignment stores the result
// of the computation into M[A]
// But the "A" part of the assignment stores the result into A
// as well. So a question is: is it M[oldA] or M[newA]
// where the computation will be stored?

//Put 2 into D
@2
D=A

//Put 5 into A
@5

//Perform computation and store the result into 
//A and some memory location M[*]
AM=D+1
