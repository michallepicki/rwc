-module(my_externals).
-export([cheat/1, int_div/2, modulo/2, float_of_int/1, float_to_int/1, float_add/2, float_sub/2, float_mul/2, float_div/2, sqrt/1, pow/2, string_split/3, string_lowercase/1, io_get_line/1, float_of_string/1]).

cheat(X) -> X.

int_div(X, Y) -> X div Y.

modulo(X, Y) -> X rem Y.

float_of_int(X) -> X.

float_to_int(X) -> trunc(X).

float_add(X, Y) -> X + Y.

float_sub(X, Y) -> X - Y.

float_mul(X, Y) -> X * Y.

float_div(X, Y) -> X / Y.

sqrt(X) -> math:sqrt(X).

pow(X, Y) -> math:pow(X, Y).

string_split(S, Pattern, Where) -> string:split(S, Pattern, Where).

string_lowercase(S) -> string:lowercase(S).

io_get_line(Prompt) ->
  case io:get_line(Prompt) of
    {error, _} -> none;
    eof        -> none;
    Data       -> {some, list_to_binary(string:trim(Data))}
  end.

float_of_string(String) -> binary_to_float(String).
