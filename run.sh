#!/bin/sh
dir_prefix="${1:?Missing chapter number argument (e.g. 01)}"
cd "$dir_prefix"*
caramel_location=$(dirname $(which caramel))
cp "$caramel_location"/../lib/caramel/stdlib/caramel_runtime.erl caramel_runtime.erl
caramel fmt *.ml
caramel compile `caramel sort-deps *.ml` &&
  escript -c main.erl
