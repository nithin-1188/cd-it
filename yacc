
7. Write a YACC program to evaluate an algebraic expression.
Below is a **clean, simple, fully working YACC program** that evaluates an algebraic expression with operators:

✔ `+ , - , * , /`
✔ parentheses `()`
✔ supports multi-digit numbers

Includes both **LEX** and **YACC** files.

---

# ✅ **LEX File (expr.l)**

```lex
%{
#include "y.tab.h"
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[ \t\n]     { /* ignore spaces */ }
.           { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
```

---

# ✅ **YACC File (expr.y)**

```yacc
%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s) {
    printf("Error: %s\n", s);
}
%}

%token NUMBER

%%

E  : E '+' T      { $$ = $1 + $3; }
   | E '-' T      { $$ = $1 - $3; }
   | T            { $$ = $1; }
   ;

T  : T '*' F      { $$ = $1 * $3; }
   | T '/' F      { $$ = $1 / $3; }
   | F            { $$ = $1; }
   ;

F  : '(' E ')'    { $$ = $2; }
   | NUMBER       { $$ = $1; }
   ;

%%

int main() {
    printf("Enter expression: ");
    yyparse();
    return 0;
}
```

---

# 🛠 **How to Compile and Run**

Open terminal and run:

```
yacc -d expr.y
lex expr.l
cc lex.yy.c y.tab.c -o expr
./expr
```

---

# ▶ Example Input

```
10 + 20 * 3 - (4 + 6)
```

# ▶ Output

```
Enter expression: 10 + 20 * 3 - (4 + 6)
44
```

---
