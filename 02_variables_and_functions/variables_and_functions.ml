let print_string thing = Io.format "~ts" [ thing ]

let print thing = Io.format "~0tp~n" [ thing ]

let binary_concat binaries joiner =
  let join elem acc = acc ^ elem in
  Lists.foldl join "" (Lists.join joiner binaries)

let run () =
  print_string "variables\n";
  let x = 3 in
  let y = 4 in
  let z = x + y in
  print x;
  print y;
  print z;
  let languages = "OCaml,Perl,C++,C" in
  let dashed_languages =
    let language_list = My_externals.string_split languages "," My_types.All in
    binary_concat language_list "-"
  in
  print dashed_languages;
  (* let dashed_languages = let languages = String.split languages ~on:','
     in String.concat ~sep:"-" languages ; *)
  (* shadowing not supported yet! *)
  let area_of_ring inner_radius outer_radius =
    let pi = My_externals.pi () in
    let area_of_circle r = pi *. r *. r in
    area_of_circle outer_radius -. area_of_circle inner_radius
  in
  print (area_of_ring 1. 3.);

  print_string "\n"
