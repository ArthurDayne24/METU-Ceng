module Hw1 where

data Cell = H | P | O | X deriving (Read,Show,Eq)
data Result = Fail | Caught (Int,Int) deriving (Read,Show,Eq)
data Direction = N | S | E | W deriving (Read,Show,Eq)

simulate :: [[Cell]] -> [(Direction, Direction)] -> Result
-- DO NOT CHANGE ABOVE THIS LINE, WRITE YOUR CODE BELOW --
kontrol_et :: [[Cell]] -> Direction -> [Int] -> [Int]
obstacle_varmi :: [[Cell]] -> [Int] -> Bool
hunter_nerde:: [[Cell]] -> Int -> Int ->[Int]
prey_nerde:: [[Cell]] -> Int -> Int ->[Int]
simulate tarla d = helper tarla d (hunter_nerde tarla (length(tarla!!0)) (length(tarla))) (prey_nerde tarla (length(tarla!!0)) (length(tarla)))

helper tarla [] h_pos p_pos = Fail
helper tarla ((d1, d2):xs) h_pos p_pos = if ((kontrol_et tarla d1 h_pos) ==  (kontrol_et tarla d2 p_pos)) then (Caught (((kontrol_et tarla d1 h_pos)!!0) , ((kontrol_et tarla d1 h_pos)!!1))) else helper tarla xs (kontrol_et tarla d1 h_pos) (kontrol_et tarla d2 p_pos)

kontrol_et tarla d [x,y] =  if(d == W)then(
                                    if(obstacle_varmi tarla [x-1,y]) then[x,y] 
                                    else [x-1,y])
                            else if(d == S) then (
                                if(obstacle_varmi tarla [x,y+1]) then[x,y] 
                                else [x,y+1])
                            else if (d == E) then (
                                if(obstacle_varmi tarla [x+1,y]) then[x,y] 
                                else [x+1,y]) 
                            else(
                                if(obstacle_varmi tarla [x,y-1]) then[x,y] 
                                else [x,y-1]) 

obstacle_varmi tarla [x,y] = if(icerdemi [x,y] (length(tarla!!0)) (length(tarla))) then (
                                if ((tarla!!(y)!!(x)) == X) then True 
                                else False)
                             else True

icerdemi [x,y] lenx leny =  if x == -1 then False 
                            else if x == lenx then False 
                            else if y == -1 then False 
                            else if y == leny then False 
                            else True











hunter_nerde [] lenx leny = []
hunter_nerde ([]:ys) lenx leny = hunter_nerde ys lenx leny
hunter_nerde (((H e):xs):ys) lenx leny = [lenx - length(xs)-1, leny - length(ys) -1]
hunter_nerde ((_:xs):ys) lenx leny = hunter_nerde ((xs):ys) lenx leny

prey_nerde [] lenx leny = []
prey_nerde ([]:ys) lenx leny = prey_nerde ys lenx leny
prey_nerde (((P e):xs):ys) lenx leny = [lenx - length(xs)-1, leny - length(ys)-1]
prey_nerde ((_:xs):ys) lenx leny = prey_nerde ((xs):ys) lenx leny