run:
	bison -d calc.y
	flex calc.l; 
	gcc lex.yy.c calc.tab.c -lm -o calcex;
clean:
	rm -f *.tab.* *.yy.c calcex calc.output
