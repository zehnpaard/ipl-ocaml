{
open Parser
open Lexing

exception SyntaxError of string

let next_line lexbuf =
    let pos = lexbuf.lex_curr_p in
    lexbuf.lex_curr_p <-
        { pos with pos_bol = lexbuf.lex_curr_pos;
                   pos_lnum = pos.pos_lnum + 1
        }
}

let digit = ['0'-'9']

let int = digit+

let frac = digit+ '.' digit*
let exp = ['e' 'E'] ['-' '+']? digit+
let float1 = frac exp?
let float2 = digit+ exp
let float = float1 | float2

let white = [' ' '\t']+
let newline = '\n' | '\r' | "\r\n"

let id = ['A'-'Z' 'a'-'z' '_'] ['A'-'Z' 'a'-'z' '0'-'9' '_']* 

rule read = parse
  | white { read lexbuf }
  | newline { next_line lexbuf; read lexbuf }
  | int { INT (int_of_string (Lexing.lexeme lexbuf)) }
  | float { FLOAT (float_of_string (Lexing.lexeme lexbuf)) }
  | '"' { read_string (Buffer.create 17) lexbuf }
  | "true" { TRUE }
  | "false" { FALSE }
  | "int" { TINT }
  | "double" { TDOUBLE }
  | "bool" { TBOOL }
  | "string" { TSTRING }
  | "void" { TVOID }
  | "return" { RETURN }
  | "while" { WHILE }
  | "if" { IF }
  | "else" { ELSE }
  | id { ID (Lexing.lexeme lexbuf) }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | '{' { LBRACE }
  | '}' { RBRACE }
  | ',' { COMMA }
  | ';' { SEMICOLON }
  | '=' { EQUAL }
  | "++" { INCREMENT }
  | "--" { DECREMENT }
  | "-" { SUB }
  | _ { raise (SyntaxError ("Unexpected char: " ^ Lexing.lexeme lexbuf)) }
  | eof { EOF }

and read_string buf = parse
  | '"' { STRING (Buffer.contents buf) }
  | '\\' '/' { Buffer.add_char buf '/'; read_string buf lexbuf }
  | '\\' '\\' { Buffer.add_char buf '\\'; read_string buf lexbuf }
  | '\\' 'b' { Buffer.add_char buf '\b'; read_string buf lexbuf }
  | '\\' 'f' { Buffer.add_char buf '\012'; read_string buf lexbuf }
  | '\\' 'n' { Buffer.add_char buf '\n'; read_string buf lexbuf }
  | '\\' 'r' { Buffer.add_char buf '\r'; read_string buf lexbuf }
  | '\\' 't' { Buffer.add_char buf '\t'; read_string buf lexbuf }
  | [^ '"' '\\']+ { Buffer.add_string buf (Lexing.lexeme lexbuf); read_string buf lexbuf }
  | _ { raise (SyntaxError ("Illegal string character: " ^ Lexing.lexeme lexbuf)) }
  | eof { raise (SyntaxError ("String is not terminated")) }
