open Lexer
open Lexing

let parse_with_error lexbuf =
    try Parser.prog Lexer.read lexbuf with 
      | SyntaxError msg -> print_endline msg; exit (-1)
      | Parser.Error -> print_endline "Parser error"; exit (-1)

let () =
    let input_string = read_line () in
    let lexbuf = Lexing.from_string input_string in
    match parse_with_error lexbuf with
      | _ -> print_endline "Parse successful" 
