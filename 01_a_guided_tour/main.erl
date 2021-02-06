%%
main(_) ->
  lists:foreach(
    fun(Name) ->
      {ok, ModuleName, Binary} = compile:file(Name, [binary]),
      code:load_binary(ModuleName, '', Binary) end,
    ['caramel_runtime', 'stevia', 'sweetness']),
  sweetness:caramel_as_a_calculator(),
  sweetness:functions_and_type_inference(),
  sweetness:tuples_lists_options_and_pattern_matching().
