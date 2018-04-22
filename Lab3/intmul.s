    .syntax unified

    @ Template file for Lab 3
    @ Team member names here

    .arch armv6
    .fpu vfp
    @-------------------------------
    .global intmul

intmul:
        push {r3, r4, r5, lr}
        mov r5, #31     @ use r5 as loop init
        mov r4, #0

loopm:  cmp r5, 0
        blt exit

        and  r3, r1, #1   @check lsb of multiplier
        cmp  r3, #1
        bne  shift    
        push {r0, r1}
        mov r1, r4
        bl intadd 
        mov r4, r0
        pop {r0, r1}         

shift:  lsl r0, r0, #1
        lsr r1, r1, #1

sub_lp: push {r0, r1}
        mov r0, r5
        mov r1, #1
        bl intsub
        mov r5, r0
        pop {r0, r1}
        b loopm

exit:
        mov r0, r4
        pop {r3, r4, r5, lr}
