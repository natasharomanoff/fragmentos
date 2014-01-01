-module(listfun).
-export([head/1, 
	     tail/1,
	     sum/1,
	     sum1/1,
	     product/1,
	     all/2, 
	     any/2,
	     filter/2,
	     map/2,
	     last/1]).

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

%% Tail recursion with boolean Accumulators

all(Pred, L) -> all(Pred, L, true).

all(Pred, [H|T], Acc) -> all(Pred, T, Pred(H) and Acc);
all(_, [], Acc) -> Acc.  

%% %%%%

any(Pred, L) -> any(Pred, L, false).

any(Pred, [H|T], Acc) -> any(Pred, T, Pred(H) or Acc);
any(_, [], Acc) -> Acc.  


%% filter and map using list comprehension

filter(Pred, L) -> [X || X <- L, Pred(X)].

map(F, L) -> [F(X) || X <- L].

%% nice trick with pattern match and recursion.

last([H|T]) -> last(H, T).

last(_, [H|T]) -> last(H, T);
last(L, []) -> L.

