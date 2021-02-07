-module(stevia).
-export([cheat/1, string_split/3]).

cheat(X) -> X.

string_split(S, Pattern, Where) -> string:split(S, Pattern, Where).
