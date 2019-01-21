:- module(hardware, [sections/1, adjacent/2]).
:-[hw5].

getNumber(X):-findall(Y,adjacent(X,Y),F1),findall(Y,adjacent(Y,X),F2),append(F1,F2,F),length(F,L), L >= 4.

getOuters([],[]).
getOuters([H|T],List) :- getNumber(H), ! , getOuters(T,List).
getOuters([H|T], [H|List]) :- getOuters(T,List).


configuration([],_,[]).


configuration([H|T],[],[put(H,X)|PlacementList]) :-
											configuration(T,[],PlacementList),
											sections(Sections),
											member(X,Sections),
											not(member(put(_,X),PlacementList)).



configuration([H|T],List,[put(H,X)|PlacementList]) :-
											member(outer_edge(H),List),!,
											configuration(T,List,PlacementList),
											sections(Sections),
											getOuters(Sections,OuterEdges),
											member(X,OuterEdges),
											not(member(put(_,X),PlacementList)).


configuration([Y,Z|T],List,[put(Y,Sec1),put(Z,Sec2)|PlacementList]) :- member(close_to(Y,Z),List),!, sections(Sections), member(Sec1,Sections), member(Sec2,Sections), (adjacent(Sec1,Sec2);adjacent(Sec2,Sec1)),
																							  configuration(T,List,PlacementList),
																							  not(member(put(_,Sec1),PlacementList)),
																							  not(member(put(_,Sec2),PlacementList)).

configuration([H|T],List,[put(H,X)|PlacementList]):-!, sections(Sections), member(X,Sections), configuration(T,List,PlacementList),not(member(put(_,X),PlacementList)).