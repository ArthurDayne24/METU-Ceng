def mateval(L) :
    if L[0] == '+' :
	L = toplama(L[1:])
    elif L[0] == '-' :
	L = cikarma(L[1:])
    elif L[0] == '*' :
	L = carpma(L[1:])
    return L

def GDC(a,b) :
    if a > 0 or a < 0 :
	if abs(a) > b :
	    if b > abuyb(a,b) :
	    	return [a/abuyb(a,b),b/abuyb(a,b)]
	    else :
		return a/abuyb(a,b)
	elif a == b :
	    return 1
    	elif abs(a) < b :
	    if b > bbuya(a,b) :
	    	return [a/bbuya(a,b),b/bbuya(a,b)]
	    else :
		return a/bbuya(a,b)
    elif a == 0 :
	return 0

def bbuya(a,b) :
    if a > 0 :
        if b % a != 0 :
	    if a > b%a :
	    	return abuyb(a,b%a)
	    else:
		return bbuya(a,b%a)
    	else :
	    return a
    elif a < 0 :
	if b % a != 0 :
	    return bbuya(abs(a),b%a)
	else :
	    return abs(a)

def abuyb(a,b) :
    if a > 0 :
	if a % b != 0 :
	    return abuyb(b,a%b)
	else:
            return b
    elif a < 0 :
	if a % b != 0 :
	    return abuyb(b,abs(a%b))
	else :
	    return b



def toplama(L) :
	if type(L[0]) == int and type(L[1]) == int :
		return L[0] + L[1]
	elif type(L[0]) == int and type(L[1]) == list :
		return GDC(L[0] * L[1][1] + L[1][0] , L[1][1])
	elif type(L[0]) == list and type(L[1]) == int :
		return GDC(L[1] * L[0][1] + L[0][0] , L[0][1]) 	
	elif type(L[0]) == list and type(L[1]) == list :
		if type(L[0][0]) == int :
			return GDC(L[0][0] * L[1][1] + L[0][1] * L[1][0] , L[0][1] * L[1][1])
		elif type(L[0][0]) == list :
		    result = []
		    L[0] = mateval(L[0])
		    L[1] = mateval(L[1])
    		    for i in range(len(L[0])):
	    		result.append([])
	    		for j in range(len(L[0][0])):
	    		    result[i].append(0)
			    if type(L[0][i][j]) == int and type(L[1][i][j]) == int :
	    	    		result[i][j] = L[0][i][j] + L[1][i][j]
			    elif type(L[0][i][j]) == list and type(L[1][i][j]) == int :
		    		result[i][j] = GDC(L[0][i][j][0] + L[0][i][j][1] * L[1][i][j] , L[0][i][j][1]) 
			    elif type(L[0][i][j]) == int and type(L[1][i][j]) == list :
		    		result[i][j] = GDC(L[1][i][j][0] + L[1][i][j][1] * L[0][i][j] , L[1][i][j][1])
			    elif type(L[0][i][j]) == list and type(L[1][i][j]) == list :
		    		result[i][j] = GDC(L[0][i][j][0] * L[1][i][j][1] + L[0][i][j][1] * L[1][i][j][0] , L[0][i][j][1] * L[1][i][j][1])
    		    L[1] = result
        	    if len(L[1:]) == 1 :
	    		return result
    		    else : 
	    		return toplama(L[1:])

def cikarma(L) :
	if type(L[0]) == int and type(L[1]) == int :
		return L[0] - L[1]
	elif type(L[0]) == int and type(L[1]) == list :
		return GDC(L[0] * L[1][1] - L[1][0] , L[1][1])
	elif type(L[0]) == list and type(L[1]) == int :
		return GDC(L[0][0] - L[1] * L[0][1] , L[0][1]) 	
	elif type(L[0]) == list and type(L[1]) == list :
		if type(L[0][0]) == int :
			return GDC(L[0][0] * L[1][1] - L[0][1] * L[1][0] , L[0][1] * L[1][1])
		elif type(L[0][0]) == list :
    		    result = []
    		    L[0] = mateval(L[0])
    		    L[1] = mateval(L[1])
    		    for i in range(len(L[0])):
			result.append([])
			for j in range(len(L[0][0])):
	    		    result[i].append(0)
	    		    if type(L[0][i][j]) == int and type(L[1][i][j]) == int :
	    			result[i][j] = L[0][i][j] - L[1][i][j]
	    		    elif type(L[0][i][j]) == list and type(L[1][i][j]) == int :
				result[i][j] = GDC(L[0][i][j][0] - L[0][i][j][1] * L[1][i][j] , L[0][i][j][1]) 
	    		    elif type(L[0][i][j]) == int and type(L[1][i][j]) == list :
				result[i][j] = GDC(L[1][i][j][1] * L[0][i][j] - L[1][i][j][0] , L[1][i][j][1])
	    		    elif type(L[0][i][j]) == list and type(L[1][i][j]) == list :
				result[i][j] = GDC(L[0][i][j][0] * L[1][i][j][1] - L[0][i][j][1] * L[1][i][j][0] , L[0][i][j][1] * L[1][i][j][1])
    		    return result

def carpma(L) :
    result = []
    L[0] = mateval(L[0])
    L[1] = mateval(L[1])
    numsat = len(L[0])
    numkol = len(L[0][0])
    numkol2 = len(L[1][0])
    for i in range(numsat) :
	result.append([])
	for j in range(numkol2) :
	    result[i].append(0)
	    for k in range(numkol) :
		if type(L[0][i][k]) == int and type(L[1][k][j]) == int :
		    if type(L[0][i][k] * L[1][k][j]) == int and type(result[i][j]) == int :
		    	result[i][j] = result[i][j] + L[0][i][k] * L[1][k][j]
		    elif type(L[0][i][k] * L[1][k][j]) == list and type(result[i][j]) == int :
		    	result[i][j] = GDC((L[0][i][k] * L[1][k][j])[1] * result[i][j] + (L[0][i][k] * L[1][k][j])[0] , (L[0][i][k] * L[1][k][j])[1])
		    elif type(L[0][i][k] * L[1][k][j]) == int and type(result[i][j]) == list :
		    	result[i][j] = GDC(L[0][i][k] * L[1][k][j] * result[i][j][1] + result[i][j][0] , (L[0][i][k] * L[1][k][j])[1])
		    elif type(L[0][i][k] * L[1][k][j]) == list and type(result[i][j]) == list :
		    	result[i][j] = GDC((L[0][i][k] * L[1][k][j])[0] * result[i][j][1] + (L[0][i][k] * L[1][k][j])[1] * result[i][j][0] , result[i][j][1] * (L[0][i][k] * L[1][k][j])[1])
		if type(L[0][i][k]) == list and type(L[1][k][j]) == int :
		    if type(GDC(L[0][i][k][0] * L[1][k][j] , L[0][i][k][1])) == int and type(result[i][j]) == int :
		    	result[i][j] = result[i][j] + GDC(L[0][i][k][0] * L[1][k][j] , L[0][i][k][1])
		    elif type(GDC(L[0][i][k][0] * L[1][k][j] , L[0][i][k][1])) == list and type(result[i][j]) == int :
			result[i][j] = GDC(GDC(L[0][i][k][0] * L[1][k][j] , L[0][i][k][1])[0] + GDC(L[0][i][k][0] * L[1][k][j] , L[0][i][k][1])[1] * result[i][j] , GDC(L[0][i][k][0] * L[1][k][j] , L[0][i][k][1])[1])
		    elif type(GDC(L[0][i][k][0] * L[1][k][j] , L[0][i][k][1])) == int and type(result[i][j]) == list :
			result[i][j] = GDC(GDC(L[0][i][k][0] * L[1][k][j] , L[0][i][k][1]) * result[i][j][1] + result[i][j][0] , result[i][j][1])
		    elif type(GDC(L[0][i][k][0] * L[1][k][j] , L[0][i][k][1])) == list and type(result[i][j]) == list :
		    	result[i][j] = GDC(GDC(L[0][i][k][0] * L[1][k][j] , L[0][i][k][1])[0] * result[i][j][1] + GDC(L[0][i][k][0] * L[1][k][j] , L[0][i][k][1])[1] * result[i][j][0] ,  GDC(L[0][i][k][0] * L[1][k][j] , L[0][i][k][1])[1] * result[i][j][1])
		if type(L[0][i][k]) == int and type(L[1][k][j]) == list :
		    if type(GDC(L[0][i][k] * L[1][k][j][0] , L[1][k][j][1])) == int and type(result[i][j]) == int :
		    	result[i][j] = result[i][j] + GDC(L[0][i][k] * L[1][k][j][0] , L[1][k][j][1])
		    elif type(GDC(L[0][i][k] * L[1][k][j][0] , L[1][k][j][1])) == list and type(result[i][j]) == int :
		    	result[i][j] = GDC(result[i][j] * GDC(L[0][i][k] * L[1][k][j][0] , L[1][k][j][1])[1] + GDC(L[0][i][k] * L[1][k][j][0] , L[1][k][j][1])[0] , GDC(L[0][i][k] * L[1][k][j][0] , L[1][k][j][1])[1])
		    elif type(GDC(L[0][i][k] * L[1][k][j][0] , L[1][k][j][1])) == int and type(result[i][j]) == list :
		    	result[i][j] = GDC(GDC(L[0][i][k] * L[1][k][j][0] , L[1][k][j][1]) * result[i][j][1] + result[i][j][0] , result[i][j][1])
		    elif type(GDC(L[0][i][k] * L[1][k][j][0] , L[1][k][j][1])) == list and type(result[i][j]) == list :
		    	result[i][j] = GDC(GDC(L[0][i][k] * L[1][k][j][0] , L[1][k][j][1])[0] * result[i][j][1] + GDC(L[0][i][k] * L[1][k][j][0] , L[1][k][j][1])[1] * result[i][j][0] , result[i][j][1] * GDC(L[0][i][k] * L[1][k][j][0] , L[1][k][j][1])[1])
		if type(L[0][i][k]) == list and type(L[1][k][j]) == list :
		    if type(GDC(L[0][i][k][0] * L[1][k][j][0] , L[1][k][j][1] * L[0][i][k][1])) == int and type(result[i][j]) == int :
		    	result[i][j] = result[i][j] + GDC(L[0][i][k][0] * L[1][k][j][0] , L[1][k][j][1] * L[0][i][k][1])
		    elif type(GDC(L[0][i][k][0] * L[1][k][j][0] , L[1][k][j][1] * L[0][i][k][1])) == list and type(result[i][j]) == int :
		    	result[i][j] = GDC(result [i][j] * GDC(L[0][i][k][0] * L[1][k][j][0] , L[1][k][j][1] * L[0][i][k][1])[1] + GDC(L[0][i][k][0] * L[1][k][j][0] , L[1][k][j][1] * L[0][i][k][1])[0] , GDC(L[0][i][k][0] * L[1][k][j][0] , L[1][k][j][1] * L[0][i][k][1])[1])
		    elif type(GDC(L[0][i][k][0] * L[1][k][j][0] , L[1][k][j][1] * L[0][i][k][1])) == int and type(result[i][j]) == list :
		    	result[i][j] = GDC(GDC(L[0][i][k][0] * L[1][k][j][0] , L[1][k][j][1] * L[0][i][k][1]) * result[i][j][1] + result[i][j][0] , result[i][j][1])
		    elif type(GDC(L[0][i][k][0] * L[1][k][j][0] , L[1][k][j][1] * L[0][i][k][1])) == list and type(result[i][j]) == list :
		    	result[i][j] = GDC(GDC(L[0][i][k][0] * L[1][k][j][0] , L[1][k][j][1] * L[0][i][k][1])[0] * result[i][j][1] + GDC(L[0][i][k][0] * L[1][k][j][0] , L[1][k][j][1] * L[0][i][k][1])[1] * result[i][j][0] , result[i][j][1] * GDC(L[0][i][k][0] * L[1][k][j][0] , L[1][k][j][1] * L[0][i][k][1])[1])
		    
    L[1] = result
    if len(L[1:]) == 1 :
	return result
    else:
	return carpma(L[1:])

print mateval(['*',[[2,3],[3,4],[[4,6],5]],[[5,6,6],[7,7,8]]])

