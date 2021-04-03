#!/bin/sh
dir_prefix="${1:?Missing chapter number argument (e.g. 01)}"
[ -d $dir_prefix ] && cd $dir_prefix || cd "$dir_prefix"*
caramel_location=$(dirname $(which caramel))
rm build/*
cp "$caramel_location"/../lib/caramel/stdlib/caramel_runtime.erl build/caramel_runtime.erl
cp *.ml build/
cp *.erl build/
cd build
caramel compile `caramel sort-deps *.ml` &&
  escript -c main.erl
