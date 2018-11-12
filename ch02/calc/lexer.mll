{
open Lexing
open Parser

exception SyntaxError of string
}

let digit = ['0'-'9']
let int = digit+

rule read = parse
  | int { INT (int_of_string (Lexing.lexeme lexbuf)) }
  | '+' { ADD }
  | '-' { SUB }
  | '*' { MUL }
  | '/' { DIV }
  | _  { raise (SyntaxError ("Unexpected char: " ^ Lexing.lexeme lexbuf)) }
  | eof { EOF }
