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
  Languages = <<"OCaml,Perl,C++,C">>,
  Dashed_languages = begin
    Language_list = my_externals:string_split(Languages, <<",">>, all),
    binary_concat(Language_list, <<"-">>)
  end,
  begin
    print(Dashed_languages),
    print_string(<<"\n">>)
  end.


