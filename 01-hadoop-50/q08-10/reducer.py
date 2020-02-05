import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    total = 0
    total1 = 0

    
    for line in sys.stdin:

        key, val = line.split("\t")
        val = float(val)
        
        

        if key == curkey:
            
            total += val
            total1 = total1 + 1 
        else:
           
            if curkey is not None:
                
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, total, float(total/total1)))

                total1 =1
                total =val
                curkey = key
            else:
                curkey = key
                total=val
                total1=1
     
    sys.stdout.write("{}\t{}\t{}\n".format(curkey, total, float(total/total1)))