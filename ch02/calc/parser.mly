%token <int> INT
%token ADD
%token SUB
%token MUL
%token DIV
%token LPAREN
%token RPAREN
%token EOF

%left ADD SUB
%left MUL DIV

%start <Calc.value> prog

%%

prog:
  | v = value; EOF { v };

value:
  | i = INT { `EInt i }
  | v1 = value; ADD; v2 = value { `EAdd (v1, v2) }
  | v1 = value; SUB; v2 = value { `ESub (v1, v2) }
  | v1 = value; MUL; v2 = value { `EMul (v1, v2) }
  | v1 = value; DIV; v2 = value { `EDiv (v1, v2) }
  | LPAREN; v = value; RPAREN { v }
