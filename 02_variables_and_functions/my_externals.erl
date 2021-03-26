-module(my_externals).
-export([cheat/1, string_split/3, pi/0]).

cheat(X) -> X.

string_split(S, Pattern, Where) -> string:split(S, Pattern, Where).

pi() -> math:pi().