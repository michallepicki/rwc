let print_string thing = Io.format "~ts" [ thing ]

let print thing = Io.format "~0tp~n" [ thing ]

let binary_concat binaries joiner =
  let join elem acc = acc ^ elem in
  Lists.foldl join "" (Lists.join joiner binaries)

let variables () =
  print_string "variables\n";
  let x = 3 in
  let y = 4 in
  let z = x + y in
  print x;
  print y;
  print z;
  let languages = "OCaml,Perl,C++,C" in
  let dashed_languages =
    let language_list = Binary.split languages [ "," ] [ Binary.Global ] in
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
  let ints, strings = Lists.unzip [ (1, "one"); (2, "two"); (3, "three") ] in
  print ints;
  print strings;
  let upcase_first_entry line =
    let (first :: rest) = Binary.split line [ "," ] [ Binary.Global ] in
    binary_concat (My_externals.string_uppercase first :: rest) ","
  in
  print (upcase_first_entry "one,two,three");
  print (upcase_first_entry "");
  print_string "\n"

let functions () =
  print_string "functions\n";
  print ((fun x -> x + 1) 7);
  print (Lists.map (fun x -> x + 1) [ 1; 2; 3 ]);
  (* caramel bug below: *)
  (* let transforms = [ My_externals.string_uppercase; My_externals.string_lowercase ] in
     print (Lists.map (fun g -> g "Hello World") transforms); *)
  let plusone x = x + 1 in
  print (plusone 3);
  let plusone2 x = x + 1 in
  print (plusone 3);
  print_string "\n"

let run () =
  variables ();
  functions ();
  print_string "\n"
