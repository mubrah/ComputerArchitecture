    .syntax unified

    @ Template file for Lab 3
    @ Team member names here

    .arch armv6
    .fpu vfp
    .global intmul

intmul:
        push {r3, r4, r5, lr} 
        mov r5, #31     @ r5 loop counter
        mov r4, #0      @ r4 product, r0 multiplier, r1 multiplicand

loop:  cmp r5, 0       @ check if the counter has reached zero
        blt done

        and  r3, r1, #1   @ check if least significant bit of multiplier is 1
        cmp  r3, #1
        bne  shift

        push {r0, r1}      @ Saving original parameter values 
        mov r1, r4         @ Moving product into r1 for use in add method call
        bl intadd 
        mov r4, r0
        pop {r0, r1}         

shift:  lsl r0, r0, #1
        lsr r1, r1, #1

subtract_routine:
        push {r0, r1}
        mov r0, r5
        mov r1, #1
        bl intsub
        mov r5, r0
        pop {r0, r1}
        b loop

done:
        mov r0, r4
        pop {r3, r4, r5, pc}