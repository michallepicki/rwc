% Source code generated with Caramel.
-module(main).

-export([main/1]).

-spec main(_) -> ok.
main(_) ->
  lists:foreach(fun
  (Name) ->
  {ok, Module_name, Binary} = compile:file(Name, [binary | []]),
  code:load_binary(Module_name, [], Binary)
end, [caramel_runtime | [lists_and_patterns | []]]),
  io:format(<<"~ts">>, [<<"Sweets acquired!\n\n">> | []]),
  lists_and_patterns:run().


