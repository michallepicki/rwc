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
  (* shadowing not supported yet! *)
  (* let dashed_languages2 =
       let languages = String.split languages ~on:',' in
       String.concat ~sep:"-" languages
     in
     print dashed_languages2; *)
  let area_of_ring inner_radius outer_radius =
    let pi = My_externals.pi () in
    let area_of_circle r = pi *. r *. r in
    area_of_circle outer_radius -. area_of_circle inner_radius
  in
  print (area_of_ring 1. 3.);
  print_string "\n"

let pattern_matching_and_let () =
  print_string "pattern_matching_and_let\n";
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

let anonymous_functions () =
  print_string "anonymous_functions\n";
  print ((fun x -> x + 1) 7);
  print (Lists.map (fun x -> x + 1) [ 1; 2; 3 ]);

  let transforms =
    [ My_externals.string_uppercase; My_externals.string_lowercase ]
  in
  print (Lists.map (fun g -> g "Hello World") transforms);
  (* equivalent to
     let plusone = (fun x -> x + 1)) *)
  let plusone x = x + 1 in
  print (plusone 3);
  print ((fun x -> x + 1) 7);
  print_string "\n"

let multiargument_functions () =
  print_string "multiargument_functions\n";
  let x = 7 in
  print (x + 1);
  (* equivalent to
     let abs_diff =
       (fun x -> (fun y -> Erlang.abs (x - y))) in *)
  (* and equivalent to
     let abs_diff = (fun x y -> Erlang.abs (x - y)) in *)
  let abs_diff x y = Erlang.abs (x - y) in
  print (abs_diff 3 4);
  (* partial application not working in Caramel yet!
     let dist_from_3 = abs_diff 3 in
     print (dist_from_3 8);
     print (dist_from_3 (-1)); *)
  let abs_diff2 (x, y) = Erlang.abs (x - y) in
  print (abs_diff2 (3, 4));
  print_string "\n"

(* recursive functions need to be declared at toplevel in caramel *)
(* or-patterns are currently not supported in caramel
   let rec find_first_repeat list =
     match list with
     | [] | [_] ->
       (* only zero or one elements, so no repeats *)
       None
     | x :: y :: tl ->
       if x = y then Some x else find_first_repeat (y::tl) *)

let rec is_even x = if x = 0 then true else is_odd (x - 1)

and is_odd x = if x = 0 then false else is_even (x - 1)

let recursive_functions () =
  print_string "recursive functions\n";
  print (Lists.map is_even [ 0; 1; 2; 3; 4; 5 ]);
  print (Lists.map is_odd [ 0; 1; 2; 3; 4; 5 ]);
  print_string "\n"

let prefix_and_infix_operators () =
  print_string "prefix_and_infix_operators\n";
  print (My_externals.max 3 4);
  print (3 + 4);
  (* same as
     print ((+) 3 4); *)
  (* this will work with the partial application fix
     print (Lists.map (( + ) 3) [ 4; 5; 6 ]); *)
  (* can't declare operators yet
     let (+!) (x1,y1) (x2,y2) = (x1 + x2, y1 + y2) in
     print ((3,2) +! (-2,4)); *)
  (* let ( *** ) x y = (x **. y) **. y;; *)
  print (My_externals.max 3 (-4));
  let path = "/usr/bin:/usr/local/bin:/bin:/sbin:/usr/bin" in
  (* let (|>) x f = f x in
     Binary.split path [ ":" ] [ Binary.Global ]
     |> My_externals.lists_usort
     |> Lists.foreach print *)
  let split_path = Binary.split path [ ":" ] [ Binary.Global ] in
  let deduped_path = My_externals.lists_usort split_path in
  Lists.foreach print deduped_path;
  Lists.foreach print [ "Two"; "lines" ];
  (* Lists.foreach print; *)
  (* operator associativity, left or right, should be based on operator prefix *)
  print_string "\n"

let declaring_functions_with_function () =
  print_string "declaring_functions_with_function\n";
  let some_or_zero = function
  | Some x -> x
  | None -> 0 in
  print (Lists.map some_or_zero [Some 3; None; Some 4]);
  (* caramel bug,
     function keyword combinded with regular function declaration,
     we should get a function that takes two arguments *)
  (* let some_or_default default = function
  | Some x -> x
  | None -> default in
  print (some_or_default 3 (Some 5));
  print (Lists.map (fun x -> some_or_default 100 x) [Some 3; None; Some 4]);*)
  print_string "\n"

let run () =
  variables ();
  pattern_matching_and_let ();
  anonymous_functions ();
  multiargument_functions ();
  recursive_functions ();
  prefix_and_infix_operators ();
  declaring_functions_with_function ();
  print_string "\n"
