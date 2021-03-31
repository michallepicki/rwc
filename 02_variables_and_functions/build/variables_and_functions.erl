% Source code generated with Caramel.
-module(variables_and_functions).

-export([anonymous_functions/0]).
-export([binary_concat/2]).
-export([is_even/1]).
-export([is_odd/1]).
-export([multiargument_functions/0]).
-export([pattern_matching_and_let/0]).
-export([prefix_and_infix_operators/0]).
-export([print/1]).
-export([print_string/1]).
-export([recursive_functions/0]).
-export([run/0]).
-export([variables/0]).

-spec print_string(_) -> ok.
print_string(Thing) -> io:format(<<"~ts">>, [Thing | []]).

-spec print(_) -> ok.
print(Thing) -> io:format(<<"~0tp~n">>, [Thing | []]).

-spec binary_concat(list(binary()), binary()) -> binary().
binary_concat(Binaries, Joiner) ->
  Join = fun
    (Elem, Acc) -> caramel_runtime:binary_concat(Acc, Elem)
  end,
  lists:foldl(Join, <<"">>, lists:join(Joiner, Binaries)).

-spec variables() -> ok.
variables() ->
  print_string(<<"variables\n">>),
  X = 3,
  Y = 4,
  Z = erlang:'+'(X, Y),
  begin
    print(X),
    print(Y),
    print(Z),
    Languages = <<"OCaml,Perl,C++,C">>,
    Dashed_languages = begin
      Language_list = binary:split(Languages, [<<",">> | []], [global | []]),
      binary_concat(Language_list, <<"-">>)
    end,
    begin
      print(Dashed_languages),
      Area_of_ring = fun
        (Inner_radius, Outer_radius) ->
  Pi = my_externals:pi(),
  Area_of_circle = fun
    (R) -> erlang:'*'(erlang:'*'(Pi, R), R)
  end,
  erlang:'-'(Area_of_circle(Outer_radius), Area_of_circle(Inner_radius))
      end,
      begin
        print(Area_of_ring(1.0, 3.0)),
        print_string(<<"\n">>)
      end
    end
  end.

-spec pattern_matching_and_let() -> ok.
pattern_matching_and_let() ->
  print_string(<<"pattern_matching_and_let\n">>),
  {Ints, Strings} = lists:unzip([{1, <<"one">>} | [{2, <<"two">>} | [{3, <<"three">>} | []]]]),
  begin
    print(Ints),
    print(Strings),
    Upcase_first_entry = fun
      (Line) ->
  case binary:split(Line, [<<",">> | []], [global | []]) of
    [First | Rest] -> binary_concat([my_externals:string_uppercase(First) | Rest], <<",">>)
  end
    end,
    begin
      print(Upcase_first_entry(<<"one,two,three">>)),
      print(Upcase_first_entry(<<"">>)),
      print_string(<<"\n">>)
    end
  end.

-spec anonymous_functions() -> ok.
anonymous_functions() ->
  print_string(<<"anonymous_functions\n">>),
  print(fun
  (X) -> erlang:'+'(X, 1)
end(7)),
  print(lists:map(fun
  (X) -> erlang:'+'(X, 1)
end, [1 | [2 | [3 | []]]])),
  Transforms = [fun my_externals:string_uppercase/1 | [fun my_externals:string_lowercase/1 | []]],
  begin
    print(lists:map(fun
  (G) -> G(<<"Hello World">>)
end, Transforms)),
    Plusone = fun
      (X) -> erlang:'+'(X, 1)
    end,
    begin
      print(Plusone(3)),
      print(fun
  (X) -> erlang:'+'(X, 1)
end(7)),
      print_string(<<"\n">>)
    end
  end.

-spec multiargument_functions() -> ok.
multiargument_functions() ->
  print_string(<<"multiargument_functions\n">>),
  X = 7,
  begin
    print(erlang:'+'(X, 1)),
    Abs_diff = fun
      (X, Y) -> erlang:abs(erlang:'-'(X, Y))
    end,
    begin
      print(Abs_diff(3, 4)),
      Abs_diff2 = fun
        ({X, Y}) -> erlang:abs(erlang:'-'(X, Y))
      end,
      begin
        print(Abs_diff2({3, 4})),
        print_string(<<"\n">>)
      end
    end
  end.

-spec is_odd(integer()) -> boolean().
is_odd(X) ->
  case erlang:'=:='(X, 0) of
    true -> false;
    false -> is_even(erlang:'-'(X, 1))
  end.

-spec is_even(integer()) -> boolean().
is_even(X) ->
  case erlang:'=:='(X, 0) of
    true -> true;
    false -> is_odd(erlang:'-'(X, 1))
  end.

-spec recursive_functions() -> ok.
recursive_functions() ->
  print_string(<<"recursive functions\n">>),
  print(lists:map(fun is_even/1, [0 | [1 | [2 | [3 | [4 | [5 | []]]]]]])),
  print(lists:map(fun is_odd/1, [0 | [1 | [2 | [3 | [4 | [5 | []]]]]]])),
  print_string(<<"\n">>).

-spec prefix_and_infix_operators() -> ok.
prefix_and_infix_operators() ->
  print_string(<<"prefix_and_infix_operators\n">>),
  print(my_externals:max(3, 4)),
  print(erlang:'+'(3, 4)),
  print(my_externals:max(3, -4)),
  Path = <<"/usr/bin:/usr/local/bin:/bin:/sbin:/usr/bin">>,
  Split_path = binary:split(Path, [<<":">> | []], [global | []]),
  Deduped_path = my_externals:lists_usort(Split_path),
  begin
    lists:foreach(fun print/1, Deduped_path),
    lists:foreach(fun print/1, [<<"Two">> | [<<"lines">> | []]]),
    print_string(<<"\n">>)
  end.

-spec run() -> ok.
run() ->
  variables(),
  pattern_matching_and_let(),
  anonymous_functions(),
  multiargument_functions(),
  recursive_functions(),
  prefix_and_infix_operators(),
  print_string(<<"\n">>).


