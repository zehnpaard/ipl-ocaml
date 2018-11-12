%token <int> INT
%token <string> ID
%token COMMA
%token SEMICOLON
%token LPAREN
%token RPAREN
%token LBRACE
%token RBRACE
%token TINT
%token EOF

%start <Ast.def list> prog

%%

prog:
  | defs = list (def); EOF { defs }
  ;

def:
  | t = ty; x = ID; 
    LPAREN; a = separated_list (COMMA, arg); RPAREN;
    LBRACE; s = list (stm); RBRACE  { `DFun (t, x, a, s) }
  ;

ty:
  | TINT { `TInt }
  ;

arg:
  | t = ty; x = ID { (t, x) }
  ;

stm:
  | e = exp; SEMICOLON { `SExp e }
  ;

exp:
  | x = ID; { `EId x }
  ;