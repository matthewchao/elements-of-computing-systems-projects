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


// Scans the keyboard address for anything nonzero

// Ram[0] = 0 if on the last scan, there were no keys pressed
// Ram[0] = 1 if on the last scan, there WAS a key pressed
// Ram[1] equals the status that we are changing to



(SCAN)
// Checks if the status R0 should change
// Jump to SCAN again if the status hasn't changed
// Otherwise set the status (either Ram[0] = 0 or Ram[0]=1)
// If Ram[0]=0, then Jump to the Unfill routine
// Otherwise proceed to the Fill routine

(FILL)
// Fill the screen
// Jump to SCAN

(UNFILL)
// Clear the screen
// Jump to SCAN
