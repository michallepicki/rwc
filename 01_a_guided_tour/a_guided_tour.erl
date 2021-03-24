% Source code generated with Caramel.
-module(a_guided_tour).
-export_type([circle_desc/0]).
-export_type([point2d/0]).
-export_type([rect_desc/0]).
-export_type([running_sum/0]).
-export_type([scene_element/0]).
-export_type([segment_desc/0]).

-export([big_number/1]).
-export([caramel_as_a_calculator/0]).
-export([complete_program/0]).
-export([create/0]).
-export([distance/2]).
-export([distance2/2]).
-export([divide/2]).
-export([downcase_extension/1]).
-export([downcase_extension2/1]).
-export([even/1]).
-export([first_if_true/3]).
-export([functions_and_type_inference/0]).
-export([imperative_programming/0]).
-export([is_a_multiple/2]).
-export([is_inside_scene/2]).
-export([is_inside_scene_element/2]).
-export([lists/0]).
-export([long_string/1]).
-export([magnitude/1]).
-export([magnitude2/1]).
-export([mean/1]).
-export([my_favorite_language/1]).
-export([my_favorite_language2/1]).
-export([options/0]).
-export([print/1]).
-export([print_string/1]).
-export([ratio/2]).
-export([read_and_accumulate/1]).
-export([records_and_variants/0]).
-export([remove_sequential_duplicates/1]).
-export([run/0]).
-export([shortcircuit/0]).
-export([square/1]).
-export([stdev/1]).
-export([string_length/1]).
-export([string_rsplit2/2]).
-export([sum/1]).
-export([sum_if_true/3]).
-export([sum_if_true2/3]).
-export([tuples/0]).
-export([tuples_lists_options_and_pattern_matching/0]).

-type point2d() :: #{ x => float()
                    , y => float()
                    }.

-type circle_desc() :: #{ center => point2d()
                        , radius => float()
                        }.

-type rect_desc() :: #{ lower_left => point2d()
                      , width => float()
                      , height => float()
                      }.

-type segment_desc() :: #{ endpoint1 => point2d()
                         , endpoint2 => point2d()
                         }.

-type scene_element() :: {circle, circle_desc()}
                       | {rect, rect_desc()}
                       | {segment, segment_desc()}
                       .

-type running_sum() :: #{ sum => float()
                        , sum_sq => float()
                        , samples => integer()
                        }.

-spec print_string(_) -> ok.
print_string(Thing) -> io:format(<<"~ts">>, [Thing | []]).

-spec print(_) -> ok.
print(Thing) -> io:format(<<"~0tp~n">>, [Thing | []]).

-spec caramel_as_a_calculator() -> ok.
caramel_as_a_calculator() ->
  print_string(<<"caramel_as_a_calculator\n">>),
  print(erlang:'+'(3, 4)),
  print(erlang:'div'(8, 3)),
  print(erlang:'+'(3.5, 6.0)),
  print(erlang:'div'(30000000, 300000)),
  print(erlang:'>'(erlang:'*'(3, 5), 14)),
  X = erlang:'+'(3, 4),
  Y = erlang:'+'(X, X),
  X7 = erlang:'+'(3, 4),
  X_plus_y = erlang:'+'(X, Y),
  X_prime = erlang:'+'(X, 1),
  begin
    print(X),
    print(Y),
    print(X7),
    print(X_plus_y),
    print(X_prime),
    print_string(<<"\n">>)
  end.

-spec square(integer()) -> integer().
square(X) -> erlang:'*'(X, X).

-spec ratio(integer(), integer()) -> float().
ratio(X, Y) -> erlang:'/'(erlang:float(X), erlang:float(Y)).

-spec sum_if_true(fun((integer()) -> boolean()), integer(), integer()) -> integer().
sum_if_true(Test, First, Second) -> erlang:'+'(case Test(First) of
  true -> First;
  false -> 0
end, case Test(Second) of
  true -> Second;
  false -> 0
end).

-spec even(integer()) -> boolean().
even(X) -> erlang:'=:='(erlang:'rem'(X, 2), 0).

-spec sum_if_true2(fun((integer()) -> boolean()), integer(), integer()) -> integer().
sum_if_true2(Test, X, Y) -> erlang:'+'(case Test(X) of
  true -> X;
  false -> 0
end, case Test(Y) of
  true -> Y;
  false -> 0
end).

-spec first_if_true(fun((A) -> boolean()), A, A) -> A.
first_if_true(Test, X, Y) ->
  case Test(X) of
    true -> X;
    false -> Y
  end.

-spec string_length(binary()) -> integer().
string_length(S) -> erlang:length(binary:bin_to_list(S)).

-spec long_string(binary()) -> boolean().
long_string(S) -> erlang:'>'(string_length(S), 6).

-spec big_number(integer()) -> boolean().
big_number(X) -> erlang:'>'(X, 3).

-spec is_a_multiple(integer(), integer()) -> boolean().
is_a_multiple(X, Y) -> erlang:'=:='(erlang:'rem'(X, Y), 0).

-spec functions_and_type_inference() -> ok.
functions_and_type_inference() ->
  print_string(<<"functions_and_type_inference\n">>),
  print(square(2)),
  print(square(square(2))),
  print(ratio(4, 7)),
  print(sum_if_true(fun even/1, 3, 4)),
  print(sum_if_true(fun even/1, 2, 4)),
  print(sum_if_true2(fun even/1, 3, 4)),
  print(sum_if_true2(fun even/1, 2, 4)),
  print(first_if_true(fun long_string/1, <<"short">>, <<"loooooong">>)),
  print(first_if_true(fun big_number/1, 4, 3)),
  print(is_a_multiple(8, 2)),
  print_string(<<"\n">>).

-spec distance({float(), float()}, {float(), float()}) -> float().
distance({X1, Y1}, {X2, Y2}) -> math:sqrt(erlang:'+'(my_externals:pow(erlang:'-'(X1, X2), 2.0), my_externals:pow(erlang:'-'(Y1, Y2), 2.0))).

-spec tuples() -> ok.
tuples() ->
  print_string(<<"tuples\n">>),
  A_tuple = {3, <<"three">>},
  Another_tuple = {3, <<"four">>, 5.0},
  {X, Y} = A_tuple,
  begin
    print(A_tuple),
    print(Another_tuple),
    print(X),
    print(Y),
    print(erlang:'+'(X, string_length(Y))),
    print(distance({12.3, -28.0}, {-10.0, 0.0})),
    print_string(<<"\n">>)
  end.

-spec my_favorite_language(list(A)) -> A.
my_favorite_language([My_favorite | The_rest]) -> My_favorite.

-spec my_favorite_language2(list(binary())) -> binary().
my_favorite_language2(Languages) ->
  case Languages of
    [First | The_rest] -> First;
    [] -> <<"Caramel">>
  end.

-spec sum(list(integer())) -> integer().
sum(L) ->
  case L of
    [] -> 0;
    [Hd | Tl] -> erlang:'+'(Hd, sum(Tl))
  end.

-spec remove_sequential_duplicates(list(A)) -> list(A).
remove_sequential_duplicates(List) ->
  case List of
    [] -> [];
    [Hd | []] -> [Hd | []];
    [First | [Second | Tl]] -> New_tl = remove_sequential_duplicates([Second | Tl]),
case erlang:'=:='(First, Second) of
  true -> New_tl;
  false -> [First | New_tl]
end
  end.

-spec lists() -> ok.
lists() ->
  print_string(<<"lists\n">>),
  Languages = [<<"Caramel">> | [<<"Perl">> | [<<"C">> | []]]],
  begin
    print(Languages),
    print(erlang:length(Languages)),
    print(lists:map(fun string_length/1, Languages)),
    print([<<"French">> | [<<"Spanish">> | Languages]]),
    print(Languages),
    print([{<<"Caramel">>, <<"Perl">>, <<"C">>} | []]),
    print({1, 2, 3}),
    print([1 | [2 | [3 | []]]]),
    print(erlang:'++'([1 | [2 | [3 | []]]], [4 | [5 | [6 | []]]])),
    print(my_favorite_language([<<"English">> | [<<"Spanish">> | [<<"French">> | []]]])),
    print(my_favorite_language2([<<"English">> | [<<"Spanish">> | [<<"French">> | []]]])),
    print(my_favorite_language2([])),
    print(sum([1 | [2 | [3 | []]]])),
    print(remove_sequential_duplicates([1 | [1 | [2 | [3 | [3 | [4 | [4 | [1 | [1 | [1 | []]]]]]]]]]])),
    Z = 7,
    begin
      print(erlang:'+'(Z, Z)),
      X = 7,
      Y = erlang:'*'(X, X),
      begin
        print(erlang:'+'(X, Y)),
        print_string(<<"\n">>)
      end
    end
  end.

-spec divide(integer(), integer()) -> option:t(integer()).
divide(X, Y) ->
  case erlang:'=:='(Y, 0) of
    true -> none;
    false -> {some, erlang:'div'(X, Y)}
  end.

-spec string_rsplit2(binary(), char()) -> option:t({binary(), binary()}).
string_rsplit2(S, C) ->
  Characters_reversed = lists:reverse(binary:bin_to_list(S)),
  Not_c = fun
    (X) -> erlang:'=/='(X, C)
  end,
  case lists:splitwith(Not_c, Characters_reversed) of
    {_, []} -> none;
    {Ext_reversed, [C | Base_reversed]} -> Base = binary:list_to_bin(lists:reverse(Base_reversed)),
Ext = binary:list_to_bin(lists:reverse(Ext_reversed)),
{some, {Base, Ext}}
  end.

-spec downcase_extension(binary()) -> binary().
downcase_extension(Filename) ->
  case string_rsplit2(Filename, '.') of
    none -> Filename;
    {some, {Base, Ext}} -> caramel_runtime:binary_concat(Base, caramel_runtime:binary_concat(<<".">>, my_externals:string_lowercase(Ext)))
  end.

-spec downcase_extension2(binary()) -> binary().
downcase_extension2(Filename) ->
  case my_externals:string_split(Filename, <<".">>, trailing) of
    [] -> Filename;
    [_ | []] -> Filename;
    [Base | [Ext | []]] -> caramel_runtime:binary_concat(Base, caramel_runtime:binary_concat(<<".">>, my_externals:string_lowercase(Ext)))
  end.

-spec options() -> ok.
options() ->
  print_string(<<"options\n">>),
  print(divide(4, 2)),
  print(divide(4, 0)),
  print(lists:map(fun downcase_extension/1, [<<"Hello_World.TXT">> | [<<"Hello_World.txt">> | [<<"Hello_World">> | []]]])),
  print(lists:map(fun downcase_extension2/1, [<<"Hello_World.TXT">> | [<<"Hello_World.txt">> | [<<"Hello_World">> | []]]])),
  print_string(<<"\n">>).

-spec magnitude(point2d()) -> float().
magnitude(#{ x := X_pos, y := Y_pos }) -> math:sqrt(erlang:'+'(my_externals:pow(X_pos, 2.0), my_externals:pow(Y_pos, 2.0))).

-spec magnitude2(point2d()) -> float().
magnitude2(#{ x := X, y := Y }) -> math:sqrt(erlang:'+'(my_externals:pow(X, 2.0), my_externals:pow(Y, 2.0))).

-spec distance2(point2d(), point2d()) -> float().
distance2(V1, V2) -> magnitude(#{ x => erlang:'-'(maps:get(x, V1), maps:get(x, V2))
 , y => erlang:'-'(maps:get(y, V1), maps:get(y, V2))
 }).

-spec is_inside_scene_element(point2d(), scene_element()) -> boolean().
is_inside_scene_element(Point, Scene_element) ->
  case Scene_element of
    {circle, #{ center := Center, radius := Radius }} -> erlang:'<'(distance2(Center, Point), Radius);
    {rect, #{ lower_left := Lower_left, width := Width, height := Height }} -> erlang:'and'(erlang:'>'(maps:get(x, Point), maps:get(x, Lower_left)), erlang:'and'(erlang:'<'(maps:get(x, Point), erlang:'+'(maps:get(x, Lower_left), Width)), erlang:'and'(erlang:'>'(maps:get(y, Point), maps:get(y, Lower_left)), erlang:'<'(maps:get(y, Point), erlang:'+'(maps:get(y, Lower_left), Height)))));
    {segment, _} -> false
  end.

-spec is_inside_scene(point2d(), list(scene_element())) -> boolean().
is_inside_scene(Point, Scene) -> lists:any(fun
  (El) -> is_inside_scene_element(Point, El)
end, Scene).

-spec records_and_variants() -> ok.
records_and_variants() ->
  print_string(<<"records_and_variants\n">>),
  print(#{ x => 3.0
 , y => -4.0
 }),
  print(is_inside_scene(#{ x => 3.0
 , y => 7.0
 }, [{circle, #{ center => #{ x => 4.0
 , y => 4.0
 }
 , radius => 0.5
 }} | []])),
  print(is_inside_scene(#{ x => 3.0
 , y => 7.0
 }, [{circle, #{ center => #{ x => 4.0
 , y => 4.0
 }
 , radius => 5.0
 }} | []])),
  print_string(<<"\n">>).

-spec mean(running_sum()) -> float().
mean(Rsum) -> erlang:'/'(maps:get(sum, Rsum), erlang:float(maps:get(samples, Rsum))).

-spec stdev(running_sum()) -> float().
stdev(Rsum) -> math:sqrt(erlang:'-'(erlang:'/'(maps:get(sum_sq, Rsum), erlang:float(maps:get(samples, Rsum))), my_externals:pow(erlang:'/'(maps:get(sum, Rsum), erlang:float(maps:get(samples, Rsum))), 2.0))).

-spec create() -> running_sum().
create() ->
  #{ sum => 0.0
   , sum_sq => 0.0
   , samples => 0
   }.

-spec shortcircuit() -> boolean().
shortcircuit() -> erlang:'and'(false, begin
  print(<<"a">>),
  true
end).

-spec read_and_accumulate(float()) -> float().
read_and_accumulate(Accum) ->
  Line = my_externals:io_get_line(<<"">>),
  case Line of
    none -> Accum;
    {some, X} -> read_and_accumulate(erlang:'+'(Accum, my_externals:float_of_string(X)))
  end.

-spec complete_program() -> ok.
complete_program() ->
  print_string(<<"Summing up total, enter floats (e.g. 3.0) in separate lines, to finish use ctrl + d:\n">>),
  io:format(<<"Total: ~0tp~n">>, [read_and_accumulate(0.0) | []]).

-spec imperative_programming() -> ok.
imperative_programming() ->
  print_string(<<"imperative_programming\n">>),
  print_string(<<"Probably none of imperative parts of OCaml are supported in Caramel, that's fine\n">>),
  Rsum = create(),
  begin
    shortcircuit(),
    complete_program(),
    print_string(<<"\n">>)
  end.

-spec tuples_lists_options_and_pattern_matching() -> ok.
tuples_lists_options_and_pattern_matching() ->
  tuples(),
  lists(),
  options(),
  records_and_variants(),
  imperative_programming().

-spec run() -> ok.
run() ->
  caramel_as_a_calculator(),
  functions_and_type_inference(),
  tuples_lists_options_and_pattern_matching().


