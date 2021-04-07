let print_string thing = Io.format "~ts" [ thing ]

let print thing = Io.format "~0tp~n" [ thing ]

let list_basics () =
  print_string "list_basics\n";
  (* equivalent to 1 :: (2 :: (3 :: [])))
     and 1 :: 2 :: 3 :: []
     because :: is right-associative *)
  print [ 1; 2; 3 ];
  let empty = [] in
  print (3 :: empty);
  print ("three" :: empty);
  let l = [ 1; 2; 3 ] in
  print l;
  let m = 0 :: l in
  print m;
  print l;
  print_string "\n"

let rec sum l = match l with [] -> 0 | hd :: tl -> hd + sum tl

(* caramel bug! funny, the bug makes this work
   in the way the book describes it won't work...
   so we need to have a new name for to_drop in pattern match *)
(* let rec drop_value l to_drop =
  match l with
  | [] -> []
  | to_drop :: tl -> drop_value tl to_drop
  | hd :: tl -> hd :: drop_value tl to_drop *)
let rec drop_value l to_drop =
  match l with
  | [] -> []
  | renamed_to_drop :: tl -> drop_value tl renamed_to_drop
  | hd :: tl -> hd :: drop_value tl to_drop

let rec drop_value2 l to_drop =
  match l with
  | [] -> []
  | hd :: tl ->
      let new_tl = drop_value2 tl to_drop in
      if hd = to_drop then new_tl else hd :: new_tl

let rec drop_zero l =
  match l with
  | [] -> []
  | 0 :: tl -> drop_zero tl
  | hd :: tl -> hd :: drop_zero tl

let using_patterns_to_extract_data_from_a_list () =
  print_string "using_patterns_to_extract_data_from_a_list\n";
  print (sum [ 1; 2; 3 ]);
  print (sum []);
  print (drop_value [ 1; 2; 3 ] 2);
  print (drop_value2 [ 1; 2; 3 ] 2);
  print (drop_zero [ 1; 2; 0; 3 ]);
  print_string "\n"

let run () =
  list_basics ();
  using_patterns_to_extract_data_from_a_list ();
  print_string "\n"
