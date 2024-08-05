// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// So while nothing is clicked it clearns to white -> blacken

@place
M=0

(START)
  @24576
  D=M

  @BLACKENLOOP
  D;JNE
  @WHITENLOOP
  0;JMP

(BLACKENLOOP)
  @place
  D=M
  @8192 
  D=D-A
  @START
  D;JGE 
  @place
  D=M
  @SCREEN
  A=D+A 
  M=-1 
  @place
  M=M+1 

  @BLACKENLOOP
  D;JNE 

  @START
  0;JMP

(WHITENLOOP)
  @place
  D=M 
  @START
  D;JLT 
  @place
  D=M
  @SCREEN
  A=D+A 
  M=0 
  @place
  M=M-1 

  @START
  0;JMP