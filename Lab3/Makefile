FLAGS=-O1 
# list .s source files here
SRCFILES=main.s intadd.s intsub.s intmul.s

all:	intcalc

clean: 
	rm -f *.o intcalc
	
intcalc : main.s intadd.s intmul.s intsub.s
	gcc -o calc main.s intadd.s intmul.s intsub.s
