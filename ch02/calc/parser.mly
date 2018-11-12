%token <int> INT
%token ADD

%start <Calc.value> prog

%%

prog:
  | v = value { v };

value:
  | i = INT { `EInt i }
  | v1 = value; ADD; v2 = value { `EAdd (v1, v2) }
