FLAGS=-O1 -g  
# list .s source files here
SRCFILES=main.s intadd.s intsub.s intmul.s

all: intcalc

clean: 
	rm -f *.o intcalc


intcalc: $(SRCFILES) 
	gcc $(FLAGS) -o intcalc $^ 

