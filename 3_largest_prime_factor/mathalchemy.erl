-module('mathalchemy').
-export([prime_gen/1, prime_gen/2]).

% default algorithm to generate prime is Sieve of Eratosthenes
prime_gen(Max) ->
	sieve_eratosthenes(Max).

prime_gen(Max, Strategy) ->
	case Strategy of
		1 -> sieve_eratosthenes(Max)
    	end.

% Sieve of Eratosthenes
% 1. Create a list of consecutive integers from 2 to Max: (2,3,4,...,Max) 
% 2. Initially, let P = 2, the first prime number
% 3. Starting from P, count up in increments [Icre] of P and mark each of 
%    these numbers greater than P itself in the list. 
%    [{N,true} to {N,false}]
%    These will be multiples of P:2P,3P,4P,etc.; 
%    note - that some of them may have already been marked.
% 4. Find the first number greater than P in the list that is not marked.
%    If there was no such number, stop. Otherwise, let p now equal this
%    number (which is the next prime), and repeat from step 3.

sieve_eratosthenes(Max) ->
	% 1. Sieve of Eratosthenes - list of consecutive integers
	L = [{X, true} || X <-lists:seq(2,Max)],
	% 2. Sieve of Eratosthenes - let P = 2, the first prime number 
	sieve_eratosthenes(2,0,Max,L).

% 4. Sieve of Eratosthenes - Find the first number greater than P in the 
%    list that is not marked. If there was no such number, stop. 
%    Otherwise, let p now equal this
sieve_eratosthenes(P,_,Max,[H|T]) when P =:= Max ->
	[N || {N,true} <- T++[H]];
sieve_eratosthenes(P,Incre,Max,[{N,S}|T]) when N =:= P, Incre > 0 -> 
		sieve_eratosthenes(P+1,0,Max,T++[{N,S}]);

% 3. Starting from P, count up in increments [Incre] of P and mark each of 
%    these numbers greater than P itself in the list. 
%    [{N,true} to {N,false}]
%    These will be multiples of P:2P,3P,4P,etc.; 
%    note - that some of them may have already been marked.
sieve_eratosthenes(P,Incre,Max,[H|T]) when P =/= Max ->
	case H of
		{N,_} when P > N ->
			sieve_eratosthenes(P,Incre,Max,T++[H]);
		{_,_} when Incre =/= P ->
	  		sieve_eratosthenes(P,Incre+1,Max,T++[H]);
		{N,true} when Incre =:= P ->
			sieve_eratosthenes(P,1,Max,T++[{N,false}]);
		{_,false} when Incre =:= P ->
			sieve_eratosthenes(P,1,Max,T++[H])
	end.
