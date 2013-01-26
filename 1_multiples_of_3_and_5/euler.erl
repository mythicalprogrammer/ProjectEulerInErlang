-module(euler).
-export([multiples/1]).

multiples(End) ->
    multiples(1, End, []).

multiples(Start, End, _) when Start > End -> [];
multiples(End, End, Acc) -> lists:sum(lists:reverse(Acc));
multiples(Start, End, Acc) when (Start rem 3) =:= 0 ->
    multiples(Start+1,End,[Start | Acc]);
multiples(Start, End, Acc) when (Start rem 5) =:= 0 ->
    multiples(Start+1,End,[Start | Acc]);
multiples(Start, End, Acc) ->
    multiples(Start+1,End,Acc).
