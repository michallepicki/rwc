let main _ =
  Lists.foreach
    (fun name ->
      let `ok, module_name, binary = Compile.file name [ `binary ] in
      Code.load_binary module_name [] binary)
    [ `caramel_runtime; `lists_and_patterns ];
  Io.format "~ts" [ "Sweets acquired!\n\n" ];
  Lists_and_patterns.run ()
