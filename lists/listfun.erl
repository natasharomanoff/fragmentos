-module(listfun).
-export([head/1, 
	     tail/1,
	     sum/1,
	     sum1/1,
	     product/1]).

head([]) -> error("head of empty list");
head([H|_]) -> H.

tail([]) -> error({unsupportedOperation, "tail of empty list"});
tail([_|T]) -> T.

sum([]) -> 0;
sum([H|T]) -> H + sum(T).


%% Tail recursive sum

sum1(L) -> sum1(L, 0).

sum1([H|T], Acc) -> sum1(T, Acc + H);
sum1([], Acc) -> Acc.


%% Tail recursive product

product(L) -> product(L, 1).

product([H|T], Acc) -> product(T, Acc * H);
product([], Acc) -> Acc.

%% All
%% returns true if predicate returns true for all 
%% elements in the given List, otherwise false.


%% Any
%% returns true if predicate returns true for at 
%% least one element in the given List.

%% dropwhile
%% Drops elements from given List while predicate returns true 
%% and returns the remaining list.

%% filter
%% returns a list of all elements in the given List for which 
%% predicate returns true.

%% map
%% Takes a function from As to Bs, and a list of As and produces 
%% a list of Bs by applying the function to every element in the list. 
%% This function is used to obtain the return values. 
%% The evaluation order is implementation dependent.

%% partition
%% Partitions the given List into two lists, where the first list 
%% contains all elements for which the given predicate returns true, 
%% and the second list contains all elements for which the predicate 
%% returns false.

%% reverse
%% returns a list with the elements in the given list in reverse order.