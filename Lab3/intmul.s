    .syntax unified
    @ Roee Landesman

    .arch armv6
    .fpu vfp
    .global intmul

intmul:
        push {r3, r4, r5, lr} 
        mov r5, #31     @ r5 loop counter
        mov r4, #0      @ r4 product, r0 multiplier, r1 multiplicand

left_of_flowchart:   cmp r5, #0       @ check if the counter has reached zero
        blt done

        and  r3, r1, #1   @ check if least significant bit of multiplier is 1
        cmp  r3, #1
        bne  right_of_flowchart

        push {r0, r1}      @ Saving original parameter values 
        mov r1, r4         @ Moving product into r1 for use in add method call
        bl intadd          @ Add multiplicand to product
        mov r4, r0         
        pop {r0, r1}         

right_of_flowchart:  
        lsl r0, r0, #1      @ Shift the multiplicand left by 1
        lsr r1, r1, #1      @ Shift the multiplier right by 1
        push {r0, r1}       
        mov r0, r5          @ Subtract the loop counter by 1
        mov r1, #1
        bl intsub
        mov r5, r0
        pop {r0, r1}
        b left_of_flowchart

done:
        mov r0, r4          @ Return value on r0
        pop {r3, r4, r5, pc}