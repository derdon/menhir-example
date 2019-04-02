(* open Batteries *)

let print_int_list = Batteries.(List.print Int.print stdout)

let main () =
  (* the name of the file which contains the expressions *)
  let filename = Sys.argv.(1) in
  print_int_list (Parsewrap.Ocamllex.parse1_file Parser.main filename)

let _ = main ()
