module Hw2 where

import Data.List -- YOU MAY USE THIS MODULE FOR SORTING THE AGENTS

data Level = Newbie | Intermediate | Expert deriving (Enum, Eq, Ord, Show, Read)
data Hunter = Hunter {hID::Int, hlevel::Level, hEnergy::Int, hNumberOfCatches::Int, hActions::[Direction]} deriving (Eq, Show, Read)
data Prey = Prey {pID::Int, pEnergy::Int, pActions::[Direction]} deriving (Eq, Show, Read)
data Cell = O | X | H Hunter | P Prey | T deriving (Eq, Show, Read)
data Direction = N | S | E | W deriving (Eq, Show, Read)
type Coordinate = (Int, Int)
-- DO NOT CHANGE THE DEFINITIONS ABOVE. --


-- INSTANCES OF Ord FOR SORTING, UNCOMMENT AND COMPLETE THE IMPLEMENTATIONS --
instance Ord Hunter where
    compare h1 h2 = if(hlevel h1 == hlevel h2) then(
                        if(hEnergy h1 == hEnergy h2) then(
                            if((hNumberOfCatches h1) == (hNumberOfCatches h2)) then(
                                if((hID h1) > (hID h2)) then LT 
                                else GT
                            )
                            else (if (hNumberOfCatches h1) > (hNumberOfCatches h2) then GT else LT)
                        )
                        else (if((hEnergy h1) >(hEnergy h2)) then GT else LT )
                    )
                    else (if(hlevel h1 > hlevel h2) then GT else LT)
instance Ord Prey where
    compare p1 p2 = if((pEnergy p1) > (pEnergy p2)) then GT 
        else if((pEnergy p1) < (pEnergy p2)) then LT
            else(if((pID p1) > (pID p2)) then LT else GT)

-- WRITE THE REST OF YOUR CODE HERE --
simulate::[[Cell]] -> ([(Hunter,Coordinate)],[(Prey,Coordinate)])
simulate tarla = ilk_yardim tarla ((sort(hunter_nerde tarla (length(tarla!!0)) (length(tarla)))) , ((prey_nerde tarla (length(tarla!!0)) (length(tarla))) ))


hunter_nerde:: [[Cell]] -> Int -> Int -> [(Hunter,Coordinate)]
hunter_nerde [] lenx leny = []
hunter_nerde ([]:ys) lenx leny = hunter_nerde ys lenx leny
hunter_nerde (((H e):xs):ys) lenx leny = [(e,(lenx - length(xs)-1, leny - length(ys) -1))] ++ hunter_nerde ((xs):ys) lenx leny
hunter_nerde ((_:xs):ys) lenx leny = hunter_nerde ((xs):ys) lenx leny


prey_nerde:: [[Cell]] -> Int -> Int -> [(Prey,Coordinate)]
prey_nerde [] lenx leny = []
prey_nerde ([]:ys) lenx leny = prey_nerde ys lenx leny
prey_nerde (((P e):xs):ys) lenx leny = [(e,(lenx - length(xs)-1, leny - length(ys)-1))] ++ prey_nerde ((xs):ys) lenx leny
prey_nerde ((_:xs):ys) lenx leny = prey_nerde ((xs):ys) lenx leny

trap_varmi:: [[Cell]] -> Coordinate -> Bool
trap_varmi tarla  (x,y) = if ((tarla!!(y)!!(x)) == T) then True    else False

obstacle_varmi:: [[Cell]] -> Coordinate -> Bool
obstacle_varmi tarla (x,y) = if(icerdemi (x,y) (length(tarla!!0)) (length(tarla))) then (
                                if ((tarla!!(y)!!(x)) == X) then True 
                                else False)
                             else True
icerdemi:: Coordinate -> Int -> Int -> Bool
icerdemi (x,y) lenx leny =  if x == -1 then False 
                            else if x == lenx then False 
                            else if y == -1 then False 
                            else if y == leny then False 
                            else True

incr_eng_hunt::Hunter -> Int -> Hunter
incr_eng_hunt hunter eng= if (hActions hunter == []) then (if( (hEnergy hunter)+eng <= 100) then Hunter {hID =hID hunter , hlevel = hlevel hunter, hEnergy  = (hEnergy hunter)+eng, hNumberOfCatches  = hNumberOfCatches hunter, hActions  = []}
                                                           else Hunter {hID =hID hunter , hlevel = hlevel hunter, hEnergy  = 100 , hNumberOfCatches  = hNumberOfCatches hunter, hActions  = []})
                          else  (if( (hEnergy hunter)+eng <= 100) then Hunter {hID =hID hunter , hlevel = hlevel hunter, hEnergy  = (hEnergy hunter)+eng, hNumberOfCatches  = hNumberOfCatches hunter, hActions  = tail(hActions (hunter))}
                                 else Hunter {hID =hID hunter , hlevel = hlevel hunter, hEnergy  = 100 , hNumberOfCatches  = hNumberOfCatches hunter, hActions  = tail(hActions (hunter))})

incr_eng_hunt_ye::Hunter -> Int -> Hunter
incr_eng_hunt_ye hunter eng = if((hEnergy hunter) + eng <=100) then Hunter {hID =hID hunter , hlevel = hlevel hunter, hEnergy  = (hEnergy hunter)+eng, hNumberOfCatches  = (hNumberOfCatches hunter)+1, hActions  = hActions hunter}
                            else Hunter {hID =hID hunter , hlevel = hlevel hunter, hEnergy  = 100, hNumberOfCatches  = (hNumberOfCatches hunter)+1, hActions  = hActions hunter}
decr_eng_hunt::Hunter -> Int -> Hunter
decr_eng_hunt hunter eng= if((hActions hunter) == []) then Hunter {hID =hID hunter , hlevel = hlevel hunter, hEnergy  = (hEnergy hunter)-eng, hNumberOfCatches  = hNumberOfCatches hunter, hActions  = []} else Hunter {hID =hID hunter , hlevel = hlevel hunter, hEnergy  = (hEnergy hunter)-eng, hNumberOfCatches  = hNumberOfCatches hunter, hActions  = tail(hActions (hunter))}

incr_eng_prey::Prey -> Int -> Prey
incr_eng_prey prey eng = if((pActions prey) == []) then Prey {pID = pID prey , pEnergy = (pEnergy prey) + eng, pActions = []} else Prey {pID = pID prey , pEnergy = (pEnergy prey) + eng, pActions = tail(pActions prey)}

decr_eng_prey::Prey -> Int -> Prey
decr_eng_prey prey eng = if((pActions prey) == []) then Prey {pID = pID prey , pEnergy = (pEnergy prey) - eng, pActions = []} else Prey {pID = pID prey , pEnergy = (pEnergy prey) - eng, pActions = tail(pActions prey)}

kontrol_et_tarla_hunter::[[Cell]] -> (Hunter,Coordinate) -> (Hunter,Coordinate)
kontrol_et_tarla_hunter tarla (hunter,(x,y))= if((hActions hunter)!!0 == W)then(
                                                    if (hEnergy hunter < 10) then ((incr_eng_hunt hunter 1),(x,y))
                                                    else if(obstacle_varmi tarla (x-1,y)) then ((decr_eng_hunt hunter 1),(x,y))
                                                    else ((decr_eng_hunt hunter 1),(x-1,y))
                                                )
                                                else if((hActions hunter)!!0 == S) then (
                                                    if(hEnergy hunter < 10) then ((incr_eng_hunt hunter 1), (x,y))
                                                    else if (obstacle_varmi tarla (x,y+1)) then ((decr_eng_hunt hunter 1), (x,y))
                                                    else  ((decr_eng_hunt hunter 1),(x,y+1))  
                                                )
                                                else if ((hActions hunter)!!0== E) then (
                                                    if(hEnergy hunter < 10) then ((incr_eng_hunt hunter 1),(x,y))
                                                    else if(obstacle_varmi tarla (x+1,y)) then ((decr_eng_hunt hunter 1) ,(x,y)) 
                                                    else ((decr_eng_hunt hunter 1),(x+1,y)) 
                                                )
                                                else(
                                                    if(hEnergy hunter < 10) then ((incr_eng_hunt hunter 1),(x,y))
                                                    else if(obstacle_varmi tarla (x,y-1)) then ((decr_eng_hunt hunter 1),(x,y))
                                                    else ((decr_eng_hunt hunter 1),(x,y-1))
                                                )

kontrol_et_tarla_prey::[[Cell]] -> (Prey,Coordinate) -> (Prey,Coordinate)
kontrol_et_tarla_prey tarla (prey,(x,y)) =    if((pActions prey)!!0 == W)then(
                                                    if (pEnergy prey < 10) then (if(trap_varmi tarla (x,y)) then (if(pEnergy prey == 0) then (((decr_eng_prey prey 0),(x,y))) else (((decr_eng_prey prey (pEnergy prey)),(x,y)))) else (((incr_eng_prey prey 1),(x,y))))
                                                    else if(obstacle_varmi tarla (x-1,y)) then (if(trap_varmi tarla (x,y)) then (if(pEnergy prey == 10) then ((decr_eng_prey prey 10),(x,y)) else ((decr_eng_prey prey 11),(x,y))) else ((decr_eng_prey prey 1),(x,y)))
                                                    else if(trap_varmi tarla (x-1,y)) then (if(pEnergy prey == 10) then ((decr_eng_prey prey 10),(x-1,y)) else ((decr_eng_prey prey 11),(x-1,y)))
                                                    else ((decr_eng_prey prey 1),(x-1,y))
                                                )
                                                else if((pActions prey)!!0 == S) then (
                                                    if (pEnergy prey < 10) then (if(trap_varmi tarla (x,y)) then (if(pEnergy prey == 0) then (((decr_eng_prey prey 0),(x,y))) else (((decr_eng_prey prey (pEnergy prey)),(x,y)))) else (((incr_eng_prey prey 1),(x,y))))
                                                    else if(obstacle_varmi tarla (x,y+1)) then (if(trap_varmi tarla (x,y)) then (if(pEnergy prey == 10) then ((decr_eng_prey prey 10),(x,y)) else ((decr_eng_prey prey 11),(x,y))) else ((decr_eng_prey prey 1),(x,y)))
                                                    else if(trap_varmi tarla (x,y+1)) then (if(pEnergy prey == 10) then ((decr_eng_prey prey 10),(x,y+1)) else ((decr_eng_prey prey 11),(x,y+1)))
                                                    else ((decr_eng_prey prey 1),(x,y+1))
                                                )
                                                else if ((pActions prey)!!0== E) then (
                                                    if (pEnergy prey < 10) then (if(trap_varmi tarla (x,y)) then (if(pEnergy prey == 0) then (((decr_eng_prey prey 0),(x,y))) else (((decr_eng_prey prey (pEnergy prey)),(x,y)))) else (((incr_eng_prey prey 1),(x,y))))
                                                    else if(obstacle_varmi tarla (x+1,y)) then (if(trap_varmi tarla (x,y)) then (if(pEnergy prey == 10) then ((decr_eng_prey prey 10),(x,y)) else ((decr_eng_prey prey 11),(x,y))) else ((decr_eng_prey prey 1),(x,y)))
                                                    else if(trap_varmi tarla (x+1,y)) then (if(pEnergy prey == 10) then  ((decr_eng_prey prey 10),(x+1,y)) else ((decr_eng_prey prey 11),(x+1,y)))
                                                    else ((decr_eng_prey prey 1),(x+1,y)) 
                                                )
                                                else(
                                                    if (pEnergy prey < 10) then (if(trap_varmi tarla (x,y)) then (if(pEnergy prey == 0) then (((decr_eng_prey prey 0),(x,y))) else (((decr_eng_prey prey (pEnergy prey)),(x,y)))) else (((incr_eng_prey prey 1),(x,y))))
                                                    else if(obstacle_varmi tarla (x,y-1)) then (if(trap_varmi tarla (x,y)) then (if(pEnergy prey == 10) then ((decr_eng_prey prey 10),(x,y)) else ((decr_eng_prey prey 11),(x,y))) else ((decr_eng_prey prey 1),(x,y)))
                                                    else if(trap_varmi tarla (x,y-1)) then (if(pEnergy prey == 10) then  ((decr_eng_prey prey 10), (x,y-1)) else ((decr_eng_prey prey 11), (x,y-1)))
                                                    else ((decr_eng_prey prey 1),(x,y-1))
                                                )
hepsini_oynat_hunter::[[Cell]] -> [(Hunter,Coordinate)] -> [(Hunter,Coordinate)]
hepsini_oynat_hunter tarla [] = []
hepsini_oynat_hunter tarla h_list = [kontrol_et_tarla_hunter tarla (h_list!!0)] ++ hepsini_oynat_hunter tarla (tail(h_list))

hepsini_oynat_prey::[[Cell]] -> [(Prey,Coordinate)] -> [(Prey,Coordinate)]
hepsini_oynat_prey tarla [] = []
hepsini_oynat_prey tarla p_list = [kontrol_et_tarla_prey tarla (p_list!!0)] ++ hepsini_oynat_prey tarla (tail(p_list))

check_finish::Hunter -> Bool
check_finish hunter = if(hActions hunter == []) then True else False


ayni_yerdelermi::(Hunter,Coordinate)-> [(Prey,Coordinate)] ->Int -> Int -> [Int]
ayni_yerdelermi hunter ordered_p_list 2 index= []
ayni_yerdelermi hunter [] count index= []
ayni_yerdelermi ((hunter),(x,y)) ordered_p_list count index = if((x,y) /= (snd(ordered_p_list!!0))) then (ayni_yerdelermi ((hunter),(x,y)) (tail(ordered_p_list)) count (index + 1))
                                              else [index] ++ ayni_yerdelermi ((hunter),(x,y)) (tail(ordered_p_list)) (count +1) (index + 1)

help_me::[(Prey,Coordinate)]->Int->Int->[(Prey,Coordinate)]
help_me p_list index_p index = if(index_p == index) then (tail(p_list)) else [(head(p_list))] ++ help_me (tail(p_list)) index_p (index+1)

preyleri_sil::[(Prey,Coordinate)]-> [Int]->[(Prey,Coordinate)]
preyleri_sil p_list [] = p_list
preyleri_sil p_list indexes = preyleri_sil ( help_me p_list (indexes!!0) 0) (tail(indexes))

hunter_ye:: [(Hunter,Coordinate)] -> [(Prey,Coordinate)] -> [Int] -> Int -> Int -> [(Hunter,Coordinate)]
hunter_ye [] _ _ _ _ = []
hunter_ye h_list p_list [] hunt_index temp= h_list
hunter_ye h_list p_list indexes hunt_index temp = if(hunt_index == temp) then [hunter_bulundu (h_list!!0) p_list indexes] ++ (tail(h_list)) else [(head(h_list))] ++ hunter_ye (tail(h_list)) p_list indexes hunt_index (temp+1) 

hunter_bulundu::(Hunter,Coordinate) -> [(Prey,Coordinate)] -> [Int] -> (Hunter,Coordinate)
hunter_bulundu hunter p_list [] = hunter
hunter_bulundu hunter p_list indexes = hunter_bulundu (incr_eng_hunt_ye (fst(hunter)) 20,(snd(hunter))) p_list (tail(indexes))
                                                   --else  [(h_list!!0)] ++ hunter_ye (tail(h_list)) p_list indexes hunt_index (temp+1)

teker_teker_bak:: ([(Hunter,Coordinate)],[(Prey,Coordinate)]) -> Int -> Int -> ([(Hunter,Coordinate)],[(Prey,Coordinate)])
teker_teker_bak (ordered_h_list,ordered_p_list) index hunter_no = if( index == (hunter_no) ) then (ordered_h_list,ordered_p_list)
                                                                  else teker_teker_bak (hunter_ye ordered_h_list ordered_p_list (ayni_yerdelermi (ordered_h_list!!index) ordered_p_list 0 0) index 0, preyleri_sil ordered_p_list (ayni_yerdelermi (ordered_h_list!!index) ordered_p_list 0 0)) (index+1) hunter_no

yiyolar_mi::([(Hunter,Coordinate)],[(Prey,Coordinate)]) ->  ([(Hunter,Coordinate)],[(Prey,Coordinate)])
yiyolar_mi  (h_list,p_list) = teker_teker_bak ((reverse(sort h_list)),(sort p_list)) 0 (length(h_list))

ilk_yardim::[[Cell]] -> ([(Hunter,Coordinate)],[(Prey,Coordinate)]) -> ([(Hunter,Coordinate)],[(Prey,Coordinate)])
ilk_yardim tarla (h_list,[]) = (h_list,[])
ilk_yardim tarla (((hunter,(x,y)):xs),p_list) = if (check_finish hunter) then (((hunter,(x,y)):xs),p_list) else ikinci_yardim tarla ((hunter,(x,y)):xs) p_list

ikinci_yardim::[[Cell]] -> [(Hunter,Coordinate)] -> [(Prey,Coordinate)] -> ([(Hunter,Coordinate)],[(Prey,Coordinate)])
ikinci_yardim tarla h_list [] = (h_list,[])
ikinci_yardim tarla h_list p_list = ilk_yardim tarla (yiyolar_mi ((hepsini_oynat_hunter tarla h_list),(hepsini_oynat_prey tarla p_list)))

