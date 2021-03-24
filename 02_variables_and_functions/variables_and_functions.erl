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
  Myjoin = fun
    (Elem, Acc) -> caramel_runtime:binary_concat(Acc, Elem)
  end,
  lists:foldl(Myjoin, <<"">>, lists:join(Joiner, Binaries)).

-spec run() -> ok.
run() ->
  print_string(<<"variables\n">>),
  Languages = <<"OCaml,Perl,C++,C">>,
  Language_list = my_externals:string_split(Languages, <<",">>, all),
  Dashed_languages = binary_concat(Language_list, <<"-">>),
  begin
    print_string(Dashed_languages),
    print_string(<<"\n">>),
    print_string(<<"\n">>)
  end.


