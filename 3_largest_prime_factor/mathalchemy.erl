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
	sieve_eratosthenes(2,0,Max,[{X, true} || X <-lists:seq(2,1000)]).

sieve_eratosthenes(P,Icre,Max,L) ->
	true.
