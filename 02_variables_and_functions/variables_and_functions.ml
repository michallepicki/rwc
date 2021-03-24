let print_string thing = Io.format "~ts" [ thing ]

let print thing = Io.format "~0tp~n" [ thing ]

(* this compiles to wrong erlang, at the end the local join function is used
   instead of the Lists.join one *)
(* let binary_concat binaries joiner =
 *   let join elem acc = acc ^ elem in
 *     Lists.foldl join "" (Lists.join joiner binaries)
 *)

let binary_concat binaries joiner =
  let myjoin elem acc = acc ^ elem in
    Lists.foldl myjoin "" (Lists.join joiner binaries)


let run () =
  print_string "variables\n" ;
  let languages = "OCaml,Perl,C++,C" in
  (* should this work? formatter drops (and compiler ignores) parens and it
     changes the meaning *)
  (* let dashed_languages =
   *   (let language_list = My_externals.string_split languages "," My_externalstypes.All in
   *    binary_concat language_list "-") in
   * print dashed_languages ;
   *)
  let language_list = My_externals.string_split languages "," My_types.All in
  let dashed_languages = binary_concat language_list "-" in
    print_string dashed_languages ;
    print_string "\n" ;

    print_string "\n"
