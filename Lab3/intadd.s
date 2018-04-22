    .syntax unified

    @ Template file for Lab 3
    @ Team member names here
    @ Roee Landesman
    .arch armv6
    .fpu vfp 

 .global intadd
 intadd: 
 	push {r0,r1,r2}

 add:
 	and r2, r0, r1
 	eor r0, r0, r1
 	mov r1, r3, LSL #1 @ Left shift argument included in ARM Assembly ISA
 	pop {r0,r1,r2}