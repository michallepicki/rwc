% Source code generated with Caramel.
-module(variables_and_functions).

-export([binary_concat/2]).
-export([print/1]).
-export([print_string/1]).
-export([run/0]).

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

-spec run() -> ok.
run() ->
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
      Language_list = my_externals:string_split(Languages, <<",">>, all),
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


