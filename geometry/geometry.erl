-module(geometry).
-export([test/0, area/1, perimeter/1]).


test() -> 
	12 = area({rectangle, 3, 4}),
	16 = area({square, 4}),
	314.0 = area({circle, 10}),
	30 = perimeter({rectangle, 5, 10}),
	20 = perimeter({square, 5}),
	31.400000000000002 = perimeter({circle, 5}),
	tests_passed.

area({rectangle, Width, Height}) -> Width * Height;
area({circle, Radius}) -> 3.14 * Radius * Radius;
area({square, Side}) -> Side * Side.

perimeter({rectangle, Width, Height}) -> 2 *(Width + Height);
perimeter({square, Side}) -> 4 *(Side);
perimeter({circle, Radius}) -> 2 * 3.14 *Radius.