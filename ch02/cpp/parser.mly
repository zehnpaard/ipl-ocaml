%token <int> INT
%token <string> ID
%token COMMA
%token SEMICOLON
%token LPAREN
%token RPAREN
%token LBRACE
%token RBRACE
%token EQUAL
%token RETURN
%token WHILE
%token IF
%token ELSE
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
    LBRACE; ss = list (stm); RBRACE  { `DFun (t, x, a, ss) }
  ;

ty:
  | TINT { `TInt }
  ;

arg:
  | t = ty; x = ID { (t, x) }
  ;

stm:
  | e = exp; SEMICOLON { `SExp e }
  | t = ty; x = ID; SEMICOLON { `SDecl (t, x) }
  | t = ty; xs = separated_list (COMMA, ID); SEMICOLON { `SDecls (t, xs) }
  | t = ty; x = ID; EQUAL; e = exp; SEMICOLON { `SInit (t, x, e) }
  | RETURN; e = exp; SEMICOLON { `SReturn e }
  | WHILE; LPAREN; e = exp; RPAREN; s = stm { `SWhile (e, s) }
  | LBRACE; ss = list (stm); RBRACE { `SBlock ss }
  | IF; LPAREN; e = exp; RPAREN; s1 = stm; ELSE; s2 = stm { `SIfElse (e, s1, s2) }
  ;

exp:
  | x = ID; { `EId x }
  | i = INT; { `EInt i }
  ;
