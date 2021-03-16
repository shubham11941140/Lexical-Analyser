# Lexical-Analyser
Analyses a subset of C programming constructs and returns associated tokens using Lex


The file lex.l contains the code to initialise tokens:
On Linux Terminal run the following commands:

    flex lex.l

A lex.yy.c file is generated, execute in the manner a C file is parsed:

    gcc lex.yy.c
    ./a.out

There you go:

Enter the desired string and you will get your tokens.

Press Enter key for the string to be parsed.

You can parse as many strings as you like.

To terminate, press Ctrl + C/Ctrl + Z to exit.
