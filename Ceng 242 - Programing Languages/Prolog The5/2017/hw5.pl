tile(t1,3,5,blue).
tile(t2,1,2,blue).
tile(t3,4,3,blue).
tile(t4,2,4,red).
tile(t5,4,1,red).
tile(t6,2,3,green).
tile(t7,1,5,green).
tile(t8,3,3,green).
tile(t9,1,1,purple).
tile(t10,2,5,purple).

alan(X,T) :- tile(X,Gen,Yuk,_) , T is Yuk*Gen. 

filled_area([],Alan) :- Alan is 0. 
filled_area([Head|Tail] , Alan) :- filled_area(Tail,O) , alan(Head,Z), Alan is O + Z.

fonksiyon([],0,_) .
fonksiyon([H|T],Width,Height) :- tile(H,W,He,_) , He =< Height , W =< Width, Tmp is Width-W ,fonksiyon(T,Tmp,Height).

kaldır([]).
kaldır([Head|Tail]) :- not(member(Head,Tail)), kaldır(Tail).

filling_list(Width,Height,Perc,X) :- fonksiyon(X,Width,Height), kaldır(X), filled_area(X,T) , T >= Width*Height*Perc. 

