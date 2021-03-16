/*Definition Section*/
%{
#include<stdio.h>
%}

/*Rule Section*/
letter [a-zA-Z]
digit [0-9]

%%

"/*"[^*/]*"*/" {
    printf("%s\tMULTILINE COMMENT\n",yytext);
}

"//".*\n {
    printf("%s\tSINGLE LINE COMMENT\n",yytext);
}

#include<{letter}+(\.{letter})?> {
    printf("%s\tPREPROCESSOR\n",yytext);
}

#define {
    printf("%s\tPREPROCESSOR\n",yytext);
}

"{"|"}"|";"|","|"("|")"|"<<<"|">>>"   {
    printf("%s\tSEPERATOR\n",yytext);
}

\\"{"[^*/]*"}" {
    printf("%s\tSTATEMENT\n",yytext);
}

\'(\\.|[^'\\])\' {
    printf("%s\tCHARACTER LITERAL\n",yytext);
}

\"(\\.|[^"\\])*\" {
    printf("%s\tSTRING LITERAL\n",yytext);
}

"main"|"break"|"return"|"continue"|"__global__"|"void" {
    printf("%s\tKEYWORD\n",yytext);
}

"if-else"|"if-else if"|"if"|"switch"|"while"|"for"|"do" {
    printf("%s\tCONTROL FLOW\n",yytext);
}

"int"|"float"|"char"|"double"|"short int"|"unsigned short int"|"unsigned int"|"long int"|"unsigned long int"|"long long int"|"unsigned long long int"|"signed char"|"unsigned char"|"float"|"double"|"long double" {
    printf("%s\tPREMITIVE DATATYPE\n",yytext);
} 

"struct" {
    printf("%s\tSTRUCT\n",yytext);
}

"union" {
    printf("%s\tUNION\n",yytext);
}

"do""{"[^*/]*"}""while" {
    printf("%s\tControl flow\n",yytext);
} 

"printf"|"scanf" {
    printf("%s\tSYSTEM DEFINED FUNCTIONS\n",yytext);
}					

{digit}+ {
    printf("%s\tINTEGER\n",yytext);
}

{digit}+\.{digit}+ {
    printf("%s\tFLOAT\n",yytext);
}

[0-9]* {
    printf("%s\t Number \n",yytext);
}					

"+"|"-"|"/"|"="|"*"|"%"|"++"|"--"|"=="|"!="|">"|"<"|"<="|">="|"&&"|"||"|"!"|"&"|"|"|"^"|"<<"|">>"|"->"|"."|"?:"|"+="|"-="|"*="|"/="|"%="|"&="|"^="|"|="|"<<="|">>=" {
    printf("%s\tOPERATOR\n",yytext);
}						

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("%s\tIdentifier\n",yytext);
}  

[a-zA-Z][0-9]+|[a-zA-Z]*("["[0-9]+"]")+ {
    printf("%s\tARRAY\n",yytext);
}  

.|\n ; 		

%%

/*call the yywrap function*/
int yywrap()								
{
    return 1;
}

/*Auxiliary function*/
/*Driver function*/

int main(void)
{
    /*call the yylex function.*/

    printf("Enter String \n");
    yylex();
    return 0;
}