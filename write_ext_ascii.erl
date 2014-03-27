-module(write_ext_ascii).
-export([start/1]).

start(F) ->
  A = [],
  R = for(160, 255, A),
  file:write_file(F, list_to_binary(R)).

for(S, E, R) when S >= E -> R;
for(S, E, R) ->
  if
    S =:= 10 -> for(S + 1, E, R ++ [S]);
    true -> for(S + 1, E, R ++ [S, 10])
  end.
