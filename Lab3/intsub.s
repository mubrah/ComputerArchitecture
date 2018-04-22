    .syntax unified

    @ Template file for Lab 3
    @ Team member names here
    @ Roee Landesman
    .arch armv6
    .fpu vfp 

 .global intsub
 intsub: 
 	push {r0,r1,r2}
 	mvn r2, #0
 	eor r1, r1, r2
 	mov r2, r0
 	mov r0, #0
 	bl intadd

 	mov r1, r2
 	bl intadd 
 	pop {r0,r1,r2}
