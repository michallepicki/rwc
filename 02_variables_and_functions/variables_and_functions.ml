let print_string thing = Io.format "~ts" [ thing ]

let print thing = Io.format "~0tp~n" [ thing ]

let binary_concat binaries joiner =
  let join elem acc = acc ^ elem in
    Lists.foldl join "" (Lists.join joiner binaries)


let run () =
  print_string "variables\n" ;
  let languages = "OCaml,Perl,C++,C" in
  let dashed_languages =
    let language_list = My_externals.string_split languages "," My_types.All in
      binary_concat language_list "-" in
    print dashed_languages ;

    print_string "\n"
