import math

def physics(mylist):
    delta1deg=float(mylist[0])
    delta2deg=float(mylist[1])
    d=float(mylist[2])
    nus=float(mylist[3])
    nuk=float(mylist[4])
    s=float(mylist[5])
    m1=float(mylist[6])
    m2=float(mylist[7])
    t1=float(mylist[8])
    t2=float(mylist[9])
    g=9.8
    delta1=math.radians(delta1deg)
    delta2=math.radians(delta2deg)
    delta3=math.radians(180-(delta1deg+delta2deg))
    a=(math.sin(delta2)*d)/float(math.sin(delta3))
    b=(math.sin(delta1)*d)/float(math.sin(delta3))
    a1=g*math.sin(delta1) - g*math.cos(delta1)*nuk
    a2=g*math.sin(delta2) - g*math.cos(delta2)*nuk
    a3m1=(g*(m1*math.sin(delta1) - m2*math.sin(delta2) - nuk*m1*math.cos(delta1) - nuk*m2*math.cos(delta2)))/(m1+m2)
    a3m2=(g*(m2*math.sin(delta2) - m1*math.sin(delta1) - nuk*m1*math.cos(delta1) - nuk*m2*math.cos(delta2)))/(m1+m2)
    if t1==0:
        if g*math.sin(delta1) > g*math.cos(delta1)*nus :
            if  (0.5 * (t2**2) * a1) >= a-(s/2.0)-0.1 :
                x1=0.0
            else:
                x1=a-(s/2.0)-0.1-(0.5 * (t2**2) * a1)
        else:
            x1=a-(s/2.0)-0.1
        if g*math.sin(delta2) > g*math.cos(delta2)*nus :
            if  (0.5 * (t2**2) * a2) >= b-(s/2.0)-0.1 :
                x2=0.0
            else:
                x2=b-(s/2.0)-0.1-(0.5 * (t2**2) * a2)
        else:
            x2=b-(s/2.0)-0.1
        return [x1,x2]
    elif abs(m1*math.sin(delta1) - m2*math.sin(delta2)) <= abs(nus*m1*math.cos(delta1) + nus*m2*math.cos(delta2)):
        if g*math.sin(delta1) > g*math.cos(delta1)*nus :
            if (0.5*a1*(t2**2)) >= a-(s/2.0)-0.1 :
                x1=0.0
            else:
                x1=a - (s/2.0) - 0.1 - (0.5*a1*(t2**2))
        else:
            x1=a-s/2.0-0.1
        if g*math.sin(delta2) > g*math.cos(delta2)*nus :
            if (0.5 * (t2**2) * a2) >= b-(s/2.0)-0.1 :
                x2=0.0
            else:
                x2=b-(s/2.0)-0.1-(0.5 * (t2**2) * a2)
        else:
            x2= b-s/2.0-0.1
        return [x1,x2]
    elif m1*math.sin(delta1) - m2*math.sin(delta2) > nus*m1*math.cos(delta1) + nus*m2*math.cos(delta2) :
        if 0.5 * a3m1 * (t1**2) >= s/2 :
            if  0.5*a1*(t2**2) >= a-s-0.1 :
                x1=0.0
            else:
                x1=a - s - 0.1 - 0.5*a1*(t2**2)
            if m2*math.sin(delta2) > m2*math.cos(delta2)*nus :
               if b-0.1-0.5*a2*(t2**2) <= 0 :
                   x2=0.0
               else:
                   x2=b-0.1-0.5*a2*(t2**2)
            else:
                x2=b-0.1
            return [x1,x2]
        else:
            if a-s/2 - 0.1 > a3m1*t1*t2 + 0.5*a1*(t2**2) :
                x1=a-s/2 - 0.1 - a3m1*t1*t2 - 0.5*a1*(t2**2)
            else:
                x1=0.0
            xilk=0.5*a3m1*(t1**2)
            vson=a3m1*t1
            xson=(vson**2)/(2*g*math.sin(delta2)+2*g*math.cos(delta2)*nuk)
            acikis=g*math.sin(delta2)+g*math.cos(delta2)*nuk
            if xson <= s/2 - xilk :
            	if b > s/2-(xilk+(vson*t2 - 0.5*acikis*(t2**2) - (0.5*a2*((t2)**2)))) :
               	    x2=b - (s/2-(xilk+(vson*t2 - 0.5*acikis*(t2**2) - (0.5*a2*((t2)**2)))))
                else:
                    x2=0.0
            else:
                if g*math.sin(delta2) > g*math.cos(delta2)*nus :
                    if ((vson**2)-2*acikis*(s/2.0-xilk)) >= 0 :
                        if (vson + ((vson**2)-2*acikis*(s/2.0-xilk))**0.5)/(2*acikis) >= 0 :
                            tus=(vson+ ((vson**2)-2*acikis*(s/2.0-xilk))**0.5)/(2*acikis)
                            if b > (0.5*a2*((t2-tus)**2)+0.1):
                                x2=b - (0.5*a2*((t2-tus)**2)+0.1)
                            else:
                                x2=0.0
                        else:
                            tus=(vson - ((vson**2)-2*acikis*(s/2.0-xilk))**0.5)/(2*acikis)
                            if b > (0.5*a2*((t2-tus)**2)+0.1):
                                x2=b - (0.5*a2*((t2-tus)**2)+0.1)
                            else:
                                x2=0.0
                    else:
                        x2= b-(s/2-(xilk+vson*t2 - 0.5*(acikis+a2)*(t2**2)))
                else:
                    x2= b-0.1
        return [x1,x2]
    elif m2*math.sin(delta2) - m1*math.sin(delta1) > nus*m1*math.cos(delta1) + nus*m2*math.cos(delta2) :
        if 0.5 * a3m2 * (t1**2) >= s/2 :
            if  0.5*a2*(t2**2) >= b-s-0.1 :
                x2=0.0
            else:
                x2=b - s - 0.1 - 0.5*a2*(t2**2)
            if m1*math.sin(delta1) > m1*math.cos(delta1)*nus :
               if a-0.1-0.5*a1*(t2**2) <= 0 :
                   x1= 0.0
               else:
                   x1=a-0.1-0.5*a1*(t2**2)
            else:
                x1=a-0.1
            return [x1,x2]
        else:
            if b-s/2 - 0.1 > a3m2*t1*t2 + 0.5*a2*(t2**2) :
                x2=b-s/2 - 0.1 - a3m2*t1*t2 - 0.5*a2*(t2**2)
            else:
                x2=0.0
            xilk=0.5*a3m2*(t1**2)
            vson=a3m2*t1
            xson=(vson**2)/(2*g*math.sin(delta1)+2*g*math.cos(delta1)*nuk)
            acikis=g*math.sin(delta1)+g*math.cos(delta1)*nuk
            if xson <= s/2 - xilk :
            	if a > s/2-(xilk+(vson*t2 - 0.5*acikis*(t2**2) - (0.5*a1*((t2)**2)))) :
               	    x1=a - (s/2-(xilk+(vson*t2 - 0.5*acikis*(t2**2) - (0.5*a1*((t2)**2)))))
                else:
                    x1=0.0
            else:
                if g*math.sin(delta1) > g*math.cos(delta1)*nus :
                    if ((vson**2)-2*acikis*(s/2.0-xilk)) >= 0 :
                        if (vson + ((vson**2)-2*acikis*(s/2.0-xilk))**0.5)/(2*acikis) >= 0 :
                            tus=(vson+ ((vson**2)-2*acikis*(s/2.0-xilk))**0.5)/(2*acikis)
                            if a > (0.5*a1*((t2-tus)**2)+0.1):
                                x1=a - (0.5*a1*((t2-tus)**2)+0.1)
                            else:
                                x1=0.0
                        else:
                            tus=(vson - ((vson**2)-2*acikis*(s/2.0-xilk))**0.5)/(2*acikis)
                            if a > (0.5*a1*((t2-tus)**2)+0.1):
                                x1=a - (0.5*a1*((t2-tus)**2)+0.1)
                            else:
                                x1=0.0
                    else:
                        x1= a-(s/2-(xilk+vson*t2 - 0.5*(acikis+a1)*(t2**2)))

                else:
                    x1= a-0.1
        return [x1,x2]
