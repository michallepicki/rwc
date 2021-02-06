let print_string thing = Io.format "~ts" [ thing ]

let print thing = Io.format "~0tp~n" [ thing ]

let caramel_as_a_calculator () =
  print_string "caramel_as_a_calculator\n" ;
  print (3 + 4) ;
  (* following has wrong result, should be 2 *)
  (* print (8 / 3) ; *)
  print (Stevia.int_div 8 3) ;
  (* following doesn't currently compile for two reasons, +. is not defined and
     6. is not valid erlang *)
  (* print (3.5 +. 6.) ; *)
  print (Stevia.float_add 3.5 6.0) ;
  (* following has wrong result, should be 100 not 100.0 *)
  (* print (30_000_000 / 300_000) ; *)
  print (Stevia.int_div 30_000_000 300_000) ;
  print (3 * 5 > 14) ;
  let x = 3 + 4 in
  let y = x + x in
  let x7 = 3 + 4 in
  let x_plus_y = x + y in
  let x' = x + 1 in
    print x ;
    print y ;
    print x7 ;
    print x_plus_y ;
    print x' ;
    print_string "\n"


let square x = x * x

(* following doesn't currently compile, /. and float_of_int don't work *)
(* let ratio0 x y =
 *   float_of_int x /. float_of_int y
 *)

(* following doesn't currently compile, open doesn't do what it should do *)
(* open Stevia
 * let ratio1 x y =
 *   float_div (float_of_int x) (float_of_int y)
 *)

(* following doesn't currently compile either *)
(* let ratio2 x y =
 *   let open Stevia in
 *   float_div (float_of_int x) (float_of_int y)
 *)

(* following doesn't currently compile either *)
(* let ratio3 x y =
 *   Stevia.(float_div (float_of_int x) (float_of_int y))
 *)

let ratio x y = Stevia.float_div (Stevia.float_of_int x) (Stevia.float_of_int y)

let sum_if_true test first second =
  (if test first then first else 0) + if test second then second else 0


(* book has % but that doesn't work, caramel stdlib has mod but it doesn't work *)
let even x = Stevia.modulo x 2 = 0

(* following doesn't currently compile because of type annotations not being supported?
 * which is weird because the caramel manual suggests adding annotations sometimes for clarity
 *)
(*  let sum_if_true2 (test : int -> bool) (x : int) (y : int) : int =
 *  (if test x then x else 0)
 *  + (if test y then y else 0)
 *)

let first_if_true test x y = if test x then x else y

let string_length s = Erlang.length (Binary.bin_to_list s)

let long_string s = string_length s > 6

let big_number x = x > 3

let is_a_multiple x y = Stevia.modulo x y = 0

let functions_and_type_inference () =
  print_string "functions_and_type_inference\n" ;
  print (square 2) ;
  print (square (square 2)) ;
  print (ratio 4 7) ;
  print (sum_if_true even 3 4) ;
  print (sum_if_true even 2 4) ;
  print (first_if_true long_string "short" "loooooong") ;
  print (first_if_true big_number 4 3) ;
  print (is_a_multiple 8 2) ;
  print_string "\n"


(* book has **. but that doesn't work, caramel stdlib has ** but that doesn't
   work *)
(* caramel -. doesn't work *)
(* caramel sqrt doesn't work *)
let distance (x1, y1) (x2, y2) =
  Stevia.sqrt
    (Stevia.float_add
       (Stevia.pow (Stevia.float_sub x1 x2) 2.0)
       (Stevia.pow (Stevia.float_sub y1 y2) 2.0) )


let tuples () =
  print_string "tuples\n" ;
  let a_tuple = (3, "three") in
  let another_tuple = (3, "four", 5.0) in
  let (x, y) = a_tuple in
    print a_tuple ;
    print another_tuple ;
    print x ;
    print y ;
    print (x + string_length y) ;
    print (distance (12.3, -28.0) (-10.0, 0.0)) ;
    print_string "\n"


let my_favorite_language (my_favorite :: the_rest) = my_favorite

let my_favorite_language2 languages =
  match languages with
    | first :: the_rest -> first
    | []                -> "Caramel"


let rec sum l =
  match l with
    | []       -> 0
    | hd :: tl -> hd + sum tl


let rec remove_sequential_duplicates list =
  match list with
    | []                    -> []
    | [ hd ]                -> [ hd ]
    | first :: second :: tl ->
      let new_tl = remove_sequential_duplicates (second :: tl) in
        if first = second then new_tl else first :: new_tl


let lists () =
  print_string "lists\n" ;
  let languages = [ "Caramel"; "Perl"; "C" ] in
    print languages ;
    print (Erlang.length languages) ;
    print (Lists.map string_length languages) ;
    print ("French" :: "Spanish" :: languages) ;
    print languages ;
    (* formatter turns [ "Caramel", "Perl", "C" ] to following *)
    print [ ("Caramel", "Perl", "C") ] ;
    print (1, 2, 3) ;
    print [ 1; 2; 3 ] ;
    (* formatter turns following examples to above representation
     * print (1 :: (2 :: (3 :: []))) ;
     * print (1 :: 2 :: 3 :: []) ;
     *)
    print ([ 1; 2; 3 ] @ [ 4; 5; 6 ]) ;
    print (my_favorite_language [ "English"; "Spanish"; "French" ]) ;
    print (my_favorite_language2 [ "English"; "Spanish"; "French" ]) ;
    print (my_favorite_language2 []) ;
    print (sum [ 1; 2; 3 ]) ;
    print (remove_sequential_duplicates [ 1; 1; 2; 3; 3; 4; 4; 1; 1; 1 ]) ;
    let z = 7 in
      print (z + z) ;
      let x = 7 in
      let y = x * x in
        print (x + y) ;
        print_string "\n"


let divide x y = if y = 0 then None else Some (Stevia.int_div x y)

let string_rsplit2 s c =
  let characters_reversed = Lists.reverse (Binary.bin_to_list s) in
  let not_c x = x <> c in
    match Lists.splitwith not_c characters_reversed with
      | (_, []) -> None
      | (ext_reversed, c :: base_reversed) ->
        let base = Binary.list_to_bin (Lists.reverse base_reversed) in
        let ext = Binary.list_to_bin (Lists.reverse ext_reversed) in
          Some (base, ext)


let downcase_extension filename =
  match string_rsplit2 filename '.' with
    | None             -> filename
    | Some (base, ext) -> base ^ "." ^ Stevia.string_lowercase ext


let downcase_extension2 filename =
  match Stevia.string_split filename "." Oof.Trailing with
    | []            -> filename
    | [ _ ]         -> filename
    | [ base; ext ] -> base ^ "." ^ Stevia.string_lowercase ext


let options () =
  print_string "options\n" ;
  print (divide 4 2) ;
  print (divide 4 0) ;
  print
    (Lists.map downcase_extension
       [ "Hello_World.TXT"; "Hello_World.txt"; "Hello_World" ] ) ;

  print
    (Lists.map downcase_extension2
       [ "Hello_World.TXT"; "Hello_World.txt"; "Hello_World" ] ) ;
  print_string "\n"


let tuples_lists_options_and_pattern_matching () =
  tuples () ;
  lists () ;
  options ()
