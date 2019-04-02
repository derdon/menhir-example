open Parser

exception Error of string


let rec token buf =
  let digit = [%sedlex.regexp? '0'..'9'] in
  match%sedlex buf with
  | (' ' | '\t' | '\n') -> token buf
  | ';' -> SEMICOLON
  | Plus digit -> INT (int_of_string (Sedlexing.Latin1.lexeme buf))
  | '+' -> PLUS
  | '-' -> MINUS
  | '*' -> TIMES
  | '/' -> DIV
  | '(' -> LPAREN
  | ')' -> RPAREN
  | eof -> EOF
  | _ -> raise (Error (Printf.sprintf "At offset %d: unexpected character." (Sedlexing.lexeme_start buf)))
