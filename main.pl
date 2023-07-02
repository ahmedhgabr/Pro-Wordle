

build_kb:-
	write('Please enter a word and its category on separate lines:'),nl,
	read(W),
	(W==done ;
	read(C),
	assert(word(W,C)),
	build_kb).


is_category(C):- word(_,C).


categories(L):-

	findall(X,word(_,X),L1),
	remove_duplicates(L1,L2),
	permutation(L2,L),!.


remove_duplicates([],[]).

remove_duplicates([H | T], L) :-    
     member(H, T),
     remove_duplicates( T, L).

remove_duplicates([H | T], [H|T1]) :- 
      \+member(H, T),
      remove_duplicates( T, T1).


available_length(L):-
	word(W,_),
	string_length(W,L).



pick_word(W,L,C):-
	word(W,C),
	string_length(W,L).




correct_letters(_,[],[]).

correct_letters(L1,[H2|T2],CL):-
	member(H2,L1),
	CL=[H2|T],
	correct_letters(L1,T2,T).

correct_letters(L1,[H2|T2],CL):-
	\+member(H2,L1),
	correct_letters(L1,T2,CL).




correct_positions([],[],[]).

correct_positions([H1|T1],[H2|T2],PL):-
	H1 == H2,
	PL= [H1|T],
	correct_positions(T1,T2,T).


correct_positions([H1|T1],[H2|T2],PL):-
	H1 \= H2,
	correct_positions(T1,T2,PL).















