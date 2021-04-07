% Source code generated with Caramel.
-module(lists_and_patterns).

-export([drop_value/2]).
-export([drop_value2/2]).
-export([drop_zero/1]).
-export([list_basics/0]).
-export([print/1]).
-export([print_string/1]).
-export([run/0]).
-export([sum/1]).
-export([using_patterns_to_extract_data_from_a_list/0]).

-spec print_string(_) -> ok.
print_string(Thing) -> io:format(<<"~ts">>, [Thing | []]).

-spec print(_) -> ok.
print(Thing) -> io:format(<<"~0tp~n">>, [Thing | []]).

-spec list_basics() -> ok.
list_basics() ->
  print_string(<<"list_basics\n">>),
  print([1 | [2 | [3 | []]]]),
  Empty = [],
  begin
    print([3 | Empty]),
    print([<<"three">> | Empty]),
    L = [1 | [2 | [3 | []]]],
    begin
      print(L),
      M = [0 | L],
      begin
        print(M),
        print(L),
        print_string(<<"\n">>)
      end
    end
  end.

-spec sum(list(integer())) -> integer().
sum(L) ->
  case L of
    [] -> 0;
    [Hd | Tl] -> erlang:'+'(Hd, sum(Tl))
  end.

-spec drop_value(list(A), A) -> list(A).
drop_value(L, To_drop) ->
  case L of
    [] -> [];
    [Renamed_to_drop | Tl] -> drop_value(Tl, Renamed_to_drop);
    [Hd | Tl] -> [Hd | drop_value(Tl, To_drop)]
  end.

-spec drop_value2(list(A), A) -> list(A).
drop_value2(L, To_drop) ->
  case L of
    [] -> [];
    [Hd | Tl] -> New_tl = drop_value2(Tl, To_drop),
case erlang:'=:='(Hd, To_drop) of
  true -> New_tl;
  false -> [Hd | New_tl]
end
  end.

-spec drop_zero(list(integer())) -> list(integer()).
drop_zero(L) ->
  case L of
    [] -> [];
    [0 | Tl] -> drop_zero(Tl);
    [Hd | Tl] -> [Hd | drop_zero(Tl)]
  end.

-spec using_patterns_to_extract_data_from_a_list() -> ok.
using_patterns_to_extract_data_from_a_list() ->
  print_string(<<"using_patterns_to_extract_data_from_a_list\n">>),
  print(sum([1 | [2 | [3 | []]]])),
  print(sum([])),
  print(drop_value([1 | [2 | [3 | []]]], 2)),
  print(drop_value2([1 | [2 | [3 | []]]], 2)),
  print(drop_zero([1 | [2 | [0 | [3 | []]]]])),
  print_string(<<"\n">>).

-spec run() -> ok.
run() ->
  list_basics(),
  using_patterns_to_extract_data_from_a_list(),
  print_string(<<"\n">>).


