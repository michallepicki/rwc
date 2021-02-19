let print_string thing = Io.format "~ts" [ thing ]

let print thing = Io.format "~0tp~n" [ thing ]

let caramel_as_a_calculator () =
  print_string "caramel_as_a_calculator\n" ;
  print (3 + 4) ;
  print (8 / 3) ;
  print (3.5 +. 6.) ;
  print (30_000_000 / 300_000) ;
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

let ratio x y = Erlang.float_of_int x /. Erlang.float_of_int y

(* following doesn't currently compile, open doesn't do what it should do *)
(* open Erlang
 * let ratio1 x y =
 *   (float_of_int x) /. (float_of_int y)
 *)

(* following doesn't currently compile either *)
(* let ratio2 x y =
 *   let open Erlang in
 *   (float_of_int x) /. (float_of_int y)
 *)

(* following doesn't currently compile either *)
(* let ratio3 x y =
 *   Erlang.((float_of_int x) /. (float_of_int y))
 *)

let sum_if_true test first second =
  (if test first then first else 0) + if test second then second else 0


let even x = x mod 2 = 0

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

let is_a_multiple x y = x mod y = 0

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
let distance (x1, y1) (x2, y2) =
  Math.sqrt (Stevia.pow (x1 -. x2) 2.0 +. Stevia.pow (y1 -. y2) 2.0)


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


let divide x y = if y = 0 then None else Some (x / y)

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
  match Stevia.string_split filename "." Steviatypes.Trailing with
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


type point2d = {
  x : float;
  y : float;
}

let magnitude { x = x_pos; y = y_pos } =
  Math.sqrt (Stevia.pow x_pos 2.0 +. Stevia.pow y_pos 2.0)


let magnitude2 { x; y } = Math.sqrt (Stevia.pow x 2.0 +. Stevia.pow y 2.0)

let distance2 v1 v2 = magnitude { x = v1.x -. v2.x; y = v1.y -. v2.y }

type circle_desc = {
  center : point2d;
  radius : float;
}

type rect_desc = {
  lower_left : point2d;
  width : float;
  height : float;
}

type segment_desc = {
  endpoint1 : point2d;
  endpoint2 : point2d;
}

type scene_element =
  | Circle  of circle_desc
  | Rect    of rect_desc
  | Segment of segment_desc

let is_inside_scene_element point scene_element =
  match scene_element with
    | Circle { center; radius } -> distance2 center point < radius
    | Rect { lower_left; width; height } ->
      point.x > lower_left.x
      && point.x < lower_left.x +. width
      && point.y > lower_left.y
      && point.y < lower_left.y +. height
    | Segment _ -> false


let is_inside_scene point scene =
  Lists.any (fun el -> is_inside_scene_element point el) scene


let records_and_variants () =
  print_string "records_and_variants\n" ;
  print { x = 3.0; y = -4.0 } ;
  print
    (is_inside_scene { x = 3.0; y = 7.0 }
       [ Circle { center = { x = 4.0; y = 4.0 }; radius = 0.5 } ] ) ;
  print
    (is_inside_scene { x = 3.0; y = 7.0 }
       [ Circle { center = { x = 4.0; y = 4.0 }; radius = 5.0 } ] ) ;
  print_string "\n"


(* Probably none of imperative parts of OCaml are supported in Caramel, that's
   fine *)
(* mutable declaration gets ignored *)
type running_sum = {
  mutable sum : float;
  mutable sum_sq : float;
  mutable samples : int;
}

let mean rsum = rsum.sum /. Erlang.float_of_int rsum.samples

let stdev rsum =
  Math.sqrt
    ( (rsum.sum_sq /. Erlang.float_of_int rsum.samples)
    -. Stevia.pow (rsum.sum /. Erlang.float_of_int rsum.samples) 2.0 )


let create () = { sum = 0.0; sum_sq = 0.0; samples = 0 }

(* "monadic" (?) <- does not work in caramel
 * let update rsum x =
 *   rsum.samples <- rsum.samples + 1 ;
 *   rsum.sum     <- rsum.sum +. x ;
 *   rsum.sum_sq  <- rsum.sum_sq +. (x *. x)
 *)

(* type 'a ref = { mutable contents : 'a } *)
(* let ref x = { contents = x } *)
(* let (!) r = r.contents *)
(* let (:=) r x = r.contents <- x *)
(* let sum list = *)
(* let sum = ref 0 in *)
(* List.iter list ~f:(fun x -> sum := !sum + x); *)
(* !sum *)

(*
 * let permute array =
 *   let length = Array.length array in
 *   for i = 0 to length - 2 do
 *     (* pick a j to swap with *)
 *     let j = i + Random.int (length - i) in
 *     (* Swap i and j *)
 *     let tmp = array.(i) in
 *     array.(i) <- array.(j);
 *     array.(j) <- tmp
 *   done
 *)

(* for doesn't work in caramel
 * let for_test num =
 *   for i = 0 to num - 1 do
 *     print i
 *   done
 *)

(* while doesn't work in caramel
 * let for_test num =
 *   for i = 0 to num - 1 do
 *     print i
 *   done
 *)

(* bad erlang generated by caramel, expression sequences wrapped in parentheses
   get flattened *)
let shortcircuit () =
  false
  &&
  ( print "a" ;
    true )


(* similarily here
 * let shortcircuit2 () =
 *   false
 *   &&
 *   begin
 *     print "a" ;
 *     true
 *   end
 *)

(* same issue with || probably *)

let rec read_and_accumulate accum =
  let line = Stevia.io_get_line "" in
    match line with
      | None   -> accum
      | Some x -> read_and_accumulate (accum +. Stevia.float_of_string x)


let complete_program () =
  print_string
    "Summing up total, enter floats (e.g. 3.0) in separate lines, to finish \
     use ctrl + d:\n" ;
  Io.format "Total: ~0tp~n" [ read_and_accumulate 0.0 ]


let imperative_programming () =
  print_string "imperative_programming\n" ;
  print_string
    "Probably none of imperative parts of OCaml are supported in Caramel, \
     that's fine\n" ;
  (* array literals do not compile *)
  (* print [| 1; 2; 3; 4 |] ; *)
  let rsum = create () in
    (* List.iter [1.;3.;2.;-7.;4.;5.] ~f:(fun x -> update rsum x) ;
     * print (mean rsum) ;
     * print (stdev rsum) ;
     *)
    (* there is no ref type in caramel *)
    (* let x = { contents = 0 } in
     * x.contents <- x.contents + 1 in
     * print x ; *)
    (* let x = ref 0 in
     * print !x ;
     * x := !x + 1 in
     * print !x ; *)
    (* following results in runtime crash in caramel, undefined function
       erlang:'and'/3 *)
    (* shortcircuit () ; *)
    (* shortcircuit2 () ; *)
    complete_program () ;
    print_string "\n"


let tuples_lists_options_and_pattern_matching () =
  tuples () ;
  lists () ;
  options () ;
  records_and_variants () ;
  imperative_programming ()


let run () =
  caramel_as_a_calculator () ;
  functions_and_type_inference () ;
  tuples_lists_options_and_pattern_matching ()
