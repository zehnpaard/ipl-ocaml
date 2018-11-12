%token <int> INT
%token <float> FLOAT
%token <string> ID
%token <string> STRING
%token TRUE
%token FALSE
%token COMMA
%token SEMICOLON
%token LPAREN
%token RPAREN
%token LBRACE
%token RBRACE
%token EQUAL
%token MUL
%token DIV
%token ADD
%token SUB
%token LT
%token GT
%token LEQ
%token GEQ
%token EQ
%token NEQ
%token AND
%token OR
%token RETURN
%token WHILE
%token IF
%token ELSE
%token INCREMENT
%token DECREMENT
%token TINT
%token TDOUBLE
%token TBOOL
%token TSTRING
%token TVOID
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
  | TDOUBLE { `TDouble }
  | TBOOL { `TBool }
  | TSTRING { `TString }
  | TVOID { `TVoid }
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
  | x = ID { `EId x }
  | i = INT { `EInt i }
  | d = FLOAT { `EDouble d }
  | TRUE { `ETrue }
  | FALSE { `EFalse }
  | s = STRING { `EString s }
  | s = ID; LPAREN; es = separated_list(COMMA, exp); RPAREN { `ECall (s, es) }
  | e = exp; INCREMENT { `EPIncr e }
  | e = exp; DECREMENT { `EPDecr e }
  | INCREMENT; e = exp { `EIncr e }
  | DECREMENT; e = exp { `EDecr e }
  | SUB; e = exp { `ENeg e }
  | e1 = exp; MUL; e2 = exp { `EMul (e1, e2) }
  | e1 = exp; DIV; e2 = exp { `EDiv (e1, e2) }
  | e1 = exp; ADD; e2 = exp { `EAdd (e1, e2) }
  | e1 = exp; SUB; e2 = exp { `ESub (e1, e2) }
  | e1 = exp; LT; e2 = exp { `ELt (e1, e2) }
  | e1 = exp; GT; e2 = exp { `EGt (e1, e2) }
  | e1 = exp; LEQ; e2 = exp { `ELEq (e1, e2) }
  | e1 = exp; GEQ; e2 = exp { `EGEq (e1, e2) }
  | e1 = exp; EQ; e2 = exp { `EEq (e1, e2) }
  | e1 = exp; NEQ; e2 = exp { `ENEq (e1, e2) }
  | e1 = exp; AND; e2 = exp { `EAnd (e1, e2) }
  | e1 = exp; OR; e2 = exp { `EOr (e1, e2) }
  | e1 = exp; EQUAL; e2 = exp { `EAss (e1, e2) }
  ;
