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

let white = [' ' '\t']+
let newline = '\n' | '\r' | "\r\n"

let id = ['A'-'Z' 'a'-'z' '_'] ['A'-'Z' 'a'-'z' '0'-'9' '_']* 

rule read = parse
  | white { read lexbuf }
  | newline { next_line lexbuf; read lexbuf }
  | int { INT (int_of_string (Lexing.lexeme lexbuf)) }
  | "int" { TINT }
  | id { ID (Lexing.lexeme lexbuf) }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | '{' { LBRACE }
  | '}' { RBRACE }
  | ',' { COMMA }
  | ';' { SEMICOLON }
  | '=' { EQUAL }
  | _ { raise (SyntaxError ("Unexpected char: " ^ Lexing.lexeme lexbuf)) }
  | eof { EOF }
