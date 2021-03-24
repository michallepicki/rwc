%%
-mode(compile).
main(_) ->
  lists:foreach(
    fun(Name) ->
      {ok, ModuleName, Binary} = compile:file(Name, [binary]),
      code:load_binary(ModuleName, '', Binary) end,
    ['caramel_runtime', 'my_externals', 'a_guided_tour']),
  io:format(<<"~ts">>, [<<"Sweets acquired!\n\n">>]),
  a_guided_tour:run().
