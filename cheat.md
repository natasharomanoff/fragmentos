## List Comprehensions

	> [2*X || X <- [1,2,3,4] ].
	[2,4,6,8]


## Guards

	max(X, Y) when X > Y -> X;
	max(X, Y) -> Y.


## Case Expressions

	filter(P, [H|T]) ->
		case P(H) of
			true -> [H|filter(P, T)];
			false -> filter(P, T)
		end;

	filter(P, []) -> [].

## Accumulators

	odds_and_evens1(L) ->
		Odds = [X || X <- L, (X rem 2) =:= 1],
		Evens = [X || X <- L, (X rem 2) =:= 0],
		{Odds, Evens}.

with accumulators ...

	odds_and_evens2(L) -> odds_and_evens_acc(L, [], []).

	odds_and_evens_acc([H|T], Odds, Evens) ->
		case (H rem 2) of
			1 -> odds_and_evens_acc(T, [H|Odds], Evens);
			0 -> odds_and_evens_acc(T, Odds, [H|Evens])
		end;

	odds_and_evens_acc([], Odds, Evens) ->
		{Odds, Evens}.
