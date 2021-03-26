let main _ =
  Lists.foreach
    (fun name ->
      let `ok, module_name, binary = Compile.file name [ `binary ] in
      Code.load_binary module_name [] binary)
    [ `caramel_runtime; `my_externals; `a_guided_tour ];
  Io.format "~ts" [ "Sweets acquired!\n\n" ];
  A_guided_tour.run ()
