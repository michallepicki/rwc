% Source code generated with Caramel.
-module(sweetness).

-export([big_number/1]).
-export([caramel_as_a_calculator/0]).
-export([distance/2]).
-export([divide/2]).
-export([downcase_extension/1]).
-export([downcase_extension2/1]).
-export([even/1]).
-export([first_if_true/3]).
-export([functions_and_type_inference/0]).
-export([is_a_multiple/2]).
-export([lists/0]).
-export([long_string/1]).
-export([my_favorite_language/1]).
-export([my_favorite_language2/1]).
-export([options/0]).
-export([print/1]).
-export([print_string/1]).
-export([ratio/2]).
-export([remove_sequential_duplicates/1]).
-export([square/1]).
-export([string_length/1]).
-export([string_rsplit2/2]).
-export([sum/1]).
-export([sum_if_true/3]).
-export([tuples/0]).
-export([tuples_lists_options_and_pattern_matching/0]).

-spec print_string(_) -> ok.
print_string(Thing) -> io:format(<<"~ts">>, [Thing | []]).

-spec print(_) -> ok.
print(Thing) -> io:format(<<"~0tp~n">>, [Thing | []]).

-spec caramel_as_a_calculator() -> ok.
caramel_as_a_calculator() ->
  print_string(<<"caramel_as_a_calculator\n">>),
  print(erlang:'+'(3, 4)),
  print(stevia:int_div(8, 3)),
  print(stevia:float_add(3.5, 6.0)),
  print(stevia:int_div(30000000, 300000)),
  print(erlang:'>'(erlang:'*'(3, 5), 14)),
  X = erlang:'+'(3, 4),
  Y = erlang:'+'(X, X),
  X7 = erlang:'+'(3, 4),
  X_plus_y = erlang:'+'(X, Y),
  X_prime = erlang:'+'(X, 1),
  print(X),
  print(Y),
  print(X7),
  print(X_plus_y),
  print(X_prime),
  print_string(<<"\n">>).

-spec square(integer()) -> integer().
square(X) -> erlang:'*'(X, X).

-spec ratio(integer(), integer()) -> float().
ratio(X, Y) -> stevia:float_div(stevia:float_of_int(X), stevia:float_of_int(Y)).

-spec sum_if_true(fun((integer()) -> boolean()), integer(), integer()) -> integer().
sum_if_true(Test, First, Second) -> erlang:'+'(case Test(First) of
  true -> First;
  false -> 0
end, case Test(Second) of
  true -> Second;
  false -> 0
end).

-spec even(integer()) -> boolean().
even(X) -> erlang:'=:='(stevia:modulo(X, 2), 0).

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
is_a_multiple(X, Y) -> erlang:'=:='(stevia:modulo(X, Y), 0).

-spec functions_and_type_inference() -> ok.
functions_and_type_inference() ->
  print_string(<<"functions_and_type_inference\n">>),
  print(square(2)),
  print(square(square(2))),
  print(ratio(4, 7)),
  print(sum_if_true(fun even/1, 3, 4)),
  print(sum_if_true(fun even/1, 2, 4)),
  print(first_if_true(fun long_string/1, <<"short">>, <<"loooooong">>)),
  print(first_if_true(fun big_number/1, 4, 3)),
  print(is_a_multiple(8, 2)),
  print_string(<<"\n">>).

-spec distance({float(), float()}, {float(), float()}) -> float().
distance({X1, Y1}, {X2, Y2}) -> stevia:sqrt(stevia:float_add(stevia:pow(stevia:float_sub(X1, X2), 2.0), stevia:pow(stevia:float_sub(Y1, Y2), 2.0))).

-spec tuples() -> ok.
tuples() ->
  print_string(<<"tuples\n">>),
  A_tuple = {3, <<"three">>},
  Another_tuple = {3, <<"four">>, 5.0},
  {X, Y} = A_tuple,
  print(A_tuple),
  print(Another_tuple),
  print(X),
  print(Y),
  print(erlang:'+'(X, string_length(Y))),
  print(distance({12.3, -28.0}, {-10.0, 0.0})),
  print_string(<<"\n">>).

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
  print(erlang:'+'(Z, Z)),
  X = 7,
  Y = erlang:'*'(X, X),
  print(erlang:'+'(X, Y)),
  print_string(<<"\n">>).

-spec divide(integer(), integer()) -> option:t(integer()).
divide(X, Y) ->
  case erlang:'=:='(Y, 0) of
    true -> none;
    false -> {some, stevia:int_div(X, Y)}
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
    {some, {Base, Ext}} -> caramel_runtime:binary_concat(Base, caramel_runtime:binary_concat(<<".">>, stevia:string_lowercase(Ext)))
  end.

-spec downcase_extension2(binary()) -> binary().
downcase_extension2(Filename) ->
  case stevia:string_split(Filename, <<".">>, trailing) of
    [] -> Filename;
    [_ | []] -> Filename;
    [Base | [Ext | []]] -> caramel_runtime:binary_concat(Base, caramel_runtime:binary_concat(<<".">>, stevia:string_lowercase(Ext)))
  end.

-spec options() -> ok.
options() ->
  print_string(<<"options\n">>),
  print(divide(4, 2)),
  print(divide(4, 0)),
  print(lists:map(fun downcase_extension/1, [<<"Hello_World.TXT">> | [<<"Hello_World.txt">> | [<<"Hello_World">> | []]]])),
  print(lists:map(fun downcase_extension2/1, [<<"Hello_World.TXT">> | [<<"Hello_World.txt">> | [<<"Hello_World">> | []]]])),
  print_string(<<"\n">>).

-spec tuples_lists_options_and_pattern_matching() -> ok.
tuples_lists_options_and_pattern_matching() ->
  tuples(),
  lists(),
  options().


