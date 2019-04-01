
module Sedlex = struct

let format_position ?(fname=None) lexbuf =
  let (ante, _) = Sedlexing.lexing_positions lexbuf in
  let fname = match fname with None -> ante.pos_fname | Some n -> n in
  Printf.sprintf "%s:%d:%d" fname
    ante.pos_lnum (ante.pos_cnum - ante.pos_bol + 1)

let parse1_utf8 ?fname yaccparser lexbuf =
  let token = Tokenizer.token in
  let revised_parser =
    MenhirLib.Convert.Simplified.traditional2revised yaccparser in

  let revised_lexer () =
    let tok = token lexbuf in
    let (ante, post) = Sedlexing.lexing_positions lexbuf in
    (tok, ante, post) in

  try
    revised_parser revised_lexer
  with
  | Parser.Error as e ->
    Printf.fprintf stderr "Parse error at %s\n" (format_position ~fname lexbuf) ;
    flush stderr ;
    raise e
  | Tokenizer.Error msg as e ->
    Printf.fprintf stderr "Tokenizer error: %s\n" msg ;
    Printf.fprintf stderr "Lexing error at %s\n" (format_position ~fname lexbuf) ;
    flush stderr ;
    raise e
    

let parse1_string_utf8 pafun s =
  let lb = Sedlexing.Utf8.from_string s in
  parse1_utf8 ~fname:"<string-input>" pafun lb

let parse1_file_utf8 yaccparser fname =
  let ic = open_in fname in
  try
    let lb = Sedlexing.Utf8.from_channel ic in
    let rv = parse1_utf8 ~fname yaccparser lb in
    close_in ic ;
    rv
  with e ->
    close_in ic ;
    raise e
end

module Ocamllex = struct
  open Batteries
  let parse1_file yaccparser fname =
    let input = open_in fname in
    let filebuf = Lexing.from_input input in
    try
      yaccparser Lexer.token filebuf
    with
    | Lexer.Error msg as e ->
      Printf.eprintf "%s%!" msg ;
      raise e
    | Parser.Error as e ->
      Printf.eprintf "At offset %d: syntax error.\n%!" (Lexing.lexeme_start filebuf)
      ;
      IO.close_in input ;
      raise e
end
