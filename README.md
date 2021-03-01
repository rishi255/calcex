# calcex

## A text-based calculator made using Lex and Yacc

### Operations supported

- "+", "-", "*", "/" with operator precedence
- "^" operator (power)
- Bracketing of expressions in parantheses

### Features to add

- % (modulo symbol)
- PowerMod (a^n % b) calculated efficiently (not naively but using proper algorithm to prevent overflow)

The calculator always returns a double as the answer for valid expressions.

### Installation

The packages ```flex``` and ```bison``` are required to compile the code.  
To install them, run the following commands:

- ```sudo apt install flex bison make```

A Makefile is provided for easy compilation.  
To compile the code using the Makefile, ```cd``` into the cloned repo folder and run the following:

- ```make```

### Usage

To run the program after installing, make sure you are in the cloned repo folder and just type ```./calcex```.  
The program quits whenever an error is reported, or when ```exit``` is passed as input to the program.  
The "yyerror()" function is used to report whatever error the parser faces.

#### Example inputs

1. ```19672 * (347213 - 421)/5```
2. ```345^3 % 90```
