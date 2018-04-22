   .syntax unified
   .arch armv6
   .fpu vfp

   .global main

main:
   push {r6, r7, lr}

loop:
   ldr r0, =prompt1
   bl printf

   ldr r0, =scannumber
   mov r1, sp
   bl scanf
   ldr r6, [sp] 

   ldr r0, =prompt2
   bl printf

   ldr r0, =scannumber
   mov r1, sp
   bl scanf
   ldr r7, [sp]

   ldr r0, =operation
   bl printf

   ldr r0, =scanchar
   mov r1, sp
   bl scanf

   ldr r0, =addSign 
   ldrb r0, [r0]
   ldrb r1, [sp]       
   cmp r1, r0 
   beq addbranch

   ldr r0, =subSign
   ldrb r0, [r0]
   ldrb r1, [sp]           
   cmp r1, r0 
   beq subbranch


   ldr r0, =multSign
   ldrb r0, [r0]
   ldrb r1, [sp]            
   cmp r1, r0 
   beq multbranch

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

   b loop
subbranch:
   mov r0, r6
   mov r1, r7
   bl intsub

   mov r1, r0
   ldr r0, =result
   bl printf

   b loop
multbranch:
   mov r0, r6
   mov r1, r7
   bl intmul

   mov r1, r0
   ldr r0, =result
   bl printf

   b loop


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
  .asciz "Invalid input, please try again! \n"
result:
   .asciz "Result: %d \n"
test:
   .asciz "%c"
test2:
   .asciz "%c ahhh"

multSign: 
    .byte   '*'
addSign:
    .byte   '+'
subSign:
    .byte   '-'
yes:
    .byte   'y'
no:
    .byte   'n'