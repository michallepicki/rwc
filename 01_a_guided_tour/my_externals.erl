-module(my_externals).
-export([cheat/1, pow/2, string_lowercase/1, io_get_line/1, float_of_string/1]).

cheat(X) -> X.

pow(X, Y) -> math:pow(X, Y).

string_lowercase(S) -> string:lowercase(S).

io_get_line(Prompt) ->
  case io:get_line(Prompt) of
    {error, _} -> none;
    eof        -> none;
    Data       -> {some, list_to_binary(string:trim(Data))}
  end.

float_of_string(String) -> binary_to_float(String).
