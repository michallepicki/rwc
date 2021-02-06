%%
main(_) ->
  lists:foreach(
    fun(Name) ->
      {ok, ModuleName, Binary} = compile:file(Name, [binary]),
      code:load_binary(ModuleName, '', Binary) end,
    ['caramel_runtime', 'stevia', 'sweetness']),
  io:format(<<"~ts">>, [<<"Sweets acquired!\n">>]),
  sweetness:run().
