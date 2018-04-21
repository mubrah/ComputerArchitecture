    .syntax unified

    @ Template file for Lab 3
    @ Team member names here
    @ Roee Landesman
    .arch armv6
    .fpu vfp 

    @ --------------------------------
    .global main
main:
    @ driver function main lives here, modify this for your other functions
    @ You'll need to scan characters for the operation and to determine
    @ if the program should repeat.
    @ To scan a character, and compare it to another, do the following  
      push {r5, r6, lr}
loop:
      ldr  r0, =prompt1       @ Ask for user number
      bl printf 

      ldr r0, =scannumber
      mov r1, sp
      bl scanf
      ldr r6, [sp]            @ Save the scanned value into r6

      ldr r0, =prompt2
      bl printf               @ Ask for user number (second number)

      ldr r0, =scannumber
      mov r1, sp
      bl scanf
      ldr r7, [sp]            @ Save the scanned value into r7 (second number)

      

      mov     r1, sp          @ Save stack pointer to r1, you must create space
      bl      scanf           @ Scan user's answer
      ldr     r1, =yes        @ Put address of 'y' in r1
      ldrb    r1, [r1]        @ Load the actual character 'y' into r1
      ldrb    r0, [sp]        @ Put the user's value in r0
      cmp     r0, r1          @ Compare user's answer to char 'y'
      b       loop            @ branch to appropriate location
    @ this only works for character scans. You'll need a different
    @ format specifier for scanf for an integer ("%d"), and you'll
    @ need to use the ldr instruction instead of ldrb to load an int.
yes:
    .byte   'y'
scanchar:
    .asciz  " %c"
scannumber:
    .asciz  " %d"
printnum:
   .asciz "\n%d"
prompt1:
  .asciz "Enter number 1 please: "
prompt2:
  .asciz "Enter number 2 please: "
operation:
  .asciz "Enter operation please: "
