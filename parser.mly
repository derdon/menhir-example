%token <int> INT
%token PLUS MINUS TIMES DIV
%token LPAREN RPAREN
%token SEMICOLON
%token EOF

%left PLUS MINUS        /* lowest precedence */
%left TIMES DIV         /* medium precedence */
%nonassoc UMINUS        /* highest precedence */

%start <int list> main

%%

main:
| stmt = statement EOF { [stmt] }
| stmt = statement m = main { stmt :: m}

statement:
| e = expr SEMICOLON { e }

expr:
| i = INT
    { i }
| LPAREN e = expr RPAREN
    { e }
| e1 = expr PLUS e2 = expr
    { e1 + e2 }
| e1 = expr MINUS e2 = expr
    { e1 - e2 }
| e1 = expr TIMES e2 = expr
    { e1 * e2 }
| e1 = expr DIV e2 = expr
    { e1 / e2 }
| MINUS e = expr %prec UMINUS
    { - e }
