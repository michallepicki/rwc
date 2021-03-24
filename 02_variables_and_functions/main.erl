%%
-mode(compile).
main(_) ->
  lists:foreach(
    fun(Name) ->
      {ok, ModuleName, Binary} = compile:file(Name, [binary]),
      code:load_binary(ModuleName, '', Binary) end,
    ['caramel_runtime', 'my_externals', 'variables_and_functions']),
  io:format(<<"~ts">>, [<<"Sweets acquired!\n\n">>]),
  variables_and_functions:run().
