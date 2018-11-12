%token <int> INT
%token ADD
%token EOF

%start <Calc.value> prog

%%

prog:
  | v = value; EOF { v };

value:
  | i = INT { `EInt i }
  | v1 = value; ADD; v2 = value { `EAdd (v1, v2) }
