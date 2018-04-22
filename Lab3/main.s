    .syntax unified

    @ Template file for Lab 3
    @ Team member names here
    @ Roee Landesman
    .arch armv6
    .fpu vfp 

    @ --------------------------------
    .global main
main:
      push {r6, r7, r8, lr} @ Saving to stack to use as temp variables in loop 
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

      ldr r0, =operation
      bl printf               @ Ask for user number (second number)

      ldr r0, =scanchar
      mov r1, sp
      bl scanf
      ldr r8, [sp]            @ Save the scanned value into r8 (operation)

      mov r0, r6              @ Put the scanned values into work registers
      mov r1, r7
      cmp r8, #42
      beq multbranch
      cmp r8, #43
      beq addbranch
      cmp r8, #45
      beq subbranch
      ldr r0, =invalid
      bl printf
      b loop

addbranch:
      mov r0, r6
      mov r1, r7
      bl intadd
      mov r1, r0
      ldr r0, =result
      bl printf
      b exit 

multbranch:
      mov r0, r6
      mov r1, r7
      bl intmul
      bl printf
      b exit

subbranch:
      mov r0, r6
      mov r1, r7
      bl intsub
      bl printf
      b exit 


exit:
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
invalid:
  .asciz "Invalid input, please try again!"
result:
   .asciz "Result: %d"
