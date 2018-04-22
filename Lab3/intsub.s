    .syntax unified

    @ Template file for Lab 3
    @ Team member names here
    @ Roee Landesman
    .arch armv6
    .fpu vfp 

 .global intsub
 intsub: 
    push {r1, r2, lr}
    mvn r1, r1 		@ Flip the sign of r1
    mov r2, r0		@ Save r0 for later
    mov r0, #1		@ Need to add 1 to r1 to flip it (twos compliment)
    bl intadd		@ Add the 1 
    mov r1, r2		@ Move the original value back into r1
    bl  intadd		@ Perform the additon of r1 + (-)r2
    pop {r1, r2, pc} @ Pop back the PC instead of LR to return to main sub subroutine