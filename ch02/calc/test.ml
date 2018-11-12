open Lexer
open Lexing

let parse_with_error lexbuf =
    try Parser.prog Lexer.read lexbuf with
      | SyntaxError msg -> print_endline msg; exit (-1)
      | Parser.Error -> print_endline "Parser error"; exit (-1)

let read_eval_print lexbuf = 
    let v = parse_with_error lexbuf in
    let n = Calc.eval v in
    print_endline (string_of_int n)

let () =
    let input_string = read_line () in
    let lexbuf = Lexing.from_string input_string in
    read_eval_print lexbuf
