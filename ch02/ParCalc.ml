type token =
  | SYMB1
  | SYMB2
  | SYMB3
  | SYMB4
  | SYMB5
  | SYMB6
  | TOK_EOF
  | TOK_Ident of (string)
  | TOK_String of (string)
  | TOK_Integer of (int)
  | TOK_Double of (float)
  | TOK_Char of (char)

open Parsing;;
let _ = parse_error;;
# 3 "ParCalc.mly"
open AbsCalc
open Lexing


# 23 "ParCalc.ml"
let yytransl_const = [|
  257 (* SYMB1 *);
  258 (* SYMB2 *);
  259 (* SYMB3 *);
  260 (* SYMB4 *);
  261 (* SYMB5 *);
  262 (* SYMB6 *);
  263 (* TOK_EOF *);
    0|]

let yytransl_block = [|
  264 (* TOK_Ident *);
  265 (* TOK_String *);
  266 (* TOK_Integer *);
  267 (* TOK_Double *);
  268 (* TOK_Char *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\002\000\003\000\003\000\003\000\
\004\000\004\000\005\000\000\000"

let yylen = "\002\000\
\002\000\001\000\003\000\003\000\001\000\003\000\003\000\001\000\
\001\000\003\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\002\000\000\000\011\000\012\000\000\000\000\000\
\008\000\009\000\000\000\000\000\000\000\001\000\000\000\000\000\
\010\000\000\000\000\000\006\000\007\000"

let yydgoto = "\002\000\
\006\000\007\000\008\000\009\000\010\000"

let yysindex = "\003\000\
\000\255\000\000\000\000\252\254\000\000\000\000\019\255\025\255\
\000\000\000\000\021\255\252\254\252\254\000\000\252\254\252\254\
\000\000\025\255\025\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\010\255\012\255\000\000\000\000"

let yygindex = "\000\000\
\000\000\005\000\012\000\015\000\000\000"

let yytablesize = 31
let yytable = "\003\000\
\004\000\005\000\005\000\001\000\004\000\005\000\005\000\005\000\
\011\000\005\000\003\000\003\000\004\000\004\000\000\000\003\000\
\003\000\004\000\004\000\012\000\013\000\012\000\013\000\018\000\
\019\000\014\000\017\000\015\000\016\000\020\000\021\000"

let yycheck = "\000\001\
\005\001\001\001\002\001\001\000\005\001\010\001\006\001\007\001\
\004\000\010\001\001\001\002\001\001\001\002\001\255\255\006\001\
\007\001\006\001\007\001\001\001\002\001\001\001\002\001\012\000\
\013\000\007\001\006\001\003\001\004\001\015\000\016\000"

let yynames_const = "\
  SYMB1\000\
  SYMB2\000\
  SYMB3\000\
  SYMB4\000\
  SYMB5\000\
  SYMB6\000\
  TOK_EOF\000\
  "

let yynames_block = "\
  TOK_Ident\000\
  TOK_String\000\
  TOK_Integer\000\
  TOK_Double\000\
  TOK_Char\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 30 "ParCalc.mly"
                   ( _1 )
# 109 "ParCalc.ml"
               : AbsCalc.exp))
; (fun __caml_parser_env ->
    Obj.repr(
# 31 "ParCalc.mly"
          ( raise (BNFC_Util.Parse_error (Parsing.symbol_start_pos (), Parsing.symbol_end_pos ())) )
# 115 "ParCalc.ml"
               : AbsCalc.exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp1) in
    Obj.repr(
# 34 "ParCalc.mly"
                     ( EAdd (_1, _3) )
# 123 "ParCalc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp1) in
    Obj.repr(
# 35 "ParCalc.mly"
                   ( ESub (_1, _3) )
# 131 "ParCalc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'exp1) in
    Obj.repr(
# 36 "ParCalc.mly"
         (  _1 )
# 138 "ParCalc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp1) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp2) in
    Obj.repr(
# 39 "ParCalc.mly"
                       ( EMul (_1, _3) )
# 146 "ParCalc.ml"
               : 'exp1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp1) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp2) in
    Obj.repr(
# 40 "ParCalc.mly"
                    ( EDiv (_1, _3) )
# 154 "ParCalc.ml"
               : 'exp1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'exp2) in
    Obj.repr(
# 41 "ParCalc.mly"
         (  _1 )
# 161 "ParCalc.ml"
               : 'exp1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'int) in
    Obj.repr(
# 44 "ParCalc.mly"
           ( EInt _1 )
# 168 "ParCalc.ml"
               : 'exp2))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 45 "ParCalc.mly"
                    (  _2 )
# 175 "ParCalc.ml"
               : 'exp2))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 49 "ParCalc.mly"
                    ( _1 )
# 182 "ParCalc.ml"
               : 'int))
(* Entry pExp *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let pExp (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : AbsCalc.exp)
