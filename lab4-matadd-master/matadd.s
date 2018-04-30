matadd:
   push {r4,r5,r6,r7,r8,r9,r10}
   push {lr}
   ldr   r4, [sp, #32]  @ r4: width
   mov   r5, #0         @ r5: i = 0

loop_i_height: 
   cmp   r5, r3
   beq   exit            @ if i >= height, end
   mov   r6, #0         @ reset j = 0 each time outer loop is run

exit:
   pop {r4,r5,r6,r7,r8,r9,r10}
   pop {lr}