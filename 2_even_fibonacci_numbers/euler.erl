-module(euler).
-export([fib/1, fib2/1, fib3/1]).

fib(Max) ->
    fib(1,Max,[]).

fib(_,Max,Acc) when length(Acc) =:= Max ->
    lists:sum([X || X <- Acc , X rem 2 =:= 0]);
fib(N,Max,_) when N =:= 1 ->
    fib(N+2,Max,[2,N]);
fib(N,Max,[H|T]) ->
    fib(N+H,Max,[N,H|T]).

fib2(Max) ->
    fib2(1,Max,[],[]).

fib2(_,Max,[H|T],Acc2) when H >= Max ->
    Acc2;
fib2(N,Max,_,_) when N =:= 1 ->
    fib2(N+2,Max,[2,N],2);
fib2(N,Max,[H|T],Acc2) when N rem 2 =:= 0 ->
    fib2(N+H,Max,[N,H|T],Acc2+N);
fib2(N,Max,[H|T],Acc2) ->
    fib2(N+H,Max,[N,H|T],Acc2).

fib3(Max) ->
    fib3(1,Max,[],[]).

fib3(_,Max,[H|T],Acc2) when H >= Max ->
    Acc2;
fib3(N,Max,_,_) when N =:= 1 ->
    fib3(N+2,Max,[2,N],2);
fib3(N,Max,[H|T],Acc2) when N rem 2 =:= 0 ->
    fib3(N+H,Max,[N,H],Acc2+N);
fib3(N,Max,[H|T],Acc2) ->
    fib3(N+H,Max,[N,H],Acc2).
