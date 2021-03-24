% Source code generated with Caramel.
-module(my_types).
-export_type([string_split_opt/0]).


-type string_split_opt() :: leading
                          | trailing
                          | all
                          .


