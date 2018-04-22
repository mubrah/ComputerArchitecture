    .syntax unified

    @ Template file for Lab 3
    @ Team member names here
    @ Roee Landesman
    .arch armv6
    .fpu vfp 

 .global intadd

intadd: 
   push {r1,r2,lr}

main:
   cmp r1, #0 @ Check if register r1 is value 0
   beq done @ Exit if register is 0 

   and r2, r0, r1
   eor r0, r0, r1
   mov r1, r2, LSL #1 @ Left shift argument included in ARM Assembly ISA
   b main

done:
   pop {r1,r2,pc}