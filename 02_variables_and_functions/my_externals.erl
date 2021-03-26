-module(my_externals).
-export([cheat/1, pi/0, string_uppercase/1]).

cheat(X) -> X.

pi() -> math:pi().

string_uppercase(S) -> string:uppercase(S).
