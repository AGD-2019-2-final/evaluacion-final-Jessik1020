import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    total = None
    total1 = None

    
    for line in sys.stdin:

        key, val = line.split("\t")
        val = float(val)
        
        if total is None:
          total = val

        if total1 is None:
          total1 = val

        if key == curkey:
            
            total = max(total, val)
            total1= min(total1, val)
        else:
           
            if curkey is not None:
                
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, total, total1))

            curkey = key
            total = val
            total1 = val
     
    sys.stdout.write("{}\t{}\t{}\n".format(curkey, total, total1))
