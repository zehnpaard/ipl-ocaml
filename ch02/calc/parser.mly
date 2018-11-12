%token <int> INT

%start <Calc.value> prog

%%

prog:
  | v = value { v };

value:
  | i = INT { `EInt i }
