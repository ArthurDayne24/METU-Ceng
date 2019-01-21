module WordTree(WordTree(Word, Subword, Root), emptyTree, getAllPaths, addWords, deleteWords, getWordsBeginWith) where

data WordTree = Word String | Subword String [WordTree] | Root [WordTree]

emptyTree :: WordTree
emptyTree = Root []
-- DO NOT MODIFY ABOVE

getAllPaths :: WordTree -> [[String]]
addWords :: WordTree -> [String] -> WordTree
deleteWords :: WordTree -> [String] -> WordTree
getWordsBeginWith :: WordTree -> String -> [String]

useTab 0 = ""
useTab s = "  " ++ useTab (s-1)


showfunc s w [] = ""
showfunc s w (Word a : []) = useTab s ++ w ++ a 
showfunc s w (Word a : xs) = useTab s ++ w ++ a ++ "\n" ++  showfunc s w xs   
showfunc s w (Subword a b : []) = useTab s ++ w ++ a ++ ":" ++ "\n"  ++ showfunc (s+1) (w++a) b 
showfunc s w (Subword a b :xs) =  useTab s ++ w ++ a ++ ":" ++ "\n" ++ showfunc (s+1) (w++a) b ++ "\n" ++ showfunc s w xs
showfunc s w [Root []] = ""
showfunc s w [Root x] = showfunc s w [head x] ++ "\n" ++ showfunc s w (tail x) 

instance Show WordTree where
    show x = showfunc 0 "" [x]

getpaths l [] = []
getpaths l [Root []] = []
getpaths l [Root x] = getpaths l x
getpaths l [Word x] = [l ++ [x]]
getpaths l (Word x : xs) = [l ++ [x]] ++ getpaths l xs
getpaths l [Subword x y] = getpaths (l ++ [x]) y
getpaths l (Subword x y : xs) = getpaths (l ++ [x]) y ++ getpaths l xs

insideSubWord s [] t [] = [Subword s t]
insideSubWord s [] t w = [Subword s (addOP "" t w)]
insideSubWord s y t [] = [Subword s [Word "", Subword y t]]
insideSubWord s y t w  = if (head y) == (head w) then insideSubWord (s ++ [head y]) (tail y) t (tail w)
						   else if (head y) < (head w) then [Subword s [Subword y t , Word w]]
						   else if (head y) > (head w) then [Subword s [Word w , Subword y t]]
						   else []


makeSubword s [] [] = [Word s]
makeSubword s x [] = [Subword s [Word "" , Word x]]
makeSubword s [] w = [Subword s [Word "" , Word w]]
makeSubword s x w = 	if (head x) == (head w) then makeSubword (s ++ [head x]) (tail x) (tail w)
					else if (head x) < (head w) then [Subword s [Word x , Word w]]
					else if (head x) > (head w) then [Subword s [Word w , Word x]]
					else []


addOP s [] w = [Word w]
addOP s (Word x:ls) w =	if x == [] then [Word ""] ++ addOP s ls w
							else if (head x) > (head w) then [Word w] ++ [Word x] ++ls
							else if (head x) < (head w) then [Word x] ++ addOP s ls w 
							else if (head x) == (head w) then (makeSubword s x w) ++ ls
							else []  

addOP s (Subword y t:ls) w =	if (head y) > (head w) then [Word w] ++ [Subword y t] ++ ls
								else if (head y) < (head w) then [Subword y t] ++ addOP s ls w 
								else if (head y) == (head w) then (insideSubWord "" y t w) ++ ls
								else []	


control x [Word t] = [Word (x ++ t)]
control x [Subword t r] = [Subword (x++t) (handler "" r)]

handleHelper s [] = []
handleHelper s [Word x] = [Word x]
handleHelper s [Subword x y] = if (length y) > 1 then [Subword (x) (handler (x) y)]  
							else if (length y) == 0 then [Word (x)]
							else if (length y) == 1 then (control x y)
							else []

handler s [] = []
handler s x = (handleHelper s [head x]) ++ (handler s (tail x))  

addfunc [Root x] w = Root (addOP "" x w)

delfunc [Root x] l = Root (handler "" (deleteOP x l))	

similarity s [] [] = []
similarity s x [] = [Word (s ++ x)]

similarity s [] l = [Word s]
similarity s x l = if (head x) > (head l) then [Word (s ++ x)]
					else if (head x) < (head l) then [Word (s ++ x)]
					else if (head x) == (head l) then (similarity (s ++ [head x]) (tail x) (tail l))
					else []

deleteOP [] l = [] 
deleteOP (Word "":xs) l = if (length l) == 0 then xs 
						else [Word ""]  ++ deleteOP xs l
deleteOP (Word x:xs) "" = if (length x) == 0 then xs 
						else (deleteOP xs "") 
deleteOP (Word x:xs) l = 	if (head x) > (head l) then ([Word x] ++ xs) 
						else if (head x) < (head l) then [Word x]  ++ (deleteOP xs l)
						else if (head x) == (head l) then (similarity "" x l)  ++ xs
						else [] 

deleteOP (Subword x y:xs) l = if (head x) > (head l) then (Subword x y:xs)
							else if (head x) < (head l) then [Subword x y] ++ (deleteOP xs l)
							else if (head x) == (head l) then (subPlace "" x y l) ++ xs
							else []


abc = Root [Subword "Car" [Word "", Word "penter"]]
subPlace s [] y [] = [Subword s (deleteOP y [])]
subPlace s x y [] = [Subword (s ++ x) y]
subPlace s [] y l = [Subword s (deleteOP y l)]
subPlace s x y l = if (head x) == (head l) then subPlace (s ++ [head x]) (tail x) y (tail l)
					else if (head x) > (head l) then [Subword (s ++ x) y]
					else if (head x) < (head l) then [Subword (s ++ x) y]
					else []



getAllPaths x = getpaths [] [x]

addWords t [] = t
addWords t w =  addWords (addfunc [t] (head w)) (tail w) 

deleteWords t [] = t
deleteWords t l = deleteWords (delfunc [t] (head l)) (tail l)

sendAgain x [] = []
sendAgain x y = (tumkelimeler x [head y]) ++ sendAgain x (tail y)

tumkelimeler s [Word x] = [s++x]
tumkelimeler s [Subword x y] = sendAgain (s++x) y 

doesExistWord b [] [] = [b]
doesExistWord b x [] = [b++x]
doesExistWord b [] s = []
doesExistWord b x s = if (head x) == (head s) then doesExistWord (b++[head x]) (tail x) (tail s)
					else []

sendAgain2 b [] s = []
sendAgain2 b y s = (send b [head y] s) ++ sendAgain2 b (tail y) s


doesExistSub b [] y [] = sendAgain b y
doesExistSub b [] y s = sendAgain2 b y s
doesExistSub b x y [] = sendAgain (b++x) y
doesExistSub b x y s = 	if (head x) == (head s) then doesExistSub (b ++ [head x]) (tail x) y (tail s) 
						else []

send b x "" = tumkelimeler "" x 
send b [Word ""] s = []
send b [Word x] s = if (head x) == (head s) then doesExistWord b x s
					else []
send b [Subword x y] s = if (head x) == (head s) then doesExistSub b x y s
						else []


getfunc [] s = []
getfunc x s = send "" [head x] s ++ getfunc (tail x) s

getWordsBeginWith (Root x) s = getfunc x s 