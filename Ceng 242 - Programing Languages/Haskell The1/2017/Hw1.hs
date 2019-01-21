module Hw1 (next) where -- DO NOT CHANGE THIS

next :: [[String]] -> [[String]]
-- IMPLEMENT NEXT FUNCTION HERE --
coordinates :: [[String]] -> [[Int]]
look_neighbors :: [[String]] -> [Int] -> [[Int]]
neighbors :: [[String]] -> [[Int]] -> [String]
check_change :: [[String]] -> [Int] -> String
change_op :: [[String]] -> [[Int]] -> [String]
merge :: [[String]] -> [String] -> Int -> [[String]]
look_neighbors _  [] = []
look_neighbors x m = if (length x) > 1 then 
                        (if (length (x !! 0)) > 1 then 
                            (if (m !! 0) == 0 then 
                                ( if (m !! 1) == 0 then [[0,1],[1,1],[1,0]] 
                                else if (m !! 1) == (length (x !! 0) -1) then [[0,length (x !! 0) -2],[1,length (x !! 0) -2],[1,length (x !! 0) -1]] 
                                else [[0,(m!!1)-1],[0,(m!!1)+1],[1,m!!1],[1,(m!!1)-1],[1,(m!!1)+1]]) 
                            else if (m !! 0) == ((length x) - 1) then 
                                ( if (m!!1) == 0 then [[(length x)-1,1],[(length x)-2,1],[(length x)-2,0]] 
                                else if (m !! 1) == (length (x !! 0) -1) then [[(length x)-1,length (x !! 0) -2],[(length x)-2,length (x !! 0) -2],[(length x)-2,length (x !! 0) -1]] 
                                else [[(length x)-1,(m!!1)-1],[(length x)-1,(m!!1)+1],[(length x)-2,m!!1],[(length x)-2,(m!!1)-1],[(length x)-2,(m!!1)+1]]) 
                            else (if (m !! 1) == 0 then [[(m!!0)-1,0],[(m!!0)+1,0],[(m!!0)-1,1],[(m!!0),1],[(m!!0)+1,1]] 
                                else if (m!!1) == (length (x !! 0) -1) then [[(m!!0)-1,(length (x !! 0) -1)],[(m!!0)+1,(length (x !! 0) -1)],[(m!!0)-1,(length (x !! 0) -2)],[(m!!0),(length (x !! 0) -2)],[(m!!0)+1,(length (x !! 0) -2)]] 
                                else [[(m!!0)-1,(m!!1)-1],[(m!!0)-1,(m!!1)],[(m!!0)-1,(m!!1)+1],[(m!!0),(m!!1)+1],[(m!!0)+1,(m!!1)+1],[(m!!0)+1,(m!!1)],[(m!!0)+1,(m!!1)-1],[(m!!0),(m!!1)-1]])) 
                        else (if (m !! 0) == 0 then [[1,0]] 
                            else if (m !! 0) == (length x)-1 then [[(length x)-2,0]] 
                            else [[(m !!0)-1,0],[(m !! 0) +1,0]])) 
                    else (if (length (x !! 0)) /= 1 then 
                            (if (m !! 1) == 0 then [[0,1]] 
                            else if (m !! 1) == (length (x !! 0))-1 then [[0,length(x !! 0)-2]] 
                            else [[0,(m !! 1) -1],[0,(m !! 1) +1]]) 
                            else [[]])
neighbors _ [] = []
neighbors x n = if n == [[]] then [""] else (if ((x !! ((head n) !! 0)) !! ((head n) !! 1)) =="B" then "B":neighbors x (tail n) else neighbors x (tail n) ) 
coordinates x = [[sutun,row] | sutun <- [0..(length x)-1] , row <- [0..(length (x !! 0))-1]]
check_change x n = if  (x !! (n !! 0)) !! (n !! 1) == "B" then (  if (length (neighbors x (look_neighbors x n)) ) == 2  || (length (neighbors x (look_neighbors x n)) ) == 3 then "B" else "W" ) else  (  if (length (neighbors x (look_neighbors x n)) ) == 3 then "B" else "W")
change_op _ [] = []
change_op x y = check_change x (head y) : change_op x (tail y)
merge _ [] _ = []
merge x y i = (take i y) :(merge x (drop i y) i)
next x = merge  x (change_op x (coordinates x)) (length(x !! 0)) 
-- DO NOT CHANGE CODE BELOW THIS LINE! --
createFile fileName = writeFile fileName ""

writeSteps filename grid n = do
                    createFile filename
                    writeStepsHelper filename grid n n
    where writeStepsHelper filename grid n all = if n == 0 then putStrLn ((show all) ++ " steps are succesfully written to \'" ++ filename ++ "\'") else do
                                    appendFile filename ((show (next grid)) ++ "\n")
                                    writeStepsHelper filename (next grid) (n-1) all